import 'package:abhedy_banking_project/core/constants/color_constants.dart';
import 'package:abhedy_banking_project/features/data/model/accounts_model.dart';
import 'package:abhedy_banking_project/features/presentation/pages/accounts/subpages/transactions_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AccountsListItemWidget extends StatelessWidget {
  final Accounts account;

  const AccountsListItemWidget(this.account, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go("/${TransactionsPage.id}", extra: account);
      },
      child: Card(
        color: kPrimaryColour,
        margin: const EdgeInsets.only(right: 24, left: 24, bottom: 16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SvgPicture.asset(
            'assets/ic_user.svg',
            color: Colors.white70,
            height: 18,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              account.accountHolder ?? '',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text("\$ ${account.balance}", style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          const Divider(
            height: 16,
          ),
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: "Account no : ",
              style: const TextStyle(fontSize: 16, color: Colors.white),
              children: [
                TextSpan(
                  text: account.accountNumber ?? '',
                  style: const TextStyle(
                    letterSpacing: 5,
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
              const SizedBox(
                height: 8,
              ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.only(right: 10, left: 10),
              margin: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white70,
                  ),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Text(
                account.accountType ?? '',
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
              )),),
              const SizedBox(
                height: 8,
              ),
              const Center(
                child: Text("Tab to view details", style: TextStyle(
                    fontSize: 11, color: Colors.white70, fontWeight: FontWeight.w300)),
              ),

        ],
      ),
    ),)
    ,
    );
  }

}