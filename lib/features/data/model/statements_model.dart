/// statements : [{"date":"2020-4-28","description":"Laborum assumenda et recusandae vel.","amount":40086.27408184111},{"date":"2021-7-31","description":"Excepturi blanditiis animi voluptas laborum neque minima.","amount":64592.95121021569},{"date":"2022-11-13","description":"Labore possimus laborum porro.","amount":55623.296508565545},{"date":"2021-6-23","description":"Sit eligendi aut modi fugit est a quasi voluptate.","amount":48749.66251663864},{"date":"2023-2-28","description":"Laudantium omnis quo et delectus est.","amount":82233.69000479579},{"date":"2019-5-5","description":"Corrupti quisquam facere cumque quia fugit.","amount":44188.802829012275},{"date":"2022-11-15","description":"Corporis optio mollitia molestias accusantium rerum dolorum recusandae.","amount":6131.309038028121},{"date":"2021-5-14","description":"Omnis nihil impedit enim non voluptatem error facere sint.","amount":36395.75149863958},{"date":"2020-6-14","description":"Alias asperiores amet error magnam quasi voluptatem debitis voluptatum quis.","amount":-83764.08591866493},{"date":"2022-11-16","description":"Praesentium voluptas iste quasi expedita autem assumenda.","amount":-9951.580176129937},{"date":"2022-11-17","description":"Ratione ipsam beatae repudiandae quo ut repellendus fuga.","amount":35808.43834206462},{"date":"2021-7-4","description":"At quia incidunt aliquam quae provident nemo necessitatibus mollitia sed.","amount":46812.814520671964},{"date":"2023-8-1","description":"Dolor fugiat voluptas omnis officia aut velit.","amount":76240.08757993579},{"date":"2021-5-29","description":"Excepturi dolorum doloremque laborum repudiandae totam quia omnis.","amount":-99684.89394523203}]

class StatementsModel {
  StatementsModel({
      List<Statements>? statements,}){
    _statements = statements;
}

  StatementsModel.fromJson(dynamic json) {
    if (json['statements'] != null) {
      _statements = [];
      json['statements'].forEach((v) {
        _statements?.add(Statements.fromJson(v));
      });
    }
  }
  List<Statements>? _statements;
StatementsModel copyWith({  List<Statements>? statements,
}) => StatementsModel(  statements: statements ?? _statements,
);
  List<Statements>? get statements => _statements;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_statements != null) {
      map['statements'] = _statements?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// date : "2020-4-28"
/// description : "Laborum assumenda et recusandae vel."
/// amount : 40086.27408184111

class Statements {
  Statements({
      String? date, 
      String? description, 
      num? amount,}){
    _date = date;
    _description = description;
    _amount = amount;
}

  Statements.fromJson(dynamic json) {
    _date = json['date'];
    _description = json['description'];
    _amount = json['amount'];
  }
  String? _date;
  String? _description;
  num? _amount;
Statements copyWith({  String? date,
  String? description,
  num? amount,
}) => Statements(  date: date ?? _date,
  description: description ?? _description,
  amount: amount ?? _amount,
);
  String? get date => _date;
  String? get description => _description;
  num? get amount => _amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['description'] = _description;
    map['amount'] = _amount;
    return map;
  }

}