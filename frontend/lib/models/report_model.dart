class ReportModel {
  String type;
  String location;

  ReportModel({
    required this.type,
    required this.location,
  });



  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      type: json['type'] as String,
      location: json['location'] as String,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'location': location,
    };
  }
}

class ReportModelId {
  int id;
  String type;
  String location;

  ReportModelId({
    required this.id,
    required this.type,
    required this.location,
  });



  factory ReportModelId.fromJson(Map<String, dynamic> json) {
    return ReportModelId(
      id: json['id'] as int,
      type: json['type'] as String,
      location: json['location'] as String,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'location': location,
    };
  }
}