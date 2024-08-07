import 'package:equatable/equatable.dart';

class Job extends Equatable {
  const Job({
    required this.id,
    required this.name,
    required this.status,
    required this.payload,
  });

  final String id;
  final String name;
  final String status;
  final Map<String, dynamic> payload;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
