//
//  OperatingInstructionsViewController.m
//  jiange
//
//  Created by Pro on 15/6/25.
//  Copyright (c) 2015年 王庭协. All rights reserved.
//

#import "OperatingInstructionsViewController.h"

#import "CustomerNavBar.h"

@interface OperatingInstructionsViewController ()
{
    IBOutlet UILabel *instructionLabel;
    
}
@end

@implementation OperatingInstructionsViewController

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //返回按钮
    CustomerNavBar * navBar=[[CustomerNavBar alloc]initWithControllerTarget:self];
    navBar.titleName = @"键格智能遥控器";
    [navBar setGoBack:YES];
    
    [self.view addSubview:navBar];
    
    UIImageView *imagev=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    imagev.image=[UIImage imageNamed:@"bg_shezhi"];
    imagev.contentMode=UIViewContentModeScaleToFill;
    [self.view insertSubview:imagev atIndex:0];
    
    UILabel *lblTitle = [[ UILabel alloc] init];
    lblTitle.text = @"操作说明";
    lblTitle.backgroundColor= [UIColor clearColor];
    lblTitle.font=[UIFont systemFontOfSize:15];
    lblTitle.textAlignment=NSTextAlignmentLeft;
    lblTitle.frame = CGRectMake(20,NAV_HEIGHT + 15,200,30) ;
    lblTitle.textColor = [UIColor colorWithRed:0.0/255.0f green:147.0/255.0f blue:255.0/255.0f alpha:1.0f];
    [self.view addSubview: lblTitle];
    
    
    UILabel *lblLine = [[ UILabel alloc] init];
    
    lblLine.frame = CGRectMake(0,NAV_HEIGHT+50,320,1) ;
    lblLine.backgroundColor=[UIColor colorWithRed:5.0/255.0f green:56.0/255.0f blue:92.0/255.0f alpha:1.0f];//034A7F
    [self.view addSubview: lblLine];
    
    instructionLabel.text = @"      1、连接蓝牙，确认设备是否打开蓝牙，连接成功后，可以点击电源（开）或者（关）！甩脂机工作后，确认已经连接。\n      2、模式调节：只需点击模式按键即可变换震动模式！有11种模式选择，第一个是自动模式，后面有1-10种不同模式选择！\n      3、强度调节：点击强度，可以选择“加”或者“减”进行震动力度的调节。力度1-20档可以调节！\n      4、时间调节：点击时间，可以选择“加”或者“减”进行时间调节，时间选择有10、20、30、40、50、60分钟可任意选择！\n      5、光疗调节：点击光疗，红外灯打开，再次点击光疗，红外灯关闭！\n      6、热疗调节：点击热疗，开始加热，再次点击，热疗关闭。\n";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
