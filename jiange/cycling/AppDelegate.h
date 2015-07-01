//
//  AppDelegate.h
//  cycling
//
//  Created by Pro on 2/28/14.
//  Copyright (c) 2014 王庭协. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCTabBarController.h"
#import <CoreLocation/CoreLocation.h>
#import "BCLoginViewController.h"
#import "Reachability.h"
#import <CoreBluetooth/CoreBluetooth.h>
#import "BCRegisteredViewController.h"
typedef NS_ENUM(NSInteger, BCPeripheralType){
    BCPeripheralTypeDetection,
    BCPeripheralTypeConnected,
    BCPeripheralTypeDisConnected
};
@interface AppDelegate : UIResponder <UIApplicationDelegate,BCTabBarControllerDelegate,CBCentralManagerDelegate,CBPeripheralDelegate,UIAlertViewDelegate>
{
    NSUserDefaults * userDefaults;
//    CLLocationManager *locationManager;
    NSDictionary *messageInfo;
    Reachability  *hostReach;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) BCTabBarController * tabBarController;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong,nonatomic)BCLoginViewController *loginVC;
@property (strong,nonatomic)BCRegisteredViewController *registerVC;
@property (assign,nonatomic)BOOL backgroundRun;

@property bool cbReady;
@property (nonatomic,strong) CBCentralManager *cbCM;
@property (strong,nonatomic) NSMutableArray *nDevices,*nServices;
@property (strong,nonatomic) CBPeripheral *cbPeripheral;
@property (assign,nonatomic) BCPeripheralType peripheralType;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
-(void)getMessageData;
@end
