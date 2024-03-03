import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_raion/blocs/page/page_bloc.dart';
import 'package:internship_raion/blocs/user/user_bloc.dart';
import 'package:internship_raion/firebase_options.dart';
import 'package:internship_raion/services/services.dart';
import 'package:internship_raion/ui/pages/pages.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // This is the last thing you need to add.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: null,
      // value: AuthServices.userStream,
      value: AuthServices.userStream,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PageBloc()),
          BlocProvider(create: (context) => UserBloc()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
        ),
      ),
    );
  }
}
