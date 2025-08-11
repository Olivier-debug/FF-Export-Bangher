import '../database.dart';

class PgStatMonitorTable extends SupabaseTable<PgStatMonitorRow> {
  @override
  String get tableName => 'pg_stat_monitor';

  @override
  PgStatMonitorRow createRow(Map<String, dynamic> data) =>
      PgStatMonitorRow(data);
}

class PgStatMonitorRow extends SupabaseDataRow {
  PgStatMonitorRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PgStatMonitorTable();

  int? get bucket => getField<int>('bucket');
  set bucket(int? value) => setField<int>('bucket', value);

  DateTime? get bucketStartTime => getField<DateTime>('bucket_start_time');
  set bucketStartTime(DateTime? value) =>
      setField<DateTime>('bucket_start_time', value);

  String? get userid => getField<String>('userid');
  set userid(String? value) => setField<String>('userid', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get dbid => getField<String>('dbid');
  set dbid(String? value) => setField<String>('dbid', value);

  String? get datname => getField<String>('datname');
  set datname(String? value) => setField<String>('datname', value);

  String? get clientIp => getField<String>('client_ip');
  set clientIp(String? value) => setField<String>('client_ip', value);

  int? get pgsmQueryId => getField<int>('pgsm_query_id');
  set pgsmQueryId(int? value) => setField<int>('pgsm_query_id', value);

  int? get queryid => getField<int>('queryid');
  set queryid(int? value) => setField<int>('queryid', value);

  bool? get toplevel => getField<bool>('toplevel');
  set toplevel(bool? value) => setField<bool>('toplevel', value);

  int? get topQueryid => getField<int>('top_queryid');
  set topQueryid(int? value) => setField<int>('top_queryid', value);

  String? get query => getField<String>('query');
  set query(String? value) => setField<String>('query', value);

  String? get comments => getField<String>('comments');
  set comments(String? value) => setField<String>('comments', value);

  int? get planid => getField<int>('planid');
  set planid(int? value) => setField<int>('planid', value);

  String? get queryPlan => getField<String>('query_plan');
  set queryPlan(String? value) => setField<String>('query_plan', value);

  String? get topQuery => getField<String>('top_query');
  set topQuery(String? value) => setField<String>('top_query', value);

  String? get applicationName => getField<String>('application_name');
  set applicationName(String? value) =>
      setField<String>('application_name', value);

  List<String> get relations => getListField<String>('relations');
  set relations(List<String>? value) =>
      setListField<String>('relations', value);

  int? get cmdType => getField<int>('cmd_type');
  set cmdType(int? value) => setField<int>('cmd_type', value);

  String? get cmdTypeText => getField<String>('cmd_type_text');
  set cmdTypeText(String? value) => setField<String>('cmd_type_text', value);

  int? get elevel => getField<int>('elevel');
  set elevel(int? value) => setField<int>('elevel', value);

  String? get sqlcode => getField<String>('sqlcode');
  set sqlcode(String? value) => setField<String>('sqlcode', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);

  int? get calls => getField<int>('calls');
  set calls(int? value) => setField<int>('calls', value);

  double? get totalExecTime => getField<double>('total_exec_time');
  set totalExecTime(double? value) =>
      setField<double>('total_exec_time', value);

  double? get minExecTime => getField<double>('min_exec_time');
  set minExecTime(double? value) => setField<double>('min_exec_time', value);

  double? get maxExecTime => getField<double>('max_exec_time');
  set maxExecTime(double? value) => setField<double>('max_exec_time', value);

  double? get meanExecTime => getField<double>('mean_exec_time');
  set meanExecTime(double? value) => setField<double>('mean_exec_time', value);

  double? get stddevExecTime => getField<double>('stddev_exec_time');
  set stddevExecTime(double? value) =>
      setField<double>('stddev_exec_time', value);

  int? get rows => getField<int>('rows');
  set rows(int? value) => setField<int>('rows', value);

  int? get sharedBlksHit => getField<int>('shared_blks_hit');
  set sharedBlksHit(int? value) => setField<int>('shared_blks_hit', value);

  int? get sharedBlksRead => getField<int>('shared_blks_read');
  set sharedBlksRead(int? value) => setField<int>('shared_blks_read', value);

  int? get sharedBlksDirtied => getField<int>('shared_blks_dirtied');
  set sharedBlksDirtied(int? value) =>
      setField<int>('shared_blks_dirtied', value);

  int? get sharedBlksWritten => getField<int>('shared_blks_written');
  set sharedBlksWritten(int? value) =>
      setField<int>('shared_blks_written', value);

  int? get localBlksHit => getField<int>('local_blks_hit');
  set localBlksHit(int? value) => setField<int>('local_blks_hit', value);

  int? get localBlksRead => getField<int>('local_blks_read');
  set localBlksRead(int? value) => setField<int>('local_blks_read', value);

  int? get localBlksDirtied => getField<int>('local_blks_dirtied');
  set localBlksDirtied(int? value) =>
      setField<int>('local_blks_dirtied', value);

  int? get localBlksWritten => getField<int>('local_blks_written');
  set localBlksWritten(int? value) =>
      setField<int>('local_blks_written', value);

  int? get tempBlksRead => getField<int>('temp_blks_read');
  set tempBlksRead(int? value) => setField<int>('temp_blks_read', value);

  int? get tempBlksWritten => getField<int>('temp_blks_written');
  set tempBlksWritten(int? value) => setField<int>('temp_blks_written', value);

  double? get blkReadTime => getField<double>('blk_read_time');
  set blkReadTime(double? value) => setField<double>('blk_read_time', value);

  double? get blkWriteTime => getField<double>('blk_write_time');
  set blkWriteTime(double? value) => setField<double>('blk_write_time', value);

  double? get tempBlkReadTime => getField<double>('temp_blk_read_time');
  set tempBlkReadTime(double? value) =>
      setField<double>('temp_blk_read_time', value);

  double? get tempBlkWriteTime => getField<double>('temp_blk_write_time');
  set tempBlkWriteTime(double? value) =>
      setField<double>('temp_blk_write_time', value);

  List<String> get respCalls => getListField<String>('resp_calls');
  set respCalls(List<String>? value) =>
      setListField<String>('resp_calls', value);

  double? get cpuUserTime => getField<double>('cpu_user_time');
  set cpuUserTime(double? value) => setField<double>('cpu_user_time', value);

  double? get cpuSysTime => getField<double>('cpu_sys_time');
  set cpuSysTime(double? value) => setField<double>('cpu_sys_time', value);

  int? get walRecords => getField<int>('wal_records');
  set walRecords(int? value) => setField<int>('wal_records', value);

  int? get walFpi => getField<int>('wal_fpi');
  set walFpi(int? value) => setField<int>('wal_fpi', value);

  double? get walBytes => getField<double>('wal_bytes');
  set walBytes(double? value) => setField<double>('wal_bytes', value);

  bool? get bucketDone => getField<bool>('bucket_done');
  set bucketDone(bool? value) => setField<bool>('bucket_done', value);

  int? get plans => getField<int>('plans');
  set plans(int? value) => setField<int>('plans', value);

  double? get totalPlanTime => getField<double>('total_plan_time');
  set totalPlanTime(double? value) =>
      setField<double>('total_plan_time', value);

  double? get minPlanTime => getField<double>('min_plan_time');
  set minPlanTime(double? value) => setField<double>('min_plan_time', value);

  double? get maxPlanTime => getField<double>('max_plan_time');
  set maxPlanTime(double? value) => setField<double>('max_plan_time', value);

  double? get meanPlanTime => getField<double>('mean_plan_time');
  set meanPlanTime(double? value) => setField<double>('mean_plan_time', value);

  double? get stddevPlanTime => getField<double>('stddev_plan_time');
  set stddevPlanTime(double? value) =>
      setField<double>('stddev_plan_time', value);

  int? get jitFunctions => getField<int>('jit_functions');
  set jitFunctions(int? value) => setField<int>('jit_functions', value);

  double? get jitGenerationTime => getField<double>('jit_generation_time');
  set jitGenerationTime(double? value) =>
      setField<double>('jit_generation_time', value);

  int? get jitInliningCount => getField<int>('jit_inlining_count');
  set jitInliningCount(int? value) =>
      setField<int>('jit_inlining_count', value);

  double? get jitInliningTime => getField<double>('jit_inlining_time');
  set jitInliningTime(double? value) =>
      setField<double>('jit_inlining_time', value);

  int? get jitOptimizationCount => getField<int>('jit_optimization_count');
  set jitOptimizationCount(int? value) =>
      setField<int>('jit_optimization_count', value);

  double? get jitOptimizationTime => getField<double>('jit_optimization_time');
  set jitOptimizationTime(double? value) =>
      setField<double>('jit_optimization_time', value);

  int? get jitEmissionCount => getField<int>('jit_emission_count');
  set jitEmissionCount(int? value) =>
      setField<int>('jit_emission_count', value);

  double? get jitEmissionTime => getField<double>('jit_emission_time');
  set jitEmissionTime(double? value) =>
      setField<double>('jit_emission_time', value);
}
