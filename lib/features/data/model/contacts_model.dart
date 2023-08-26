/// errors : [{"message":"Error getting contacts.","locations":[{"line":2,"column":3}],"path":["contacts"],"extensions":{"code":"INTERNAL_SERVER_ERROR","stacktrace":["Error: Error getting contacts.","    at contacts (file:///Users/User/Downloads/apollo_graphql_flutter/dist/index.js:93:19)","    at MockStore.generateFieldValueFromMocks (file:///Users/User/Downloads/apollo_graphql_flutter/node_modules/@graphql-tools/mock/esm/MockStore.js:309:29)","    at MockStore.generateFieldValue (file:///Users/User/Downloads/apollo_graphql_flutter/node_modules/@graphql-tools/mock/esm/MockStore.js:285:34)","    at MockStore.getImpl (file:///Users/User/Downloads/apollo_graphql_flutter/node_modules/@graphql-tools/mock/esm/MockStore.js:142:30)","    at MockStore.get (file:///Users/User/Downloads/apollo_graphql_flutter/node_modules/@graphql-tools/mock/esm/MockStore.js:31:29)","    at mockResolver (file:///Users/User/Downloads/apollo_graphql_flutter/node_modules/@graphql-tools/mock/esm/addMocksToSchema.js:101:26)","    at field.resolve (file:///Users/User/Downloads/apollo_graphql_flutter/node_modules/@apollo/server/dist/esm/utils/schemaInstrumentation.js:36:28)","    at executeField (/Users/User/Downloads/apollo_graphql_flutter/node_modules/graphql/execution/execute.js:492:20)","    at executeFields (/Users/User/Downloads/apollo_graphql_flutter/node_modules/graphql/execution/execute.js:414:22)","    at executeOperation (/Users/User/Downloads/apollo_graphql_flutter/node_modules/graphql/execution/execute.js:344:14)"]}}]
/// data : {"contacts":null}

class ContactsModel {
  ContactsModel({
      List<Errors>? errors, 
      Data? data,}){
    _errors = errors;
    _data = data;
}

  ContactsModel.fromJson(dynamic json) {
    if (json['errors'] != null) {
      _errors = [];
      json['errors'].forEach((v) {
        _errors?.add(Errors.fromJson(v));
      });
    }
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  List<Errors>? _errors;
  Data? _data;
ContactsModel copyWith({  List<Errors>? errors,
  Data? data,
}) => ContactsModel(  errors: errors ?? _errors,
  data: data ?? _data,
);
  List<Errors>? get errors => _errors;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_errors != null) {
      map['errors'] = _errors?.map((v) => v.toJson()).toList();
    }
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// contacts : null

class Data {
  Data({
      dynamic contacts,}){
    _contacts = contacts;
}

  Data.fromJson(dynamic json) {
    _contacts = json['contacts'];
  }
  dynamic _contacts;
Data copyWith({  dynamic contacts,
}) => Data(  contacts: contacts ?? _contacts,
);
  dynamic get contacts => _contacts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['contacts'] = _contacts;
    return map;
  }

}

/// message : "Error getting contacts."
/// locations : [{"line":2,"column":3}]
/// path : ["contacts"]
/// extensions : {"code":"INTERNAL_SERVER_ERROR","stacktrace":["Error: Error getting contacts.","    at contacts (file:///Users/User/Downloads/apollo_graphql_flutter/dist/index.js:93:19)","    at MockStore.generateFieldValueFromMocks (file:///Users/User/Downloads/apollo_graphql_flutter/node_modules/@graphql-tools/mock/esm/MockStore.js:309:29)","    at MockStore.generateFieldValue (file:///Users/User/Downloads/apollo_graphql_flutter/node_modules/@graphql-tools/mock/esm/MockStore.js:285:34)","    at MockStore.getImpl (file:///Users/User/Downloads/apollo_graphql_flutter/node_modules/@graphql-tools/mock/esm/MockStore.js:142:30)","    at MockStore.get (file:///Users/User/Downloads/apollo_graphql_flutter/node_modules/@graphql-tools/mock/esm/MockStore.js:31:29)","    at mockResolver (file:///Users/User/Downloads/apollo_graphql_flutter/node_modules/@graphql-tools/mock/esm/addMocksToSchema.js:101:26)","    at field.resolve (file:///Users/User/Downloads/apollo_graphql_flutter/node_modules/@apollo/server/dist/esm/utils/schemaInstrumentation.js:36:28)","    at executeField (/Users/User/Downloads/apollo_graphql_flutter/node_modules/graphql/execution/execute.js:492:20)","    at executeFields (/Users/User/Downloads/apollo_graphql_flutter/node_modules/graphql/execution/execute.js:414:22)","    at executeOperation (/Users/User/Downloads/apollo_graphql_flutter/node_modules/graphql/execution/execute.js:344:14)"]}

class Errors {
  Errors({
      String? message, 
      List<Locations>? locations, 
      List<String>? path, 
      Extensions? extensions,}){
    _message = message;
    _locations = locations;
    _path = path;
    _extensions = extensions;
}

  Errors.fromJson(dynamic json) {
    _message = json['message'];
    if (json['locations'] != null) {
      _locations = [];
      json['locations'].forEach((v) {
        _locations?.add(Locations.fromJson(v));
      });
    }
    _path = json['path'] != null ? json['path'].cast<String>() : [];
    _extensions = json['extensions'] != null ? Extensions.fromJson(json['extensions']) : null;
  }
  String? _message;
  List<Locations>? _locations;
  List<String>? _path;
  Extensions? _extensions;
Errors copyWith({  String? message,
  List<Locations>? locations,
  List<String>? path,
  Extensions? extensions,
}) => Errors(  message: message ?? _message,
  locations: locations ?? _locations,
  path: path ?? _path,
  extensions: extensions ?? _extensions,
);
  String? get message => _message;
  List<Locations>? get locations => _locations;
  List<String>? get path => _path;
  Extensions? get extensions => _extensions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_locations != null) {
      map['locations'] = _locations?.map((v) => v.toJson()).toList();
    }
    map['path'] = _path;
    if (_extensions != null) {
      map['extensions'] = _extensions?.toJson();
    }
    return map;
  }

}

/// code : "INTERNAL_SERVER_ERROR"
/// stacktrace : ["Error: Error getting contacts.","    at contacts (file:///Users/User/Downloads/apollo_graphql_flutter/dist/index.js:93:19)","    at MockStore.generateFieldValueFromMocks (file:///Users/User/Downloads/apollo_graphql_flutter/node_modules/@graphql-tools/mock/esm/MockStore.js:309:29)","    at MockStore.generateFieldValue (file:///Users/User/Downloads/apollo_graphql_flutter/node_modules/@graphql-tools/mock/esm/MockStore.js:285:34)","    at MockStore.getImpl (file:///Users/User/Downloads/apollo_graphql_flutter/node_modules/@graphql-tools/mock/esm/MockStore.js:142:30)","    at MockStore.get (file:///Users/User/Downloads/apollo_graphql_flutter/node_modules/@graphql-tools/mock/esm/MockStore.js:31:29)","    at mockResolver (file:///Users/User/Downloads/apollo_graphql_flutter/node_modules/@graphql-tools/mock/esm/addMocksToSchema.js:101:26)","    at field.resolve (file:///Users/User/Downloads/apollo_graphql_flutter/node_modules/@apollo/server/dist/esm/utils/schemaInstrumentation.js:36:28)","    at executeField (/Users/User/Downloads/apollo_graphql_flutter/node_modules/graphql/execution/execute.js:492:20)","    at executeFields (/Users/User/Downloads/apollo_graphql_flutter/node_modules/graphql/execution/execute.js:414:22)","    at executeOperation (/Users/User/Downloads/apollo_graphql_flutter/node_modules/graphql/execution/execute.js:344:14)"]

class Extensions {
  Extensions({
      String? code, 
      List<String>? stacktrace,}){
    _code = code;
    _stacktrace = stacktrace;
}

  Extensions.fromJson(dynamic json) {
    _code = json['code'];
    _stacktrace = json['stacktrace'] != null ? json['stacktrace'].cast<String>() : [];
  }
  String? _code;
  List<String>? _stacktrace;
Extensions copyWith({  String? code,
  List<String>? stacktrace,
}) => Extensions(  code: code ?? _code,
  stacktrace: stacktrace ?? _stacktrace,
);
  String? get code => _code;
  List<String>? get stacktrace => _stacktrace;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['stacktrace'] = _stacktrace;
    return map;
  }

}

/// line : 2
/// column : 3

class Locations {
  Locations({
      num? line, 
      num? column,}){
    _line = line;
    _column = column;
}

  Locations.fromJson(dynamic json) {
    _line = json['line'];
    _column = json['column'];
  }
  num? _line;
  num? _column;
Locations copyWith({  num? line,
  num? column,
}) => Locations(  line: line ?? _line,
  column: column ?? _column,
);
  num? get line => _line;
  num? get column => _column;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['line'] = _line;
    map['column'] = _column;
    return map;
  }

}