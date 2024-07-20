class Queue {
  int id;
  int officeId;
  int departmentId;
  int operationId;
  int number;
  bool called;
  DateTime estimatedTime;
  DateTime createdAt;
  DateTime updatedAt;

  Queue({
    required this.id,
    required this.officeId,
    required this.departmentId,
    required this.operationId,
    required this.number,
    required this.called,
    required this.estimatedTime,
    required this.createdAt,
    required this.updatedAt,
  });

  // Convert JSON to Queue object
  factory Queue.fromJson(Map<String, dynamic> json) {
    return Queue(
      id: json['id'],
      officeId: json['office_id'],
      departmentId: json['department_id'],
      operationId: json['operation_id'],
      number: json['number'],
      called: json['called'],
      estimatedTime: DateTime.parse(json['estimated_time']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  // Convert Queue object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'office_id': officeId,
      'department_id': departmentId,
      'operation_id': operationId,
      'number': number,
      'called': called,
      'estimated_time': estimatedTime.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
