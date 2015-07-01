//
//  CreateComponent.h
//  weifengnews
//
//  Created by wzf on 13-7-16.
//  Copyright (c) 2013年 tufu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CreateComponent : NSObject


//创建UILable方法
+(UILabel *) createLableWithFrame:(CGRect)frame
                         andTitle:(NSString *)title
                          andfont:(UIFont *)font
                    andTitleColor:(UIColor *)titleColor
               andBackgroundColor:(UIColor *)backgroundColor
                 andTextAlignment:(NSTextAlignment)textAlignment;

//创建UIButton方法
+(UIButton *) createButtonWithFrame:(CGRect)frame
                           andTitle:(NSString *)title
                      andTitleColor:(UIColor *)titleColor
                 andBackgroundImage:(UIImage *)backgroundImage
                          andTarget:(id)target
                          andAction:(SEL)sel
                            andType:(UIButtonType)type;

+(UIImageView *) createImageViewWithOrigin:(CGPoint) origin andImage:(UIImage *)image;
@end
