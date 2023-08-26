import 'package:abhedy_banking_project/core/constants/color_constants.dart';
import 'package:abhedy_banking_project/features/data/model/accounts_model.dart';
import 'package:abhedy_banking_project/features/presentation/pages/accounts/subpages/transactions/transactions_list_page.dart';
import 'package:abhedy_banking_project/features/presentation/pages/home/home_page.dart';
import 'package:abhedy_banking_project/features/presentation/pages/main/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransactionsPage extends StatelessWidget {
  static const id="transactions";
  final Accounts accounts;
  const TransactionsPage(this.accounts,{super.key});

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
          title: const Text("Transactions",style: TextStyle(
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
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: kPrimaryColour,
                child: Card(
                  margin: const EdgeInsets.only(top: 10,bottom: 10,right: 10,left: 10),
                  color: Colors.white60,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "\$ ${accounts.balance.toString()}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Account no : ${accounts.accountNumber??"-"}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    toolbarHeight: 0,
                    automaticallyImplyLeading: false,
                    bottom: const TabBar(
                      tabs: [
                        Tab(text: "Statement"),
                        Tab(text: "Details",),
                      ],
                      labelStyle: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),
                    ),
                  ),
                  body: const TabBarView(
                    children: [
                      TransactionsListPage(),
                      HomePage(),
                    ],
                  ),
                ),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
