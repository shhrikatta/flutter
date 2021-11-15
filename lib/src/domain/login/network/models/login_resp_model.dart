/// status : "success"

class LoginRespModel {
  LoginRespModel({
    String? status,
  }) {
    _status = status;
  }

  LoginRespModel.fromJson(dynamic json) {
    _status = json['status'];
  }
  String? _status;

  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    return map;
  }
}
