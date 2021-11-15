/// id : 1
/// firstName : "Chandler"
/// lastName : "Bing"
/// profileImage : "https://pbs.twimg.com/profile_images/1257292276209979392/ELX3_1oY_400x400.jpg"

class ProfileModel {
  ProfileModel({
    int? id,
    String? firstName,
    String? lastName,
    String? profileImage,
  }) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _profileImage = profileImage;
  }

  ProfileModel.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _profileImage = json['profileImage'];
  }
  int? _id;
  String? _firstName;
  String? _lastName;
  String? _profileImage;

  int? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get profileImage => _profileImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['profileImage'] = _profileImage;
    return map;
  }
}
