#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

#import "CustomPluginRegistrant.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    
    
    self.window.rootViewController = [[FlutterViewController alloc] init];

    
    [GeneratedPluginRegistrant registerWithRegistry:self];
    
    [CustomPluginRegistrant registerWithRegistry:self];
    
    
    NSLog(@"%@", NSHomeDirectory());

    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}



@end
