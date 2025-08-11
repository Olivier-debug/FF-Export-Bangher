// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:swipable_stack/swipable_stack.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SwipeCardStack extends StatefulWidget {
  const SwipeCardStack({
    super.key,
    this.width,
    this.height,
    required this.swiperId, // Only swiperId is required
  });

  final double? width;
  final double? height;
  final String swiperId;

  @override
  State<SwipeCardStack> createState() => _SwipeCardStackState();
}

class _SwipeCardStackState extends State<SwipeCardStack> {
  // State Management
  final SwipableStackController _controller = SwipableStackController();
  final Map<int, int> _photoIndexes = {};
  final Set<String> _swipedProfileIds = {}; // Track swiped profiles by ID
  List<Map<String, dynamic>> _cardsData = []; // Dynamic list of cards
  int _currentBatchOffset = 0;
  static const int _batchSize = 10; // Load 10 profiles at a time
  bool _isLoading = false;
  double heartScale = 1.0;
  double xScale = 1.0;
  double undoScale = 1.0;
  double starScale = 1.0;
  double boostScale = 1.0;

  // User preferences
  String _preferredGender = 'F'; // Default
  double _preferredRadius = 50.0; // Default in km
  int _preferredAgeMin = 18; // Default
  int _preferredAgeMax = 60; // Default

  @override
  void initState() {
    super.initState();
    _loadUserPreferences().then((_) {
      _loadInitialBatch();
    });
  }

  // Fetch user preferences from Supabase
  Future<void> _loadUserPreferences() async {
    try {
      final response = await Supabase.instance.client
          .from('preferences')
          .select('interested_in_gender, age_min, age_max, distance_radius')
          .eq('user_id', widget.swiperId)
          .maybeSingle();

      if (response != null) {
        final data = Map<String, dynamic>.from(response);
        setState(() {
          _preferredGender = data['interested_in_gender'] ?? 'F';
          _preferredAgeMin = data['age_min'] ?? 18;
          _preferredAgeMax = data['age_max'] ?? 60;
          _preferredRadius = (data['distance_radius'] ?? 50.0).toDouble();
        });
      }
    } catch (e) {
      print('Error loading user preferences: $e');
      // Fallback to defaults if error occurs
    }
  }

  // Fetch a batch of profiles from Supabase
  Future<void> _loadBatch() async {
    if (_isLoading) return;

    setState(() => _isLoading = true);
    try {
      final response =
          await Supabase.instance.client.rpc('get_potential_matches', params: {
        'user_id_arg': widget.swiperId,
        'gender_arg': _preferredGender,
        'radius_arg': _preferredRadius,
        'age_min_arg': _preferredAgeMin,
        'age_max_arg': _preferredAgeMax,
        'limit_arg': _batchSize,
      });

      final newData = (response as List)
          .map((item) => Map<String, dynamic>.from(item))
          .toList();

      // Get existing profile IDs in _cardsData
      final existingProfileIds = _cardsData
          .map((card) => card['potential_match_id']?.toString() ?? '')
          .toSet();

      // Filter out already swiped profiles and duplicates
      final filteredData = newData.where((card) {
        final potentialMatchId = card['potential_match_id']?.toString() ?? '';
        return !_swipedProfileIds.contains(potentialMatchId) &&
            !existingProfileIds.contains(potentialMatchId);
      }).toList();

      setState(() {
        _cardsData.addAll(filteredData);
        _currentBatchOffset += _batchSize;
      });

      // Load more if the stack is low (less than 3 cards left)
      if (_cardsData.length < 3 && filteredData.isNotEmpty) {
        _loadBatch();
      }
    } catch (e) {
      print('Error loading batch: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // Initial load
  void _loadInitialBatch() {
    _loadBatch();
  }

  // Photo navigation
  void _changePhoto(int index, bool isNext, List<String> photos) {
    if (photos.isEmpty) return;
    setState(() {
      _photoIndexes[index] = (_photoIndexes[index] ?? 0) + (isNext ? 1 : -1);
      _photoIndexes[index] = _photoIndexes[index]!.clamp(0, photos.length - 1);
    });
  }

  // Swipe action management
  void _undoLastSwipe() {
    if (_swipedProfileIds.isNotEmpty) {
      final lastSwipedId = _swipedProfileIds.last;
      setState(() {
        _swipedProfileIds.remove(lastSwipedId);
        _controller.rewind();
      });
    }
  }

  void _triggerSwipe(SwipeDirection direction) {
    setState(() {
      _controller.next(swipeDirection: direction);
    });
  }

  Future<void> _handleSwipe(String swipeeId, bool liked) async {
    if (swipeeId.isEmpty) {
      print('Error: swipeeId is empty, cannot record swipe');
      return;
    }
    try {
      print(
          'Calling handle_swipe with: swiper_id=${widget.swiperId}, swipee_id=$swipeeId, liked=$liked');
      final response =
          await Supabase.instance.client.rpc('handle_swipe', params: {
        'swiper_id_arg': widget.swiperId,
        'swipee_id_arg': swipeeId,
        'liked_arg': liked,
      });
      print(
          'Swipe recorded: ${liked ? "Like" : "Nope"} for $swipeeId, Response: $response');
      setState(() {
        _swipedProfileIds.add(swipeeId); // Track swiped profile
      });
    } catch (e) {
      print('Error calling handle_swipe: $e');
    }
  }

  // Card UI
  Widget _buildCard(int index, Map<String, dynamic> data) {
    final name = data["name"] ?? "Unknown";
    final age = data["age"] ?? 0;
    final bio = data["bio"] ?? "No bio available";
    final distance = data["distance"] ?? "0 km away";
    final photos = (data["photos"] as List?)?.cast<String>() ?? [];
    final swipeeId = data["potential_match_id"]?.toString() ?? "";
    final bool hasPhotos = photos.isNotEmpty;

    _photoIndexes.putIfAbsent(index, () => 0);
    final int currentPhotoIndex = _photoIndexes[index]!;

    return GestureDetector(
      onTapUp: (details) {
        final screenWidth = MediaQuery.of(context).size.width;
        _changePhoto(index, details.localPosition.dx > screenWidth / 2, photos);
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.grey,
              child: CachedNetworkImage(
                imageUrl: hasPhotos
                    ? photos[currentPhotoIndex]
                    : "https://via.placeholder.com/300",
                fit: BoxFit.cover,
                placeholder: (_, __) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (_, __, ___) =>
                    const Icon(Icons.error, size: 50, color: Colors.red),
              ),
            ),
          ),
          if (hasPhotos)
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  photos.length,
                  (dotIndex) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: dotIndex == currentPhotoIndex
                          ? Colors.pink
                          : Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(1),
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.3),
                  ],
                  stops: [0.0, 0.5, 1.0],
                ),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$name, $age",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    distance,
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    bio,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildAnimatedButton(
                        Icons.replay,
                        _swipedProfileIds.isEmpty ? Colors.grey : Colors.green,
                        _swipedProfileIds.isEmpty ? null : _undoLastSwipe,
                        undoScale,
                        (scale) => setState(() => undoScale = scale),
                      ),
                      _buildAnimatedButton(
                        Icons.cancel,
                        Colors.red,
                        () => _triggerSwipe(SwipeDirection.left),
                        xScale,
                        (scale) => setState(() => xScale = scale),
                      ),
                      _buildAnimatedButton(
                        Icons.star,
                        Colors.blue,
                        () {},
                        starScale,
                        (scale) => setState(() => starScale = scale),
                      ),
                      _buildAnimatedButton(
                        Icons.favorite,
                        Colors.pink,
                        () => _triggerSwipe(SwipeDirection.right),
                        heartScale,
                        (scale) => setState(() => heartScale = scale),
                      ),
                      _buildAnimatedButton(
                        Icons.flash_on,
                        Colors.purple,
                        () {},
                        boostScale,
                        (scale) => setState(() => boostScale = scale),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Button animation
  Widget _buildAnimatedButton(
    IconData icon,
    Color color,
    VoidCallback? onTap,
    double scale,
    Function(double) updateScale,
  ) {
    return GestureDetector(
      onTapDown:
          onTap != null ? (TapDownDetails details) => updateScale(1.2) : null,
      onTapUp: onTap != null
          ? (TapUpDetails details) {
              updateScale(1.0);
              onTap();
            }
          : null,
      onTapCancel: () => updateScale(1.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        transform: Matrix4.identity()..scale(scale),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.8),
          ),
          child: Icon(icon, color: Colors.white, size: 30),
        ),
      ),
    );
  }

  // Main builder
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SwipableStack(
              controller: _controller,
              itemCount: _cardsData.length,
              builder: (context, properties) {
                final index = properties.index;
                if (index >= _cardsData.length) {
                  return const Center(child: CircularProgressIndicator());
                }
                return _buildCard(index, _cardsData[index]);
              },
              onSwipeCompleted: (index, direction) {
                final swipeeId =
                    _cardsData[index]['potential_match_id']?.toString() ?? "";
                setState(() {
                  _swipedProfileIds.add(swipeeId);
                });
                if (direction == SwipeDirection.right) {
                  _handleSwipe(swipeeId, true);
                } else if (direction == SwipeDirection.left) {
                  _handleSwipe(swipeeId, false);
                }
                // Trigger new batch load if near the end
                if (index >= _cardsData.length - 2) {
                  _loadBatch();
                }
              },
            ),
          ),
          if (_isLoading)
            const Positioned.fill(
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
