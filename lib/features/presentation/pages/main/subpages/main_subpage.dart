import 'package:abhedy_banking_project/core/constants/color_constants.dart';
import 'package:abhedy_banking_project/features/presentation/bloc/auth_status/auth_status_bloc.dart';
import 'package:abhedy_banking_project/features/presentation/pages/accounts/accounts_page.dart';
import 'package:abhedy_banking_project/features/presentation/pages/home/home_page.dart';
import 'package:abhedy_banking_project/features/presentation/pages/main/subpages/drawer_menu.dart';
import 'package:abhedy_banking_project/features/presentation/pages/services/services_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainSubpage extends StatefulWidget {
  const MainSubpage({super.key});

  @override
  State<StatefulWidget> createState() => MainSubpageState();
}

class MainSubpageState extends State<MainSubpage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    BlocProvider.of<AuthStatusBloc>(context).add(GetCustomersNameEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (context)=>IconButton(
            icon: SvgPicture.asset(
              'assets/ic_menu_burger.svg',
              color: Colors.white,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: BlocBuilder<AuthStatusBloc, AuthStatusState>(
          builder: (BuildContext context, state) {
            if (state is CustomersNameRetrievedSuccessfully) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Welcome back,  ",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: state.customersName,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColour,
      ),
      drawer: const DrawerMenu(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/ic_home.svg',
                colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn)
            ),
            activeIcon: SvgPicture.asset(
                'assets/ic_home.svg',
                colorFilter: const ColorFilter.mode(kPrimaryColour, BlendMode.srcIn)
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/ic_account.svg',
                colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn)
            ),
            activeIcon: SvgPicture.asset(
                'assets/ic_account.svg',
                colorFilter: const ColorFilter.mode(kPrimaryColour, BlendMode.srcIn)
            ),
            label: 'Accounts',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/ic_services.svg',
                colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn)
            ),
            activeIcon: SvgPicture.asset(
                'assets/ic_services.svg',
                colorFilter: const ColorFilter.mode(kPrimaryColour, BlendMode.srcIn)
            ),
            label: 'Services',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColour,
        onTap: _onItemTapped,
      ),
      body:  Center(
        child: _widgetOptions[_selectedIndex],
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    AccountsPage(),
    ServicesPage(),
  ];
}
