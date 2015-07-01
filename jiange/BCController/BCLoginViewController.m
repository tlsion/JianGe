//
//  BCLoginViewController.m
//  cycling
//
//  Created by 智美合 on 14-3-10.
//  Copyright (c) 2014年 王庭协. All rights reserved.
//

#import "BCLoginViewController.h"
#import "BCRegisteredViewController.h"
#import "CustomerNavBar.h"
#import "BCTabBarController.h"
#import "UIView+Action.h"
#import "Reachability.h"
@interface BCLoginViewController ()

@end

@implementation BCLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(AppDelegate*)appdelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication]delegate];
}
- (BCRegisteredViewController *)registerVC{
    return [[self appdelegate] registerVC];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}
//-(UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
        self.navigationController.navigationBar.translucent = false;
    }
    
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    
    //延迟1.0秒后进行搜索蓝牙
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.registerVC scan];
        
    });
    
    //返回按钮
    CustomerNavBar * navBar=[[CustomerNavBar alloc]initWithControllerTarget:self];
    navBar.titleName = @"健格智能遥控器";
    [navBar setGoBack:NO];
    
    [self.view addSubview:navBar];
    
//    UIImageView *imagev=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    imagev.image=[UIImage imageNamed:@"bg_daoying"];
//    imagev.contentMode=UIViewContentModeScaleToFill;
//    [self.view insertSubview:imagev atIndex:0];
    
    //第一个框
//    UIImageView *lineImage1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gongnengkuang"]];
//    lineImage1.frame = CGRectMake(10,NAV_HEIGHT+10, 300, 150);
//    
//    [self.view addSubview:lineImage1];
    
//    lblTitle = [[ UILabel alloc] init];
//    lblTitle.text = @"模式";
//    lblTitle.font=[UIFont systemFontOfSize:12];
//    lblTitle.textAlignment=NSTextAlignmentCenter;
//    lblTitle.frame = CGRectMake(0,NAV_HEIGHT+10,300,30) ;
//    lblTitle.textColor = [UIColor colorWithRed:0/255 green:147.0/255 blue:253.0/255 alpha:1];
//    lblTitle.backgroundColor= [UIColor clearColor];
//    [self.view addSubview: lblTitle];
    
    // UIColor *bgColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"gezi.png"]];
    
    
    UIButton *saveBtn = [CreateComponent createButtonWithFrame:CGRectMake(280, 7, 30, 30) andTitle:nil andTitleColor:YAHEI andBackgroundImage:nil andTarget:self andAction:@selector(modifyAction:) andType:UIButtonTypeCustom];
    [saveBtn setImage:[UIImage imageNamed:@"shezhi_press"] forState:UIControlStateNormal];
    
    [navBar addSubview:saveBtn];
    
    UIButton *lanyaBtn = [CreateComponent createButtonWithFrame:CGRectMake(10, 7, 30, 30) andTitle:nil andTitleColor:YAHEI andBackgroundImage:nil andTarget:self andAction:nil andType:UIButtonTypeCustom];
    [lanyaBtn setImage:[UIImage imageNamed:@"lanya"] forState:UIControlStateNormal];
    lanyaBtn.userInteractionEnabled = NO;
    [navBar addSubview:lanyaBtn];
    
//    btnJia = [CreateComponent createButtonWithFrame:CGRectMake(20, 115, 50, 50) andTitle:nil andTitleColor:YAHEI andBackgroundImage:nil andTarget:self andAction:@selector(jiaAction:) andType:UIButtonTypeCustom];
//    [btnJia setImage:[UIImage imageNamed:@"jia_normal"] forState:UIControlStateNormal];
//    [btnJia setImage:[UIImage imageNamed:@"jia_press"] forState:UIControlStateHighlighted];
//    [self.view addSubview: btnJia];
//    
//    btnJian = [CreateComponent createButtonWithFrame:CGRectMake(250, 115, 50, 50) andTitle:nil andTitleColor:YAHEI andBackgroundImage:nil andTarget:self andAction:@selector(jianAction:) andType:UIButtonTypeCustom];
//    [btnJian setImage:[UIImage imageNamed:@"jian_normal"] forState:UIControlStateNormal];
//    [btnJian setImage:[UIImage imageNamed:@"jian_press"] forState:UIControlStateHighlighted];
//    [self.view addSubview: btnJian];
//    
//    lblValue = [[ UILabel alloc] init];
//    lblValue.text = @"自动";
//    lblValue.backgroundColor= [UIColor clearColor];
//    lblValue.font=[UIFont systemFontOfSize:50];
//    lblValue.textAlignment=NSTextAlignmentCenter;
//    lblValue.frame = CGRectMake(0,NAV_HEIGHT+80,300,40) ;
//    lblValue.textColor = [UIColor colorWithRed:0/255 green:147.0/255 blue:253.0/255 alpha:1];//0093ffd
//    [self.view addSubview: lblValue];
//    
//    UIButton *btnQiangdu = [CreateComponent createButtonWithFrame:CGRectMake(20, 210, 135, 120) andTitle:nil andTitleColor:YAHEI andBackgroundImage:nil andTarget:self andAction:@selector(qiangduAction:) andType:UIButtonTypeCustom];
//    [btnQiangdu setImage:[UIImage imageNamed:@"qiangdu_normal"] forState:UIControlStateNormal];
//    [btnQiangdu setImage:[UIImage imageNamed:@"qiangdu_press"] forState:UIControlStateHighlighted];
//    [self.view addSubview: btnQiangdu];
//    
//    UIButton *btnDingshi = [CreateComponent createButtonWithFrame:CGRectMake(162, 210, 135, 120) andTitle:nil andTitleColor:YAHEI andBackgroundImage:nil andTarget:self andAction:@selector(dingshiAction:) andType:UIButtonTypeCustom];
//    [btnDingshi setImage:[UIImage imageNamed:@"dingshi_normal"] forState:UIControlStateNormal];
//    [btnDingshi setImage:[UIImage imageNamed:@"dingshi_press"] forState:UIControlStateHighlighted];
//    [self.view addSubview: btnDingshi];
//    
//    UIButton *btnReliao = [CreateComponent createButtonWithFrame:CGRectMake(20, 330, 135, 120) andTitle:nil andTitleColor:YAHEI andBackgroundImage:nil andTarget:self andAction:@selector(reliaoAction:) andType:UIButtonTypeCustom];
//    [btnReliao setImage:[UIImage imageNamed:@"reliao_normal"] forState:UIControlStateNormal];
//    [btnReliao setImage:[UIImage imageNamed:@"reliao_press"] forState:UIControlStateHighlighted];
//    [self.view addSubview: btnReliao];
//    
//    UIButton *btnGuangliao = [CreateComponent createButtonWithFrame:CGRectMake(162, 330, 135, 120) andTitle:nil andTitleColor:YAHEI andBackgroundImage:nil andTarget:self andAction:@selector(guangliaoAction:) andType:UIButtonTypeCustom];
//    [btnGuangliao setImage:[UIImage imageNamed:@"guangliao_normal"] forState:UIControlStateNormal];
//    [btnGuangliao setImage:[UIImage imageNamed:@"guangliao_press"] forState:UIControlStateHighlighted];
//    [self.view addSubview: btnGuangliao];
//    
//    UIButton *btnMoshi = [CreateComponent createButtonWithFrame:CGRectMake(98, 272, 120, 120) andTitle:nil andTitleColor:YAHEI andBackgroundImage:nil andTarget:self andAction:@selector(moshiAction:) andType:UIButtonTypeCustom];
//    [btnMoshi setImage:[UIImage imageNamed:@"moshi_normal"] forState:UIControlStateNormal];
//    [btnMoshi setImage:[UIImage imageNamed:@"moshi_press"] forState:UIControlStateHighlighted];
//    [self.view addSubview: btnMoshi];
//    
//    UIButton *btnDianyuan = [CreateComponent createButtonWithFrame:CGRectMake(114, 450, 90, 90) andTitle:nil andTitleColor:YAHEI andBackgroundImage:nil andTarget:self andAction:@selector(powerAction:) andType:UIButtonTypeCustom];
//    [btnDianyuan setImage:[UIImage imageNamed:@"dianyuan_normal"] forState:UIControlStateNormal];
//    [btnDianyuan setImage:[UIImage imageNamed:@"dianyuan_press"] forState:UIControlStateHighlighted];
//    [self.view addSubview: btnDianyuan];
//    
//    
//    
//    lblDianyuan = [[ UILabel alloc] init];
//    lblDianyuan.text = @"电源（关）";
//    lblDianyuan.font=[UIFont systemFontOfSize:12];
//    lblDianyuan.textAlignment=NSTextAlignmentCenter;
//    lblDianyuan.frame = CGRectMake(10,525,300,30) ;
//    lblDianyuan.textColor = [UIColor whiteColor];//0093ffd
//    [self.view addSubview: lblDianyuan];
    
    
    currentMode=1;
    intqiangdu=10;
    intdingshi=10;
    moshiValue=-1;
}
//修改按钮
- (void)modifyAction:(UIButton *)sender
{
    
    [self.navigationController pushViewController:[self registerVC] animated:YES];
    
    
    
    
}
- (IBAction)jiaAction:(UIButton *)sender
{
    if(currentMode==1)
    {
        intqiangdu= [lblValue.text intValue];
        Byte byteData[2] = {'Q', 0x01};
        if(intqiangdu<20){
            intqiangdu = intqiangdu+1 ;
        }
       // NSData *aData = [[NSString stringWithFormat:@"%d",intqiangdu] dataUsingEncoding: NSUTF8StringEncoding];
       // Byte *testByte = (Byte *)[aData bytes];
       // byteData[1]=testByte;
        
        
        
       // NSData *aData = [NSData dataWithBytes: &intqiangdu length: sizeof(intqiangdu)];
        //Byte *testByte = (Byte *)[aData bytes];
        //byteData[1]=*testByte;
        
        
         byteData[1]=(Byte)intqiangdu;
        [self sendMessage:byteData];
        lblValue.text=[NSString stringWithFormat:@"%d",intqiangdu];
        
    }else{
        intdingshi= [lblValue.text intValue];
        Byte byteData[2] = {'S', 0x01};
        if(intdingshi<60){
            intdingshi = intdingshi +10 ;
        }
       // NSData *aData = [[NSString stringWithFormat:@"%d",intdingshi] dataUsingEncoding: NSUTF8StringEncoding];
       // Byte *testByte = (Byte *)[aData bytes];
        //byteData[1]=testByte;
         byteData[1]=(Byte)intdingshi;
        [self sendMessage:byteData];
        lblValue.text=[NSString stringWithFormat:@"%d",intdingshi];
        
    }
}
- (IBAction)jianAction:(UIButton *)sender
{
    if(currentMode==1)
    {
        intqiangdu= [lblValue.text intValue];
        Byte byteData[2] = {'Q', 0x01};
        if(intqiangdu>1){
            intqiangdu = intqiangdu-1 ;
        }
        //NSData *aData = [[NSString stringWithFormat:@"%d",intqiangdu] dataUsingEncoding: NSUTF8StringEncoding];
       // Byte *testByte = (Byte *)[aData bytes];
        
        //byteData[1]=testByte;
        //byteData[1]=(Byte)intqiangdu;
        
        
        ////NSData *aData = [NSData dataWithBytes: &intqiangdu length: sizeof(intqiangdu)];
        //Byte *testByte = (Byte *)[aData bytes];
       // byteData[1]=*testByte;
        
        byteData[1]=(Byte)intqiangdu;
        
        
        [self sendMessage:byteData];
        lblValue.text=[NSString stringWithFormat:@"%d",intqiangdu];
        
    }else{
        intdingshi= [lblValue.text intValue];
        Byte byteData[2] = {'S', 0x01};
        if(intdingshi>10){
            intdingshi = intdingshi -10 ;
        }
        //NSData *aData = [[NSString stringWithFormat:@"%d",intdingshi] dataUsingEncoding: NSUTF8StringEncoding];
       // Byte *testByte = (Byte *)[aData bytes];
        //byteData[1]=testByte;
        byteData[1]=(Byte)intdingshi;
        [self sendMessage:byteData];
        
        lblValue.text=[NSString stringWithFormat:@"%d",intdingshi];
        
    }
}
- (IBAction)powerAction:(UIButton *)sender
{
    
    if(!PowerOpen){
       Byte byteData[2] = {'C', 0x02};
        [self sendMessage:byteData];
        PowerOpen = true;
        lblDianyuan.text = @"电源（开）";
    }else{
       Byte byteData[2] = {'C', 0x01};
        [self sendMessage:byteData];
        PowerOpen = false;
        lblDianyuan.text = @"电源（关）";
    }
    
}
- (IBAction)reliaoAction:(UIButton *)sender
{
    
    if(!ReLiao){
        Byte byteData[2] = {'A', 0x02};
        [self sendMessage: byteData];
        ReLiao = true;
        
    }else{
        Byte byteData[2] = {'A', 0x01};
        [self sendMessage: byteData];
        ReLiao = NO;
    }
}
- (IBAction)guangliaoAction:(UIButton *)sender
{
    
    if(!GuangLiao){
        Byte byteData[2] = {'B', 0x02};
        [self sendMessage: byteData];
        GuangLiao = YES;
        
    }else{
        Byte byteData[2] = {'B', 0x01};
        [self sendMessage: byteData];
        GuangLiao = false;
    }
}

- (IBAction)qiangduAction:(UIButton *)sender
{
    
    btnJia.enabled=true;
    btnJian.enabled=true;
    lblTitle.text=@"强度调整";
    currentMode=1;
    lblValue.text=[NSString stringWithFormat:@"%d",intqiangdu];
    
}
- (IBAction)dingshiAction:(UIButton *)sender
{
    btnJia.enabled=true;
    btnJian.enabled=true;
    lblTitle.text=@"定时设定";
    currentMode=2;
    lblValue.text=[NSString stringWithFormat:@"%d",intdingshi];
    
}
- (IBAction)moshiAction:(UIButton *)sender
{
    btnJia.enabled=false;
    btnJian.enabled=false;
    lblTitle.text=@"模式设定";
    Byte byteData[2] = {'M',0x01};
    if(moshiValue<10){
        moshiValue = moshiValue+1;
    }else{
        moshiValue = 0;
    }
    //NSData *aData = [[NSString stringWithFormat:@"%d",moshiValue] dataUsingEncoding: NSUTF8StringEncoding];
    //Byte *testByte = (Byte *)[aData bytes];
   // byteData[1]=testByte;
    byteData[1]=(Byte)moshiValue;
    [self sendMessage: byteData];
    if(moshiValue == 0){
        lblValue.text=@"自动";
        lblValue.font=[UIFont fontWithName:lblValue.font.fontName size:60 ];
        //NumText.setTextSize(60);
    }else{
        lblValue.text=[NSString stringWithFormat:@"%d",moshiValue];
        lblValue.font=[UIFont fontWithName:lblValue.font.fontName size:90 ];
    }
    
}


- (void) sendMessage:(Byte *)byteData
{
    
    NSData * data = [NSData dataWithBytes:byteData length:2];
    
    BCRegisteredViewController  * regVC = [self registerVC];
    [regVC.peripheral writeValue:data forCharacteristic:regVC.characteristic type:CBCharacteristicWriteWithResponse];
}

@end
