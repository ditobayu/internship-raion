import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_raion/blocs/page/page_bloc.dart';
import 'package:internship_raion/blocs/user/user_bloc.dart';
import 'package:internship_raion/comment/presentation/bloc/comment/bloc/remote_comment_bloc.dart';
import 'package:internship_raion/config/routes/routes.dart';
import 'package:internship_raion/config/theme/app_themes.dart';
import 'package:internship_raion/firebase_options.dart';
import 'package:internship_raion/post/presentation/bloc/bookmark/remote/remote_bookmark_bloc.dart';
import 'package:internship_raion/post/presentation/bloc/post/remote/remote_post_bloc.dart';
import 'package:internship_raion/post/presentation/pages/home/home_page.dart';
import 'package:internship_raion/services/services.dart';
import 'package:internship_raion/ui/pages/pages.dart';
import 'package:provider/provider.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: null,
      value: AuthServices.userStream,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PageBloc()),
          BlocProvider(create: (context) => UserBloc()),
          BlocProvider(create: (context) => RemoteCommentBloc(sl(), sl())),
          BlocProvider(
              create: (context) => RemoteBookmarkBloc(sl(), sl(), sl())),
          BlocProvider<RemotePostBloc>(
            create: (context) => sl()..add(const GetRemotePost()),
          ),
        ],
        child: MaterialApp(
          theme: theme(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const Wrapper(),
        ),
      ),
    );
  }
}
