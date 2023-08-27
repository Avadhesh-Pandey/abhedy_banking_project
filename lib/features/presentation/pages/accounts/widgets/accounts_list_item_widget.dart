import 'package:abhedy_banking_project/core/constants/color_constants.dart';
import 'package:abhedy_banking_project/features/data/model/accounts_model.dart';
import 'package:abhedy_banking_project/features/presentation/pages/accounts/subpages/transactions_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        margin: EdgeInsets.only(right: 24.w, left: 24.w, bottom: 16.h),
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
            height: 18.h,
          ), SizedBox(
            width: 8.h,
          ),
          Expanded(
            child: Text(
              account.accountHolder ?? '',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text("\$ ${account.balance}", style: TextStyle(
              fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ), Divider(
            height: 16.h,
          ),
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: "Account no : ",
              style: TextStyle(fontSize: 16.sp, color: Colors.white),
              children: [
                TextSpan(
                  text: account.accountNumber ?? '',
                  style: TextStyle(
                    letterSpacing: 5,
                    fontSize: 14.sp,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
              SizedBox(
                height: 8.h,
              ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding:  EdgeInsets.only(right: 10.w, left: 10.w),
              margin:  EdgeInsets.only(left: 16.w),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white70,
                  ),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Text(
                account.accountType ?? '',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.black,
                ),
              )),),
              SizedBox(
                height: 8.h,
              ),
              Center(
                child: Text("Tab to view details", style: TextStyle(
                    fontSize: 11.sp, color: Colors.white70, fontWeight: FontWeight.w300)),
              ),

        ],
      ),
    ),)
    ,
    );
  }

}