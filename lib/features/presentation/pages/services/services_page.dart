import 'package:abhedy_banking_project/features/presentation/pages/contacts/contacts_page.dart';
import 'package:abhedy_banking_project/features/presentation/pages/statement/statement_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          horizontalTitleGap: 24.w,
          minVerticalPadding: 16.h,
          leading: Image.asset(
            'assets/img_loan.png',
          ),
          title: Text(
            "Loan",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          subtitle:  Text(
            "To get an instant loan online",
            style: TextStyle(fontSize: 12.sp, color: Colors.black87),
          ),
          onTap: ()
          {
            var snackBar = SnackBar(
              content: Text('Sorry, you are not eligible for loan, please contact customer services.',style: TextStyle(fontSize: 16.sp),),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
        const Divider(),
        ListTile(
          horizontalTitleGap: 24.w,
          minVerticalPadding: 16.h,
          leading: Image.asset(
            'assets/img_bank_statement.png',
          ),
          title: Text(
            "Statement",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          subtitle: Text(
            "financial transactions",
            style: TextStyle(fontSize: 12.sp, color: Colors.black87),
          ),
          onTap: ()
          {
            context.go("/${StatementPage.id}");
          },
        ),
        const Divider(),
        ListTile(
          horizontalTitleGap: 24.w,
          minVerticalPadding: 16.h,
          leading: Image.asset(
            'assets/img_contacts.png',
          ),
          title: Text(
            "Contacts",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          subtitle: Text(
            "Let us help you with your queries",
            style: TextStyle(fontSize: 12.sp, color: Colors.black87),
          ),
          onTap: ()
          {
            context.go("/${ContactsPage.id}");
          },
        ),
        const Divider(),


      ],
    );
  }
}
