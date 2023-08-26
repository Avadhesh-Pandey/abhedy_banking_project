import 'package:abhedy_banking_project/core/di/injection_getit.dart';
import 'package:abhedy_banking_project/features/presentation/bloc/auth_status/auth_status_bloc.dart';
import 'package:abhedy_banking_project/features/presentation/pages/main/subpages/main_subpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget{
  static const id="main";
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => sl<AuthStatusBloc>(),child: const MainSubpage(),);
  }
  
}