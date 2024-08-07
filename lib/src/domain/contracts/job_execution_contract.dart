abstract class JobExecutionContract {
  Future<void> execute();

  String get name;

  Map<String, dynamic>? payload;
}
