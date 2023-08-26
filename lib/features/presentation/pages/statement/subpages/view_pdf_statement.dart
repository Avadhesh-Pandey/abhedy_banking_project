import 'package:abhedy_banking_project/core/constants/color_constants.dart';
import 'package:abhedy_banking_project/features/presentation/pages/main/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewPDFStatement extends StatelessWidget{
  static const id="pdf_statement";

  const ViewPDFStatement({super.key});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => goBack(context),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("PDF Statement",style: TextStyle(
              fontSize: 24,
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
              child: SfPdfViewer.network(
                  'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf'))),
    );
  }

  Future<bool> goBack(BuildContext context)
  {
    // GoRouter.of(context).pop();
    context.go("/${MainPage.id}");
    return Future.value(false);
  }

}