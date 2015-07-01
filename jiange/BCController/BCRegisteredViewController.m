//
//  BCRegisteredViewController.m
//  cycling
//
//  Created by 智美合 on 14-3-10.
//  Copyright (c) 2014年 王庭协. All rights reserved.
//

#import "BCRegisteredViewController.h"
#import "UIView+Action.h"
#import "Regular.h"
#import "CustomerNavBar.h"
#import "OperatingInstructionsViewController.h"
#import "AboutViewController.h"
#import "CoreBluetooth/CoreBluetooth.h"
@interface BCRegisteredViewController ()

@end

@implementation BCRegisteredViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7)
//    {
//        self.view.bounds = CGRectMake(0, -20, self.view.frame.size.width, self.view.frame.size.height);
//    }
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
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
    lblTitle.text = @"健格智能遥控器";
      lblTitle.backgroundColor= [UIColor clearColor];
    lblTitle.font=[UIFont systemFontOfSize:15];
    lblTitle.textAlignment=NSTextAlignmentLeft;
    lblTitle.frame = CGRectMake(20,NAV_HEIGHT + 15,200,30) ;
    lblTitle.textColor = [UIColor colorWithRed:0.0/255.0f green:147.0/255.0f blue:255.0/255.0f alpha:1.0f];
    [self.view addSubview: lblTitle];
    
    
    UIButton *btnRefresh = [CreateComponent createButtonWithFrame:CGRectMake(280, NAV_HEIGHT + 10, 30, 30) andTitle:nil andTitleColor:YAHEI andBackgroundImage:nil andTarget:self andAction:@selector(reScan:) andType:UIButtonTypeCustom];
    [btnRefresh setImage:[UIImage imageNamed:@"shuaxin_press"] forState:UIControlStateNormal];
    [self.view addSubview: btnRefresh];
    
    
    UILabel *lblLine = [[ UILabel alloc] init];
   
    lblLine.frame = CGRectMake(0,NAV_HEIGHT+50,320,1) ;
    lblLine.backgroundColor=[UIColor colorWithRed:5.0/255.0f green:56.0/255.0f blue:92.0/255.0f alpha:1.0f];//034A7F
    [self.view addSubview: lblLine];
    
    self.lblDesc = [[ UILabel alloc] init];
    self.lblDesc.text = @"没有找到已配对的设备";
     self.lblDesc.backgroundColor= [UIColor clearColor];
    self.lblDesc.font=[UIFont systemFontOfSize:12];
    //lblDesc.textAlignment=UITextAlignmentLeft;
    self.lblDesc.frame = CGRectMake(20,NAV_HEIGHT+55,320,30) ;
    self.lblDesc.textColor=[UIColor whiteColor];//034A7F
    self.lblDesc.hidden = YES;
    [self.view addSubview: self.lblDesc];
    
    self.tableViewPeripheral=[[UITableView alloc]initWithFrame:CGRectMake(0, NAV_HEIGHT+85, 320, self.view.frame.size.height - NAV_HEIGHT - 85 - 88)];
    self.tableViewPeripheral.delegate=self;
    self.tableViewPeripheral.dataSource=self;
    self.tableViewPeripheral.backgroundColor=[UIColor clearColor];
    self.tableViewPeripheral.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableViewPeripheral.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
    
    [self.view addSubview:self.tableViewPeripheral];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)operateAction:(id)sender {
    OperatingInstructionsViewController * controller = [[OperatingInstructionsViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}
- (IBAction)linkAction:(id)sender {
    AboutViewController * controller = [[AboutViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    self.lblDesc.hidden = !(self.peripheralArray.count == 0);
    return self.peripheralArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cell";
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIButton * conntectBtn = [CreateComponent createButtonWithFrame:CGRectMake(0, 0, 60, 26) andTitle:nil andTitleColor:[UIColor whiteColor] andBackgroundImage:nil andTarget:self andAction:@selector(connectBlueToothStatus:) andType:UIButtonTypeCustom];
        conntectBtn.backgroundColor = [UIColor colorWithRed:5.0/255.0f green:56.0/255.0f blue:92.0/255.0f alpha:1.0f];
        conntectBtn.layer.cornerRadius = 3.0f;
        cell.accessoryView = conntectBtn;
        
        UILabel *lblLine = [[ UILabel alloc] init];
        
        lblLine.frame = CGRectMake(0,43,320,0.5) ;
        lblLine.backgroundColor=[UIColor whiteColor];//034A7F
        [cell.contentView addSubview: lblLine];
    }
    
    if (self.peripheralArray.count > indexPath.row) {
        CBPeripheral *peripheral = [self.peripheralArray objectAtIndex:indexPath.row];
        NSString *state;
        switch (peripheral.state) {
            case CBPeripheralStateConnected:
                state = @"断开";
                break;
            case CBPeripheralStateConnecting:
                state = @"连接中";
                break;
            case CBPeripheralStateDisconnected:
                state = @"连接";
                break;
                
            default:
                break;
        }
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@", peripheral.name];
        cell.textLabel.textColor=[UIColor whiteColor];
        cell.detailTextLabel.text = [peripheral.identifier UUIDString];
        cell.detailTextLabel.textColor=[UIColor whiteColor];
        
        UIButton * connectBtn = (UIButton *)[cell accessoryView];
        connectBtn.tag = indexPath.row;
        [connectBtn setTitle:state forState:UIControlStateNormal];
        
//        if (peripheral.isConnected) {
//            cell.accessoryType = UITableViewCellAccessoryDetailButton;
//        }else{
//            cell.accessoryType = UITableViewCellAccessoryNone;
//        }
        
    }
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}


#pragma mark - Connect Bluetooth

- (void)connectBlueToothStatus:(UIButton *)sender{
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    
    CBPeripheral * peripheral = [self.peripheralArray objectAtIndex:sender.tag];
    if (peripheral.isConnected) {
        [self.cbCentralMgr cancelPeripheralConnection:peripheral];
        
        [userDefaults removeObjectForKey:UD_Peripheral_UUID];
        [userDefaults synchronize];
    }else{
        
        [self.cbCentralMgr connectPeripheral:peripheral options:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:CBConnectPeripheralOptionNotifyOnDisconnectionKey]];
        
        [userDefaults setValue:[peripheral.identifier UUIDString] forKey:UD_Peripheral_UUID];
        [userDefaults synchronize];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -Handle event

-(IBAction) reScan:(id)Sender
{
    [self scan];
}

- (void)dealloc{

}

@end
