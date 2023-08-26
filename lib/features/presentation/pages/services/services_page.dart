import 'package:abhedy_banking_project/features/presentation/pages/contacts/contacts_page.dart';
import 'package:abhedy_banking_project/features/presentation/pages/statement/statement_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          horizontalTitleGap: 24,
          minVerticalPadding: 16,
          leading: Image.asset(
            'assets/img_loan.png',
          ),
          title: const Text(
            "Loan",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          subtitle: const Text(
            "To get an instant loan online",
            style: TextStyle(fontSize: 12, color: Colors.black87),
          ),
          onTap: ()
          {
            const snackBar = SnackBar(
              content: Text('Sorry, you are not eligible for loan, please contact customer services.'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
        const Divider(),
        ListTile(
          horizontalTitleGap: 24,
          minVerticalPadding: 16,
          leading: Image.asset(
            'assets/img_bank_statement.png',
          ),
          title: const Text(
            "Statement",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          subtitle: const Text(
            "financial transactions",
            style: TextStyle(fontSize: 12, color: Colors.black87),
          ),
          onTap: ()
          {
            context.go("/${StatementPage.id}");
          },
        ),
        const Divider(),
        ListTile(
          horizontalTitleGap: 24,
          minVerticalPadding: 16,
          leading: Image.asset(
            'assets/img_contacts.png',
          ),
          title: const Text(
            "Contacts",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          subtitle: const Text(
            "Let us help you with your queries",
            style: TextStyle(fontSize: 12, color: Colors.black87),
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
