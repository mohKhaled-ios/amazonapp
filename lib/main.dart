import 'package:amazonapp/common/widget/bottom_bar.dart';
import 'package:amazonapp/conastant/global_var.dart';
import 'package:amazonapp/features/admain/screens/admain_screen.dart';
import 'package:amazonapp/features/auth/screens/auth_screen.dart';
import 'package:amazonapp/features/auth/services/auth_services.dart';
import 'package:amazonapp/provider/user_provider.dart';
import 'package:amazonapp/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Authservice authservice = Authservice();

  @override
  void initState() {
    super.initState();
    authservice.getuserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MY AMAZON',
        theme: ThemeData(
            colorScheme: ColorScheme.light(
              primary: Globalvar.secondarycolor,
            ),
            scaffoldBackgroundColor: Globalvar.backgroundcolor,
            appBarTheme: AppBarTheme(
              elevation: 0,
            ),
            iconTheme: IconThemeData(color: Colors.black)),
        onGenerateRoute: ((settings) => generateroute(settings)),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? Provider.of<UserProvider>(context).user.type == "user"
                ? Bottombar()
                : AdmainScreen()
            : Authscreen());
  }
}
