/**
 * SplashScreen
 * 启动屏
 * from：http://www.devio.org
 * Author:CrazyCodeBoy
 * GitHub:https://github.com/crazycodeboy
 * Email:crazycodeboy@gmail.com
 */
#import "FlutterSplashScreenPlugin.h"

@implementation FlutterSplashScreenPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_splash_screen"
            binaryMessenger:[registrar messenger]];
  FlutterSplashScreenPlugin* instance = [[FlutterSplashScreenPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"show" isEqualToString:call.method]) {
      _myWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
      _myWindow.windowLevel = UIWindowLevelStatusBar;
      _myWindow.backgroundColor = UIColor.redColor;
      _myWindow.hidden = NO;
//      [_myWindow makeKeyAndVisibl]
  } else if ([@"hide" isEqualToString:call.method]) {
      _myWindow.hidden = YES;
      _myWindow = nil;
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
