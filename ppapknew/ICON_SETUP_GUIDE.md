# App Icon Setup Guide

## How to Change Your App Logo

### Step 1: Prepare Your Logo Image

1. **Create your app icon** as a PNG image:
   - Size: **1024x1024 pixels** (minimum)
   - Format: PNG with transparency (optional, but recommended)
   - Save it as: `app_icon.png`

2. **Place the image** in the project:
   ```
   /home/ashish/Desktop/cc/ppapknew/assets/icon/app_icon.png
   ```

### Step 2: Generate Icons for All Platforms

Once you've placed your `app_icon.png` file in `assets/icon/`, run:

```bash
cd /home/ashish/Desktop/cc/ppapknew
flutter pub get
flutter pub run flutter_launcher_icons
```

This command will automatically generate:
- ✅ Android icon files (all sizes: ldpi, mdpi, hdpi, xhdpi, xxhdpi, xxxhdpi)
- ✅ iOS icon files (all sizes: 120x120, 180x180, etc.)

### Step 3: Verify the Changes

1. **For Android**: Check these files have been updated:
   ```
   android/app/src/main/res/mipmap-*/ic_launcher.png
   android/app/src/main/res/mipmap-*/ic_launcher_foreground.png
   ```

2. **For iOS**: Check these files:
   ```
   ios/Runner/Assets.xcassets/AppIcon.appiconset/
   ```

### Step 4: Rebuild the App

```bash
flutter clean
flutter pub get
flutter build apk
```

Or for iOS:
```bash
flutter build ios
```

## Troubleshooting

**Issue**: Command `flutter pub run flutter_launcher_icons` not found
- **Solution**: Run `flutter pub get` first to install the package

**Issue**: Icon not updating
- **Solution**: Try `flutter clean` then rebuild

**Issue**: Icon looks pixelated or blurry
- **Solution**: Use a higher resolution source image (2048x2048 or higher)

## Alternative: Manual Icon Update (If Needed)

### For Android:
1. Open `android/app/src/main/AndroidManifest.xml`
2. The icon should be referenced as `@mipmap/ic_launcher`
3. Replace PNG files in `android/app/src/main/res/mipmap-*/` folders

### For iOS:
1. Open `ios/Runner/Assets.xcassets/AppIcon.appiconset/`
2. Replace the existing PNG files with your images

## Color Recommendations

- **Use solid colors** for best results on all devices
- **Avoid transparency** in main icon (can cause issues on some Android versions)
- **Square format** works best
- Test on both light and dark device backgrounds

## References

- Flutter Launcher Icons: https://pub.dev/packages/flutter_launcher_icons
- Android Icon Guidelines: https://developer.android.com/guide/practices/ui_guidelines/icon_design
- iOS Icon Guidelines: https://developer.apple.com/design/human-interface-guidelines/app-icons
