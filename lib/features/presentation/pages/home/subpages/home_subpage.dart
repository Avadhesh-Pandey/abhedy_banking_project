import 'package:abhedy_banking_project/features/presentation/bloc/auth_status/auth_status_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSubpage extends StatefulWidget {
  const HomeSubpage({super.key});

  @override
  State<StatefulWidget> createState() => HomeSubpageState();
}

class HomeSubpageState extends State<HomeSubpage> {
  @override
  void initState() {
    BlocProvider.of<AuthStatusBloc>(context).add(GetCustomersNameEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<AuthStatusBloc>(context),
      listener: (context, state) {
        if(state is CustomersNameRetrievedSuccessfully)
          {
            debugPrint("SPLASH : ${state.customersName}");
          }
        else
          {
            debugPrint("SPLASH : $state");
          }
      },
      child:  Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text("HOME"),
        ),
      ),
    );
  }
}
