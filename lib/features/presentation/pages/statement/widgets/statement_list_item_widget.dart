import 'package:abhedy_banking_project/core/utils/extensions/date_time_ext.dart';
import 'package:abhedy_banking_project/features/data/model/statements_model.dart';
import 'package:abhedy_banking_project/features/presentation/pages/statement/subpages/view_pdf_statement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StatementListItemWidget extends StatelessWidget {
  final Statements statements;

  const StatementListItemWidget(this.statements, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        context.go("/${ViewPDFStatement.id}");
      },
      child: Card(
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
                    DateTime.parse(fixDateFormatError(statements.date??"")).format(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    statements.amount!.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 16,
                      color: (statements.amount ?? 0) > 0 ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 16,
              ),
              Text(
                statements.description ?? "",
                style:
                    const TextStyle(fontSize: 14, color: Colors.black,),
              ),
              const SizedBox(
                height: 8,
              ),
              const Center(
                child: Text("Tab to view details", style: TextStyle(
                    fontSize: 11, color: Colors.black54, fontWeight: FontWeight.w300)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String fixDateFormatError(String date)
  {
    var dateSplit=date.split("-");
    if(dateSplit[1].length==1 || dateSplit[2].length==1)
    {
      if(dateSplit[1].length==1)
      {
        dateSplit[1]="0${dateSplit[1]}";
      }
      if(dateSplit[2].length==1)
      {
        dateSplit[2]="0${dateSplit[2]}";
      }
      date=dateSplit.join("-");
    }
    return date;
  }
}
