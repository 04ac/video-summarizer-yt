import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_summariser_yt/enter_video_details/ui/enter_video_details_screen.dart';
import 'package:video_summariser_yt/theme/bloc/theme_bloc.dart';
import 'package:video_summariser_yt/theme/repository/theme_repo.dart';
import 'package:video_summariser_yt/theme/theme_store.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static final themeBloc = ThemeBloc(
    theme: SchedulerBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.light
        ? ThemeData.light()
        : ThemeData.dark(),
  );

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    ThemeRepo.initialize().then((value) {
      ThemeRepo.getThemes().then((theme) {
        if (theme.isNotEmpty) {
          MyApp.themeBloc.theme =
              theme[0].darkMode ? ThemeData.dark() : ThemeData.light();
          MyApp.themeBloc.add(LoadThemeEvent());
        } else {
          ThemeRepo.addTheme(
              ThemeStore(darkMode: MyApp.themeBloc.theme == ThemeData.dark()));
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyApp.themeBloc,
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Video Summarizer YT',
            theme: MyApp.themeBloc.theme,
            home: const EnterVideoDetailsScreen(),
          );
        },
      ),
    );
  }
}
