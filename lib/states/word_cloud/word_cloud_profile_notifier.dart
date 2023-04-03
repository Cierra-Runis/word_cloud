import 'package:word_cloud/index.dart';

class WordCloudProfileNotifier extends ChangeNotifier {
  static late SharedPreferences _preferences;
  Profile profile = Profile();

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();
    DevTools.printLog('程序初始化中');

    // 进行调试工具的初始化
    DevTools.init();

    _preferences = await SharedPreferences.getInstance();
    if (_preferences.getString('profile') == null) {
      _preferences.setString(
        'profile',
        jsonEncode(Profile()),
      );
      DevTools.printLog('程序完全初次运行，创建 profile 为 ${jsonEncode(profile)}');
      await Directory(Directory.current.path + r'\user_data').create();
    }
    profile = Profile.fromJson(jsonDecode(_preferences.getString('profile')!));

    _packageInfo = await PackageInfo.fromPlatform();
    profile.currentVersion =
        'v${_packageInfo.version}+${_packageInfo.buildNumber}';

    const WindowOptions windowOptions = WindowOptions(
      size: Size(1200, 675),
      minimumSize: Size(1200, 675),
      maximumSize: Size(1200, 675),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      title: WordCloudConstant.APP_NAME,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });

    DevTools.printLog('程序初始化完毕，且 profile 为 ${jsonEncode(profile)}');
  }

  void changeProfile(Profile profile) async {
    this.profile = profile;
    DevTools.printLog('更改 profile 为 ${profile.toJson().toString()}');
    save();
    notifyListeners();
    super.notifyListeners();
  }

  void save() async {
    _preferences.setString('profile', jsonEncode(profile));
    DevTools.printLog('保存 profile 为 ${jsonEncode(profile)}');
  }
}
