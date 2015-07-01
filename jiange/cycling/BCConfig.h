//
//  BCConfig.h
//  cycling
//
//  Created by Pro on 3/4/14.
//  Copyright (c) 2014 王庭协. All rights reserved.
//

#ifndef cycling_BCConfig_h
#define cycling_BCConfig_h
#import "AppDelegate.h"
#import "CreateComponent.h"
#import "JoProgressHUD.h"
#import "UIView+Action.h"
#define BaiduMapAppKey @"rf9TpoAK1IBshFOeIehE4OCP"
#define UmengAppkey @"533e2ce356240b727c0c44c6"
#define APP (AppDelegate *)[[UIApplication sharedApplication] delegate]
//导航栏高度
#define NAV_HEIGHT 44.0f
#define STA_HERGHT 20.0f
#define NAV_HEI_64 64.0f
//屏幕的比率
#define ScaleWidth [UIScreen mainScreen].bounds.size.width / 320.0
#define ScaleHeight [UIScreen mainScreen].bounds.size.height / 480.0

#define SCREEN_MAX_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_MAX_HEIGHT [UIScreen mainScreen].bounds.size.height

#define VIEW_MAX_HEIGHT [UIScreen mainScreen].bounds.size.height-20

//#define PIC_SCALE_WIDTH 320.0/480
//#define PIC_SCALE_HEIGHT [UIScreen mainScreen].bounds.size.height/800

//字体
#define FONTSIZES(x) [UIFont fontWithName:@"Heiti SC" size:x]
#define FONTBOLD(x) [UIFont boldSystemFontOfSize:x]
#define FONT_BIG [UIFont fontWithName:@"Heiti SC" size:17]
#define FONT_MID [UIFont fontWithName:@"Heiti TC" size:14]
#define FONT_SMA [UIFont fontWithName:@"Heiti SC" size:12]
#define FONT_BESTBIG [UIFont fontWithName:@"Heiti SC" size:20]
//颜色
#define YAHEI [UIColor colorWithRed:41.0/255 green:36.0/255 blue:33.0/255 alpha:0.9]
#define ORANGE [UIColor colorWithRed:255.0/255 green:140.0/255 blue:0.0/255 alpha:0.9]
#define DEEPGRAY [UIColor colorWithRed:169.0/255 green:169.0/255 blue:169.0/255 alpha:0.9]
#define LIGHTGRAY [UIColor colorWithRed:211.0/255 green:211.0/255 blue:211.0/255 alpha:0.9]
#define LIGHTBLUE [UIColor colorWithRed:65.0/255 green:80.0/255 blue:255.0/255 alpha:0.9]
#define BROWN [UIColor colorWithRed:128.0/255 green:128.0/255 blue:105.0/255 alpha:0.9]
#define CLEAR [UIColor clearColor]
#define WHITE [UIColor whiteColor]
#define setX(V) V.frame.origin.x+V.frame.size.width
#define setY(V) V.frame.origin.y+V.frame.size.height

//版本
#define SYSTEM_VERSION_COUNT [[[UIDevice currentDevice]systemVersion]floatValue]
//提示
#define ALERT(msg)  [[[UIAlertView alloc]initWithTitle:nil message:msg delegate:nil \
cancelButtonTitle:@"确定" otherButtonTitles:nil,nil] show]

//打包时自动去除NSLog
#ifdef DEBUG

#define BCLog(...)  NSLog(__VA_ARGS__)

#else

#define BCLog(...)

#endif


#define MYBUNDLE_NAME @ "mapapi.bundle"
#define MYBUNDLE_PATH [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: MYBUNDLE_NAME]
#define MYBUNDLE [NSBundle bundleWithPath: MYBUNDLE_PATH]

//服务器
//#define SERVICE_URL @"http://192.168.0.123:8080/AppBicycle"

#define SERVICE_URL @"http://59.61.92.182:82/AppBicycle"


//*********UserDefaults All Keys*************

#define UD_Peripheral_UUID @"UD_Peripheral_UUID"


//控制打印
#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif


#endif
