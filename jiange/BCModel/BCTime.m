//
//  BCTime.m
//  cycling
//
//  Created by Pro on 3/18/14.
//  Copyright (c) 2014 王庭协. All rights reserved.
//

#import "BCTime.h"

@implementation BCTime
+(NSString *)getCurrentTime{
    NSDate *  timeDate=[NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formatter stringFromDate:timeDate];
}
+(NSString *)getCurrentDate{
    NSDate *  timeDate=[NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [formatter stringFromDate:timeDate];
}
+(NSString *)doTimeIntervalWithaTime:(NSString *) aTime bTime:(NSString *)bTime{
    NSDateFormatter * formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * date1=[formatter dateFromString:aTime];
    NSDate * date2=[formatter dateFromString:bTime];
    NSTimeInterval timer=[date2 timeIntervalSinceDate:date1];
//    int hour=(int)(timer/3600);
//    int minute=(int)(timer-hour*3600)/60;
//    int second=timer-hour*3600-minute*60;
    int minute=(int)timer;
    
    NSString * dural=[NSString stringWithFormat:@"%d",minute];
    return dural;
}
+(NSString *)getBeforeDate:(int)count{
    NSDate * date=[NSDate date];
    NSTimeInterval interval=[date timeIntervalSince1970];
    NSTimeInterval longInterVal=count*24*60*60;
    NSTimeInterval newInterval=interval-longInterVal;
    NSDate * newDate=[NSDate dateWithTimeIntervalSince1970:newInterval];
    NSDateFormatter * formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
//    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formatter stringFromDate:newDate];
}
+(NSString *)doTimeIntervalWithaTime:(NSTimeInterval) timer{
    int hour=(int)(timer/3600);
    int minute=(int)(timer-hour*3600)/60;
//    int second=timer-hour*3600-minute*60;
    NSString * dural=[NSString stringWithFormat:@"%d时%d分",hour,minute];
    return dural;
}
/*计算时间
//NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//[formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
//
//NSDate *sDate  = [formatter dateFromString:startRangeButton.titleLabel.text];
//NSDate *eDate = [formatter dateFromString:endRangeButton.titleLabel.text];
//NSTimeInterval sinterval =  [sDate timeIntervalSince1970];
//long long start = sinterval*1000;
//NSTimeInterval einterval = [eDate timeIntervalSince1970];
//long long end = einterval*1000;
//[mConnectionHelper doTrack:mobile startTime:start endTime:end];
*/
//    NSTimeZone *zone = [NSTimeZone localTimeZone];
//    NSInteger interval = [zone secondsFromGMTForDate:[NSDate date]];
//    NSDate *localeDate = [[NSDate date] dateByAddingTimeInterval:interval];
//    NSTimeInterval timeInterval = [localeDate timeIntervalSince1970] - 60 * 60 * 8;
//    NSString *stringtimenow = [NSString stringWithFormat:@"%f",timeInterval];
//    NSString *stringtimenow1 = [stringtimenow substringWithRange:NSMakeRange(0, 10)];
//    NSString *stringtimenow2 = [stringtimenow substringWithRange:NSMakeRange(11, 3)];
//    NSMutableString *stringtimenow3 = [[NSMutableString alloc] initWithString:stringtimenow1];
//    [stringtimenow3 appendString:stringtimenow2];
//NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
//long long dTime = [[NSNumber numberWithDouble:time] longLongValue]; // 将double转为long long型
//NSString *curTime = [NSString stringWithFormat:@"%llu",dTime]; // 输出long long型

@end
