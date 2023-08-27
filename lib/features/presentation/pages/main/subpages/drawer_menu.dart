import 'package:abhedy_banking_project/core/constants/color_constants.dart';
import 'package:abhedy_banking_project/core/constants/shared_preferences_constants.dart';
import 'package:abhedy_banking_project/features/presentation/pages/contacts/contacts_page.dart';
import 'package:abhedy_banking_project/features/presentation/pages/login/login_page.dart';
import 'package:abhedy_banking_project/features/presentation/pages/main/home_page.dart';
import 'package:abhedy_banking_project/features/presentation/pages/statement/statement_page.dart';
import 'package:abhedy_banking_project/features/presentation/pages/statement/subpages/view_pdf_statement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerMenu extends StatelessWidget{
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: kPrimaryColour,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Image.asset('assets/img_abhedya_logo.png'),
            ),
          ),
          ListTile(
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
            ),
            onTap: ()
            {
              Navigator.pop(context);
              context.go("/${MainPage.id}");
            },
          ),
          ListTile(
            title: const Text(
              "Loan",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
            ),
            onTap: ()
            {
              Navigator.pop(context);
              var snackBar = SnackBar(
                content: Text('Sorry, you are not eligible for loan, please contact customer services.',style: TextStyle(fontSize: 16.sp)),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
          ListTile(
            title: const Text(
              "Statement",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
            ),
            onTap: ()
            {
              Navigator.pop(context);
              context.go("/${StatementPage.id}");
            },
          ),

          ListTile(
            title: const Text(
              "View PDF",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
            ),
            onTap: ()
            {
              Navigator.pop(context);
              context.go("/${ViewPDFStatement.id}");
            },
          ),
          ListTile(
            title: const Text(
              "Contacts us",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
            ),
            onTap: ()
            {
              Navigator.pop(context);
              context.go("/${ContactsPage.id}");
            },
          ),

          const SizedBox(height: 50,),
          ListTile(
            title: const Text(
              "Logout",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
            ),
            onTap: ()
            {
              logout(context);
            },
          ),

        ],
      ),);
  }

  Future<void> logout(BuildContext context)
  async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setBool(spIsCustomerLoggedIn, false);
    sp.setString(spCustomersName, "");
    if(context.mounted)
      {
        Navigator.pop(context);
        context.go("/${LoginPage.id}");
      }
  }

}