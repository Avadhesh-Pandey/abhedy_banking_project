
import 'package:abhedy_banking_project/core/constants/color_constants.dart';
import 'package:abhedy_banking_project/features/presentation/bloc/auth_status/auth_status_bloc.dart';
import 'package:abhedy_banking_project/features/presentation/pages/main/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginSubpage extends StatefulWidget {
  const LoginSubpage({super.key});

  @override
  State<StatefulWidget> createState() => LoginSubpageState();
}

class LoginSubpageState extends State<LoginSubpage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameField = TextEditingController();

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<AuthStatusBloc>(context),
      listener: (context, state) {
        if(state is AuthStatusSetSuccessfully)
          {
            debugPrint("SPLASH : $state");
            context.go("/${MainPage.id}");
          }
        else if(state is ErrorSettingAuthStatus)
          {
            debugPrint("SPLASH : $state");
          }
      },
      child:  Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Login",style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),),
          automaticallyImplyLeading: false,
          backgroundColor: kPrimaryColour,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 24, top: 40),
                child: Align(
                  alignment: Alignment.topRight,
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "*",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.pink,
                          ),
                        ),
                        TextSpan(
                          text: "mandatory fields",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(right: 24,left: 24,top: 50,bottom: 50),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _nameField,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: kBorderColor),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: kBorderColor),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: kBorderColor),
                          ),
                          label: Row(
                            children: [
                              RichText(
                                textAlign: TextAlign.end,
                                text: const TextSpan(
                                  text: "User name",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                        letterSpacing: 5,
                                        fontSize: 15,
                                        color: Colors.red,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value==null || value.isEmpty) {
                            return "Please enter your name";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {},
                      ),
                      const PasswordFieldToggle(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 8,right: 24,left: 24),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: kPrimaryColour,
                    minimumSize: const Size.fromHeight(48),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate())
                      {
                        BlocProvider.of<AuthStatusBloc>(context).add(SetCustomerAuthStatusEvent(_nameField.text.trim()));
                      }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordFieldToggle extends StatefulWidget{
  const PasswordFieldToggle({super.key});

  @override
  State<StatefulWidget> createState() =>PasswordToggleState();
}

class PasswordToggleState extends State<PasswordFieldToggle>
{
  final TextEditingController _passwordField = TextEditingController();
  bool _passwordVisible=true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _passwordField,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: kBorderColor),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kBorderColor),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kBorderColor),
        ),
        label: Row(
          children: [
            RichText(
              textAlign: TextAlign.end,
              text: const TextSpan(
                text: "Password",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black
                ),
                children: [
                  TextSpan(
                    text: ' *',
                    style: TextStyle(
                      letterSpacing: 5,
                      fontSize: 15,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            _passwordVisible
                ? Icons.visibility
                : Icons.visibility_off,
            color: kPrimaryColour,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      obscureText: _passwordVisible,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value==null || value.isEmpty) {
          return "Please enter a password";
        } else {
          return null;
        }
      },
      onSaved: (value) {},
    );
  }

}
