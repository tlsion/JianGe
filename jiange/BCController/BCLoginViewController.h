

#import <UIKit/UIKit.h>
//#import "BCHTTPService.h"
//#import "BMapKit.h"
#import <GameKit/GameKit.h>
#import <CoreLocation/CoreLocation.h>
//#import "BCRegisteredViewController.h"
@interface BCLoginViewController : UIViewController
{
    NSData					*myData;
      BOOL PowerOpen,ReLiao,GuangLiao;
    /*GKSession对象用于表现两个蓝牙设备之间连接的一个会话，你也可以使用它在两个设备之间发送和接收数据。*/
    GKSession				*currentSession;
    IBOutlet UILabel *lblDianyuan;
    IBOutlet UILabel *lblValue ;
    IBOutlet UILabel *lblTitle ;
    IBOutlet UIButton *btnJia;
    IBOutlet UIButton *btnJian;
    NSString * sendmsg;
    int intqiangdu,intdingshi;
    int currentMode;
    int moshiValue;
   // BCRegisteredViewController *regVC;
}

@end
