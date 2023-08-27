import 'package:abhedy_banking_project/core/utils/extensions/date_time_ext.dart';
import 'package:abhedy_banking_project/features/data/model/statements_model.dart';
import 'package:abhedy_banking_project/features/presentation/pages/statement/subpages/view_pdf_statement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                    DateTime.parse(fixDateFormatError(statements.date??"")).format(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    statements.amount!.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: (statements.amount ?? 0) > 0 ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
              Divider(
                height: 16.h,
              ),
              Text(
                statements.description ?? "",
                style:
                TextStyle(fontSize: 14.sp, color: Colors.black,),
              ),
              SizedBox(
                height: 8.h,
              ),
              Center(
                child: Text("Tab to view details", style: TextStyle(
                    fontSize: 11.sp, color: Colors.black54, fontWeight: FontWeight.w300)),
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
