import 'dart:async';

import 'package:abhedy_banking_project/core/constants/color_constants.dart';
import 'package:abhedy_banking_project/features/presentation/pages/main/home_page.dart';
import 'package:abhedy_banking_project/features/presentation/pages/statement/subpages/statement_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

StreamController financialYearChanged = StreamController<int>.broadcast();

class StatementPage extends StatefulWidget {
  static const id="statement";
   const StatementPage({super.key});

  @override
  State<StatementPage> createState() => _StatementPageState();
}

class _StatementPageState extends State<StatementPage> {
  var _selectedDate=DateTime.now();


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
          title: Text("Financial Statement",style: TextStyle(
            fontSize: 16.sp,
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
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 10.h,bottom: 10.h),
                child: ElevatedButton.icon(
                  onPressed: ()
                  {
                    showYearPicker(context);
                  },
                  style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 18.sp),maximumSize: Size(200.w, 100.h)),
                  icon: const Icon(Icons.arrow_drop_down_outlined),
                  label: StreamBuilder(
                      stream: financialYearChanged.stream,
                      initialData: _selectedDate.year.toString(),
                      builder: (BuildContext context, AsyncSnapshot snapshot){
                        print("snapshot : ${snapshot.data}");
                        return Text("${snapshot.data}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.sp),);
                      }
                  )

                )
              ),
              Expanded(child: StatementListPage()),
            ],
          ),
        ),
      ),
    );
  }

  showYearPicker(BuildContext context)
  {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Year"),
          content: SizedBox( // Need to add size constraint.
            width: 300.w,
            height: 300.h,
            child: YearPicker(
              firstDate: DateTime(DateTime.now().year - 4, 1),
              lastDate: DateTime(DateTime.now().year, 1),
              initialDate: DateTime.now(),
              selectedDate: _selectedDate,
              onChanged: (DateTime dateTime) {
                // close the dialog when year is selected.
                Navigator.pop(context);
                _selectedDate=dateTime;
                financialYearChanged.sink.add(dateTime.year);
              },
            ),
          ),
        );
      },
    );
  }
}
