import 'package:hive_flutter/adapters.dart';
import 'package:todey/constants/string_constant.dart';
import 'package:todey/core/routes.dart';
import 'package:todey/data/models/user_data.dart';
import 'package:todey/data/sqflite_db.dart';
import 'package:todey/utils/exports.dart';
import 'package:path_provider/path_provider.dart' as path;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await path.getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await Firebase.initializeApp();
  await DatabaseHelper().initializeDB();
  Hive.registerAdapter(UserDataAdapter());
  await Hive.openBox<UserData>(userDataString);
  await Hive.openBox<bool>(appTheme);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Get.put(AuthService());
  Get.put(SettingController());
  runApp(BetterFeedback(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          Get.isDarkMode ? Brightness.dark : Brightness.light,
      statusBarBrightness: Get.isDarkMode ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness:
          Get.isDarkMode ? Brightness.dark : Brightness.light,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
    return ScreenUtilInit(
      designSize: Size(360, 784),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          translations: Translation(),
          locale: Locale("en", "US"),
          color: Colors.white,
          fallbackLocale: Locale('en', 'US'),
          theme: CustomTheme.buildLightTheme(),
          darkTheme: CustomTheme.buildDarkTheme(),
          home: Onboard(),
          title: "Todey",
          getPages: RouteGenerator.routes,
        );
      },
    );
  }
}
