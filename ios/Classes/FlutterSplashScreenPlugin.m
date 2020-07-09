/**
 * SplashScreen
 * 启动屏
 * from：http://www.devio.org
 * Author:CrazyCodeBoy
 * GitHub:https://github.com/crazycodeboy
 * Email:crazycodeboy@gmail.com
 */
#import "FlutterSplashScreenPlugin.h"

static UIWindow *myWindow;

@implementation FlutterSplashScreenPlugin
+(void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_splash_screen"
            binaryMessenger:[registrar messenger]];
  FlutterSplashScreenPlugin* instance = [[FlutterSplashScreenPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

+(UIWindow *)show
{
    NSLog(@"aaa");
    myWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    myWindow.windowLevel = UIWindowLevelStatusBar;
    myWindow.backgroundColor = UIColor.whiteColor;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LaunchScreen" bundle:nil];
    UIViewController *launchController = [storyboard instantiateInitialViewController];
    myWindow.rootViewController = launchController;
    myWindow.hidden = NO;
    [myWindow makeKeyAndVisible];
    return myWindow;
}

+(void)hide
{
    if (myWindow != nil) {
        myWindow.hidden = YES;
        myWindow = nil;
    }
}

-(void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"show" isEqualToString:call.method]) {
      [FlutterSplashScreenPlugin show];
  } else if ([@"hide" isEqualToString:call.method]) {
      [FlutterSplashScreenPlugin hide];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
