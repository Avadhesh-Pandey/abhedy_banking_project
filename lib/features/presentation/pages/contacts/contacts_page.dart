import 'dart:async';

import 'package:abhedy_banking_project/core/constants/color_constants.dart';
import 'package:abhedy_banking_project/features/data/datasource/abhedy_queries.dart';
import 'package:abhedy_banking_project/features/data/model/contacts_model.dart';
import 'package:abhedy_banking_project/features/presentation/pages/main/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  static const id="contacts";

  Future<bool> goBack(BuildContext context)
  {
    // GoRouter.of(context).pop();
    context.go("/${MainPage.id}");
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => goBack(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Contacts us",style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),),
          backgroundColor: kPrimaryColour,
          iconTheme: const IconThemeData(color: Colors.white),
          leading: IconButton(icon: const Icon(Icons.arrow_back),onPressed: (){
            goBack(context);
          },),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Query(
            options: QueryOptions(
              document: gql(getContactsRepo),
            ),
            builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
              if (result.hasException) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(result.exception!.graphqlErrors.first.message,style: const TextStyle(fontSize: 16,color: Colors.red),),
                      Text(result.exception!.graphqlErrors.first.extensions!["code"].toString(),style: const TextStyle(fontSize: 12,color: Colors.black),),
                      Text(result.exception!.graphqlErrors.first.extensions!["stacktrace"].toString(),style: const TextStyle(fontSize: 12,color: Colors.black87),),
                    ],
                  ),
                );
              }

              if (result.isLoading) {
                return const Text('Loading');
              }

              var data = ContactsModel.fromJson(result.data);

              if(data.errors==null || data.errors!.isEmpty)
              {
                return const Text('No Record(s) Found');
              }

              return Text(data.data.toString());
            },
          ),
        ),
      ),
    );
  }
}
