//
//  CustomerNavBar.h
//  AiTe
//
//  Created by 吴再风 on 13-9-27.
//  Copyright (c) 2013年 吴再锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomerNavBar : UIView
{
    UILabel * titleLabel;
    
    UIViewController * targetController;
    
    UIButton * back;
}
//导航栏的title
@property(copy,nonatomic) NSString * titleName;

//是否添加返回按钮 (适用：Push and present )   默认:NO 
@property(assign,nonatomic) BOOL goBack;

//自定义左边按钮
@property(strong,nonatomic) UIButton * leftButton;

//中间按钮
@property(strong,nonatomic) UIButton * middleButton;

//自定义右边按钮
@property(strong,nonatomic) UIButton * rightButton;


-(id)initWithControllerTarget:(id)target;

@end
