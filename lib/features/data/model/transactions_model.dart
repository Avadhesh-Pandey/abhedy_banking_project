/// transactions : [{"date":"1990-01-09","description":"Quia at","amount":-350.97103798761964,"fromAccount":"Savings","toAccount":"External"},{"date":"1998-03-17","description":"Rerum tempore est","amount":491.27022735774517,"fromAccount":"Savings","toAccount":"External"},{"date":"2002-09-06","description":"Quasi similique","amount":-456.20761229656637,"fromAccount":"Credit Card","toAccount":"External"},{"date":"1986-10-07","description":"Recusandae error qui","amount":-158.298292895779,"fromAccount":"Checking","toAccount":"Cash"},{"date":"1975-11-02","description":"Ipsum pariatur iusto","amount":348.14153448678553,"fromAccount":"Checking","toAccount":"External"},{"date":"2000-06-27","description":"Est natus eius","amount":-448.71111074462533,"fromAccount":"Checking","toAccount":"External"},{"date":"1974-01-06","description":"Ut voluptatem","amount":286.4858864340931,"fromAccount":"Checking","toAccount":"Merchant"}]

class TransactionsModel {
  TransactionsModel({
      List<Transactions>? transactions,}){
    _transactions = transactions;
}

  TransactionsModel.fromJson(dynamic json) {
    if (json['transactions'] != null) {
      _transactions = [];
      json['transactions'].forEach((v) {
        _transactions?.add(Transactions.fromJson(v));
      });
    }
  }
  List<Transactions>? _transactions;
TransactionsModel copyWith({  List<Transactions>? transactions,
}) => TransactionsModel(  transactions: transactions ?? _transactions,
);
  List<Transactions>? get transactions => _transactions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_transactions != null) {
      map['transactions'] = _transactions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// date : "1990-01-09"
/// description : "Quia at"
/// amount : -350.97103798761964
/// fromAccount : "Savings"
/// toAccount : "External"

class Transactions {
  Transactions({
      String? date, 
      String? description, 
      num? amount, 
      String? fromAccount, 
      String? toAccount,}){
    _date = date;
    _description = description;
    _amount = amount;
    _fromAccount = fromAccount;
    _toAccount = toAccount;
}

  Transactions.fromJson(dynamic json) {
    _date = json['date'];
    _description = json['description'];
    _amount = json['amount'];
    _fromAccount = json['fromAccount'];
    _toAccount = json['toAccount'];
  }
  String? _date;
  String? _description;
  num? _amount;
  String? _fromAccount;
  String? _toAccount;
Transactions copyWith({  String? date,
  String? description,
  num? amount,
  String? fromAccount,
  String? toAccount,
}) => Transactions(  date: date ?? _date,
  description: description ?? _description,
  amount: amount ?? _amount,
  fromAccount: fromAccount ?? _fromAccount,
  toAccount: toAccount ?? _toAccount,
);
  String? get date => _date;
  String? get description => _description;
  num? get amount => _amount;
  String? get fromAccount => _fromAccount;
  String? get toAccount => _toAccount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['description'] = _description;
    map['amount'] = _amount;
    map['fromAccount'] = _fromAccount;
    map['toAccount'] = _toAccount;
    return map;
  }

}