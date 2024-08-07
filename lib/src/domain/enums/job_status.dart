enum JobStatus {
  pending,
  inProgress,
  completed,
  cancelled,
  failed;

  static JobStatus fromString(String value) {
    switch (value) {
      case 'pending':
        return JobStatus.pending;
      case 'inProgress':
        return JobStatus.inProgress;
      case 'completed':
        return JobStatus.completed;
      case 'cancelled':
        return JobStatus.cancelled;
      case 'failed':
        return JobStatus.failed;
      default:
        throw ArgumentError('Invalid job status: $value');
    }
  }

  String get name {
    switch (this) {
      case JobStatus.pending:
        return 'pending';
      case JobStatus.inProgress:
        return 'inProgress';
      case JobStatus.completed:
        return 'completed';
      case JobStatus.cancelled:
        return 'cancelled';
      case JobStatus.failed:
        return 'failed';
    }
  }
}
