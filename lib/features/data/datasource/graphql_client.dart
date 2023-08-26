import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final GraphQLClient client = GraphQLClient(
  link: kIsWeb ? HttpLink('http://localhost:4000') : HttpLink('http://192.168.225.60:4000'), // replace 192.168.225.60 with your device IP address as localhost would not work for AVD
  cache: GraphQLCache(),
);

late final ValueNotifier<GraphQLClient> clientNotifier = ValueNotifier<GraphQLClient>(client);
