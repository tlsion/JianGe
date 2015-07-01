//
//  AboutViewController.m
//  jiange
//
//  Created by Pro on 15/6/25.
//  Copyright (c) 2015年 王庭协. All rights reserved.
//

#import "AboutViewController.h"
#import "CustomerNavBar.h"

@interface AboutViewController ()
{
    
    IBOutlet UILabel *instructionLabel;
}
@end

@implementation AboutViewController

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
    lblTitle.text = @"联系方式";
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
    
    instructionLabel.text = @"      地址：河南省临颍县高新技术开发区临颍健格电子厂\n      电话：0395-5671695\n      手机：15139550858   18739560214\n";
    
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
