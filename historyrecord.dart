class HistoryRecord {
  final double originalServing;
  final double desiredServing;
  final double originalAmount;
  final double newAmount;

  HistoryRecord({
    required this.originalServing,
    required this.desiredServing,
    required this.originalAmount,
    required this.newAmount,
  });

  Map<String, dynamic> toJson() => {
    'originalServing': originalServing,
    'desiredServing': desiredServing,
    'originalAmount': originalAmount,
    'newAmount': newAmount,
  };

  factory HistoryRecord.fromJson(Map<String, dynamic> json) => HistoryRecord(
    originalServing: json['originalServing'],
    desiredServing: json['desiredServing'],
    originalAmount: json['originalAmount'],
    newAmount: json['newAmount'],
  );
}
