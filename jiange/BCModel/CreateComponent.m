//
//  CreateComponent.m
//  weifengnews
//
//  Created by wzf on 13-7-16.
//  Copyright (c) 2013年 tufu. All rights reserved.
//

#import "CreateComponent.h"

@implementation CreateComponent
//创建UILable方法
+(UILabel *) createLableWithFrame:(CGRect)frame
                         andTitle:(NSString *)title
                          andfont:(UIFont *)font
                    andTitleColor:(UIColor *)titleColor
               andBackgroundColor:(UIColor *)backgroundColor
                 andTextAlignment:(NSTextAlignment)textAlignment
{
    
    //创建UILable对象并设置位置大小
    UILabel * lable = [[UILabel alloc]initWithFrame:frame];
    //设置标题
    lable.text = title;
    //设置字体颜色
    lable.textColor = titleColor;
    //设置背景颜色
    lable.backgroundColor = backgroundColor;
    //设置字体大小
    lable.font = font;
    //设置字体格式
    lable.textAlignment = textAlignment;
    //设置阴影
//    lable.shadowColor = [UIColor blackColor];
//    lable.shadowOffset = CGSizeMake(0, -2);
    
    return lable;
}

//创建UIButton方法
+(UIButton *) createButtonWithFrame:(CGRect)frame
                           andTitle:(NSString *)title
                      andTitleColor:(UIColor *)titleColor
                 andBackgroundImage:(UIImage *)backgroundImage
                          andTarget:(id)target
                          andAction:(SEL)sel
                            andType:(UIButtonType)type
{
    //创建UIButton并设置类型
    UIButton * btn = [UIButton buttonWithType:type];
    //设置按键位置和大小
    btn.frame = frame;
    //设置按键名
    [btn setTitle:title forState:UIControlStateNormal];
    //设置按键名字体颜色
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    //背景图片
    [btn setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    //设置按键响应方法
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}
+ (UIImageView *) createImageViewWithOrigin:(CGPoint) origin andImage:(UIImage *)image{
    
    UIImageView * imageView=[[UIImageView alloc]initWithImage:image];
    
    CGRect rect=imageView.frame;
    rect.origin=origin;
    imageView.frame=rect;
    
    return imageView;
}



@end
