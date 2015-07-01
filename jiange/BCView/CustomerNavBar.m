//
//  CustomerNavBar.m
//  AiTe
//
//  Created by 吴再风 on 13-9-27.
//  Copyright (c) 2013年 吴再锋. All rights reserved.
//

#import "CustomerNavBar.h"
#import "CreateComponent.h"

#define NAV_44 44.0f
@implementation CustomerNavBar
-(id)initWithControllerTarget:(id)target{
    self=[super init];
    if (self) {
        
        targetController=target;
    }
    return self;
}
-(void)setGoBack:(BOOL)goBack{
    if (goBack) {
        [self addCommonGoBack];
    }
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {        // Initialization code
        //设置视图的位置
        self.frame=CGRectMake(0, 0, 320, NAV_HEIGHT);
        //设置背景图片
        UIImageView *nav_bg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, NAV_44)];
        nav_bg.userInteractionEnabled=YES;
        nav_bg.image=[UIImage imageNamed:@"top_bg"];
        [self addSubview:nav_bg];

    }
    return self;
}
-(void)setTitleName:(NSString *)titleName{
    if (!titleLabel) {
        //创建title
        titleLabel=[CreateComponent createLableWithFrame:CGRectMake(80, 0, 160, 44) andTitle:nil andfont:FONTBOLD(20) andTitleColor:WHITE andBackgroundColor:[UIColor clearColor] andTextAlignment:NSTextAlignmentCenter];
        //添加title到视图
        [self addSubview:titleLabel];
    }
    [titleLabel setText:titleName];
}
-(void)addCommonGoBack{
    if (_leftButton) {
        [_leftButton removeFromSuperview];
    }
    back=[CreateComponent createButtonWithFrame:CGRectMake(10, 7, 30, 30) andTitle:nil andTitleColor:YAHEI andBackgroundImage:nil andTarget:self andAction:@selector(backAction) andType:UIButtonTypeCustom];
    [back setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [self addSubview:back];
}

-(void)backAction{
    if (targetController && ![targetController.navigationController popViewControllerAnimated:YES]) {
        [targetController dismissViewControllerAnimated:YES completion:nil];
    }
}

//左边按钮设置器
-(void)setLeftButton:(UIButton *)leftButton
{
    if (back) {
        [back removeFromSuperview];
    }
    if (leftButton) {
        [_leftButton removeFromSuperview];
        
        leftButton.frame=CGRectMake(0, 0, NAV_44, NAV_44);
        
        [self addSubview:leftButton];
    }
}
//中间按钮
-(void)setMiddleButton:(UIButton *)middleButton
{
    //判断是否为空
    if (middleButton)
    {
        [_middleButton removeFromSuperview];
        
        //设置位置
        middleButton.frame=CGRectMake(349, 0, 70, NAV_44);
        //添加到视图
        [self addSubview:middleButton];
    }
}
//右边按钮设置器
-(void)setRightButton:(UIButton *)rightButton
{
    if (rightButton) {
        [_rightButton removeFromSuperview];
        
        rightButton.frame=CGRectMake(SCREEN_MAX_WIDTH-NAV_44, 0, NAV_44, NAV_44);
        
        [self addSubview:rightButton];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
