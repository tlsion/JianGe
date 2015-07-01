//
//  AppDelegate.m
//  cycling
//
//  Created by Pro on 2/28/14.
//  Copyright (c) 2014 王庭协. All rights reserved.
//

#import "AppDelegate.h"


#import "BCLoginViewController.h"
#import "BCRegisteredViewController.h"
#import "UIView+Action.h"
@implementation AppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;


- (void)onlineConfigCallBack:(NSNotification *)note {
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //判断是否支持多线程
    UIDevice* device = [UIDevice currentDevice];
	BOOL backgroundSupported = NO;
	if ([device respondsToSelector:@selector(isMultitaskingSupported)])
		backgroundSupported = device.multitaskingSupported;
    
    
    //打开调试log的开关
    //[UMSocialData openLog:NO];
    
    //如果你要支持不同的屏幕方向，需要这样设置，否则在iPhone只支持一个竖屏方向
    //[UMSocialConfig setSupportedInterfaceOrientations:UIInterfaceOrientationMaskAll];
    
    

    

    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
   // self.window.backgroundColor = [UIColor whiteColor];

    
    userDefaults=[NSUserDefaults standardUserDefaults];

//    if ([userDefaults valueForKey:@"userId"]!=nil) {
//        [userDefaults setBool:YES forKey:@"isLoginRiding"];
//    }
    
    
    _loginVC=[[BCLoginViewController alloc]initWithNibName:@"BCLoginViewController" bundle:nil];
    UINavigationController * loginNC=[[UINavigationController alloc]initWithRootViewController:_loginVC];

    _registerVC = [[BCRegisteredViewController alloc] initWithNibName:@"BCRegisteredViewController" bundle:nil];
    
    
    
    self.window.rootViewController=loginNC;
    
    
    
   
    
    [self.window makeKeyAndVisible];
   
     [[UIApplication sharedApplication]setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    return UIInterfaceOrientationMaskPortrait;
    return YES;
}





#pragma end mark


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    UIApplication*   app = [UIApplication sharedApplication];
    __block    UIBackgroundTaskIdentifier bgTask;
    bgTask = [app beginBackgroundTaskWithExpirationHandler:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (bgTask != UIBackgroundTaskInvalid)
            {
                
                bgTask = UIBackgroundTaskInvalid;
            }
        });
    }];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (bgTask != UIBackgroundTaskInvalid)
            {
                bgTask = UIBackgroundTaskInvalid;
            }
        });
    });

    
    _backgroundRun=YES;
    [[NSNotificationCenter defaultCenter]postNotificationName:@"APP_DIDENTER_BACKGROUND" object:nil];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}


- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            abort();
        } 
    }
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag==110) {
        if (buttonIndex==1) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.testflightapp.com"]];
        }
    }
}

@end
