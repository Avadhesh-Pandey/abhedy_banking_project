import 'package:abhedy_banking_project/core/utils/extensions/date_time_ext.dart';
import 'package:abhedy_banking_project/features/data/model/transactions_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionsListItemWidget extends StatelessWidget {
  final Transactions transactions;

  const TransactionsListItemWidget(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 24, left: 24, bottom: 16),
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
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Text(
                  transactions.amount!.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 16,
                    color: (transactions.amount ?? 0) > 0 ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
            const Divider(
              height: 16,
            ),
            Text(
              transactions.description ?? "",
              style:
                  const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
            ),
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: transactions.fromAccount ?? '',
                style: const TextStyle(
                  letterSpacing: 2,
                  fontSize: 14,
                  color: Colors.black54,
                ),
                children: [
                  const TextSpan(
                    text: " to ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  TextSpan(
                    text: transactions.toAccount ?? '',
                    style: const TextStyle(
                      letterSpacing: 2,
                      fontSize: 14,
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
