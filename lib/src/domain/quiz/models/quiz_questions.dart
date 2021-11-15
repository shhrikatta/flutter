/// id : 1
/// question : "Flutter developed by?"
/// choices : [{"a":"Oracle","b":"Facebook","c":"Google","d":"IBM"}]

class QuizQuestions {
  QuizQuestions({
    int? id,
    String? question,
    List<String>? choices,
  }) {
    _id = id;
    _question = question;
    _choices = choices;
  }

  QuizQuestions.fromJson(dynamic json) {
    _id = json['id'];
    _question = json['question'];
    if (json['choices'] != null) {
      _choices = [];

      json['choices'].forEach((v) {
        // _choices?.add(Choices.fromJson(v));
        _choices = getListChoices(v);
      });
    }
  }
  int? _id;
  String? _question;
  List<String>? _choices;

  int? get id => _id;
  String? get question => _question;
  List<String>? get choices => _choices;

/*
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['question'] = _question;
    if (_choices != null) {
      map['choices'] = _choices?.map((v) => v.toJson()).toList();
    }
    return map;
  }
*/

  List<String> getListChoices(v) {
    List<String> _lChoices = [];
    _lChoices.add(v['a']);
    _lChoices.add(v['b']);
    _lChoices.add(v['c']);
    _lChoices.add(v['d']);
    return _lChoices;
  }
}

/// a : "Oracle"
/// b : "Facebook"
/// c : "Google"
/// d : "IBM"

class Choices {
  Choices({
    String? a,
    String? b,
    String? c,
    String? d,
  }) {
    _a = a;
    _b = b;
    _c = c;
    _d = d;
  }

  Choices.fromJson(dynamic json) {
    _a = json['a'];
    _b = json['b'];
    _c = json['c'];
    _d = json['d'];
  }
  String? _a;
  String? _b;
  String? _c;
  String? _d;

  String? get a => _a;
  String? get b => _b;
  String? get c => _c;
  String? get d => _d;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['a'] = _a;
    map['b'] = _b;
    map['c'] = _c;
    map['d'] = _d;
    return map;
  }
}
