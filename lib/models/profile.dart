import 'package:word_cloud/index.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  Profile();

  // 当 profile.dart 添加新数据时
  // 为了版本的迭代, 在此添加的新数据格式应该为
  // <类型>? <变量名> [= <一般初始值>];
  /*
  语法	             含义
  纯文本	           纯文本，直接键入。
  <参数名>	         需要使用一合适的值来替换该函数。
  [可选项]	         该输入项是可选的。
  (输入项｜输入项)	  必须地在显示的值中选择一个填写。
  [输入项｜输入项]	  可选地在显示的值中选择一个填写。
  */

  /// 主题模式
  ThemeMode themeMode = ThemeMode.system;

  /// 当前版本
  String? currentVersion;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
