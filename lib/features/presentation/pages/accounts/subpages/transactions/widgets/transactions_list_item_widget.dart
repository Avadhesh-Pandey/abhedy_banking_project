import 'package:abhedy_banking_project/core/utils/extensions/date_time_ext.dart';
import 'package:abhedy_banking_project/features/data/model/transactions_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionsListItemWidget extends StatelessWidget {
  final Transactions transactions;

  const TransactionsListItemWidget(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(right: 24.w, left: 24.w, bottom: 16.h),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateTime.parse(transactions.date ?? "").format(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
                Text(
                  transactions.amount!.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: (transactions.amount ?? 0) > 0 ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
            Divider(
              height: 16.h,
            ),
            Text(
              transactions.description ?? "",
              style:
              TextStyle(fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.w600),
            ),
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: transactions.fromAccount ?? '',
                style:  TextStyle(
                  letterSpacing: 2,
                  fontSize: 14.sp,
                  color: Colors.black54,
                ),
                children: [
                   TextSpan(
                    text: " to ",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  TextSpan(
                    text: transactions.toAccount ?? '',
                    style:  TextStyle(
                      letterSpacing: 2,
                      fontSize: 14.sp,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
