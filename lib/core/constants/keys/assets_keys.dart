class AssetsKeys {
  static String getAssetPath(String name, subPath,
          {String extension = 'svg'}) =>
      'assets/$subPath/$name.$extension';

  //Sub Path Keys
  static const String ICONS_SUB = 'icons';
  static const String IMAGES_SUB = 'images';

  //Images keys
  static const String EMPTY_HOME_IMAGE = 'empty_screen_image';

  //Icons Keys
  static const String APP_LOGO = 'app_logo';
  static const String TAG_ICON = 'tag_icon';
}
