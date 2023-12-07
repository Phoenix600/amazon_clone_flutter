import 'package:amazonclone/common/widgets/bottom_bar.dart';
import 'package:amazonclone/constants/global_constants.dart';
import 'package:amazonclone/features/admin/screens/admin_screen.dart';
import 'package:amazonclone/features/auth/screen/auth_screen.dart';
import 'package:amazonclone/features/auth/services/auth_service.dart';
import 'package:amazonclone/providers/user_provider.dart';
import 'package:amazonclone/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Amazon Clone",
      theme: ThemeData(
          useMaterial3: false,
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme:
              const ColorScheme.light(primary: GlobalVariables.secondaryColor)),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Scaffold(
          // appBar: AppBar(
          //   title: const Text("Amazon Clone"),
          // ),
          body: Provider.of<UserProvider>(context).user.token.isNotEmpty
              ? Provider.of<UserProvider>(context).user.type == 'user'
                  ? const BottomBar()
                  : const AdminScreen()
              : const AuthScreen()),
    );
  }
}
