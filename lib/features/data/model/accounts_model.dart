/// accounts : [{"id":"726e7b45-a220-40fd-b732-2a973799eea0","accountNumber":"5034076330","accountType":"Checking","balance":7630.84,"accountHolder":"Rowland Hahn"},{"id":"0831d83f-7f1f-484c-a457-38de0f1bf269","accountNumber":"2660025274","accountType":"Checking","balance":2015.37,"accountHolder":"Delmer Ferry"},{"id":"b3ef5eb6-e676-4d9d-9d13-baeb8813b49f","accountNumber":"3265335083","accountType":"Savings","balance":8024.43,"accountHolder":"June Mertz"},{"id":"e2198a26-613d-494f-a853-1248d81a15db","accountNumber":"8782710132","accountType":"Savings","balance":4894.23,"accountHolder":"Dennis Boehm"},{"id":"c9b8c9a3-6bfb-4b06-9b01-a16ec0935015","accountNumber":"8839057784","accountType":"Checking","balance":5534.33,"accountHolder":"Kip Romaguera"},{"id":"ce8b8a5d-c2bb-4018-9cb3-9f74d707baf0","accountNumber":"5362083666","accountType":"Checking","balance":5099.4,"accountHolder":"Aleen Schmitt"},{"id":"aeef29c7-6c53-4276-b270-0cc962846fa1","accountNumber":"5720254609","accountType":"Savings","balance":3662.99,"accountHolder":"Coleman Reynolds"},{"id":"28704030-062f-44e1-a9e1-1a56601927e1","accountNumber":"9380025346","accountType":"Checking","balance":9903.73,"accountHolder":"Lucile Murazik"},{"id":"349f00dd-2ebb-4c10-9bd0-166b2b216879","accountNumber":"2055681151","accountType":"Checking","balance":3503.98,"accountHolder":"Winston Kessler"},{"id":"5ef25fb0-bdac-4f03-b8b3-36a2166efb4e","accountNumber":"4536636425","accountType":"Savings","balance":7043.39,"accountHolder":"Boyd Schumm"}]

class AccountsModel {
  AccountsModel({
      List<Accounts>? accounts,}){
    _accounts = accounts;
}

  AccountsModel.fromJson(dynamic json) {
    if (json['accounts'] != null) {
      _accounts = [];
      json['accounts'].forEach((v) {
        _accounts?.add(Accounts.fromJson(v));
      });
    }
  }
  List<Accounts>? _accounts;
AccountsModel copyWith({  List<Accounts>? accounts,
}) => AccountsModel(  accounts: accounts ?? _accounts,
);
  List<Accounts>? get accounts => _accounts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_accounts != null) {
      map['accounts'] = _accounts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "726e7b45-a220-40fd-b732-2a973799eea0"
/// accountNumber : "5034076330"
/// accountType : "Checking"
/// balance : 7630.84
/// accountHolder : "Rowland Hahn"

class Accounts {
  Accounts({
      String? id, 
      String? accountNumber, 
      String? accountType, 
      num? balance, 
      String? accountHolder,}){
    _id = id;
    _accountNumber = accountNumber;
    _accountType = accountType;
    _balance = balance;
    _accountHolder = accountHolder;
}

  Accounts.fromJson(dynamic json) {
    _id = json['id'];
    _accountNumber = json['accountNumber'];
    _accountType = json['accountType'];
    _balance = json['balance'];
    _accountHolder = json['accountHolder'];
  }
  String? _id;
  String? _accountNumber;
  String? _accountType;
  num? _balance;
  String? _accountHolder;
Accounts copyWith({  String? id,
  String? accountNumber,
  String? accountType,
  num? balance,
  String? accountHolder,
}) => Accounts(  id: id ?? _id,
  accountNumber: accountNumber ?? _accountNumber,
  accountType: accountType ?? _accountType,
  balance: balance ?? _balance,
  accountHolder: accountHolder ?? _accountHolder,
);
  String? get id => _id;
  String? get accountNumber => _accountNumber;
  String? get accountType => _accountType;
  num? get balance => _balance;
  String? get accountHolder => _accountHolder;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['accountNumber'] = _accountNumber;
    map['accountType'] = _accountType;
    map['balance'] = _balance;
    map['accountHolder'] = _accountHolder;
    return map;
  }

}