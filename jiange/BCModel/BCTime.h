//
//  BCTime.h
//  cycling
//
//  Created by Pro on 3/18/14.
//  Copyright (c) 2014 王庭协. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCTime : NSObject
/*
 获取当前时间
 */
+(NSString *)getCurrentTime;
/*
 获取当前日期
 */
+(NSString *)getCurrentDate;

/*
 计算时间 （时分秒）
 */
+(NSString *)doTimeIntervalWithaTime:(NSString *) aTime bTime:(NSString *)bTime;

+(NSString *)doTimeIntervalWithaTime:(NSTimeInterval) timer;
/*
  获取N天前的日期
 */
+(NSString * )getBeforeDate:(int) count;
@end
