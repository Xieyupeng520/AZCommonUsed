//
//  LunarSolarConverter.h
//
//
//  Created by isee15 on 15/1/13.
//  Copyright (c) 2015年 isee15. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lunar : NSObject
@property(nonatomic, assign) BOOL isleap; //是否闰月
@property(nonatomic, assign) int lunarDay; //农历 日
@property(nonatomic, assign) int lunarMonth; //农历 月
@property(nonatomic, assign) int lunarYear; //农历 年
@property(nonatomic, strong, readonly) NSString* lunarDayString; //农历 日  （廿四）
@property(nonatomic, strong, readonly) NSString* lunarMonthString; //农历 月（冬月）
@property(nonatomic, strong, readonly) NSString* lunarYearString; //农历 年  (丁丑)
@end

@interface Solar : NSObject
@property(assign) int solarDay; //公历 日
@property(assign) int solarMonth; //公历 月
@property(assign) int solarYear; //公历 年

+ (instancetype)newWithDate:(NSDate*)date;
- (instancetype)initWithDate:(NSDate*)date;
@end


@interface LunarSolarConverter : NSObject
/**
 * 通过年月日构造NSDate
 */
+(NSDate*)createDate:(int)year month:(int)month day:(int)day;
/**
 * 农历转公历
 */
+ (Solar *)lunarToSolar:(Lunar *)lunar;

/**
 * 方法一：公历转农历
 */
+ (Lunar *)solarToLunar:(Solar *)solar;

/**
 * 方法二：使用系统方法date转农历
 * iOS系统计算公历2057年9月28日计算会有错误，显示为丁丑_九月_〇（可以去系统日历查看）同理还有公历2097年8月7日，显示为丁巳_七月_〇
 */
+(NSString*)getChineseCalendarWithDate:(NSDate*)date;
/**
 * 测试方法，用来看效果滴
 */
+ (void)TestCalendar;
@end
