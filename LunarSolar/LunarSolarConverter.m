//
//  LunarSolarConverter.m
//
//
//  Created by isee15 on 15/1/13.
//  Copyright (c) 2015年 isee15. All rights reserved.
//

#import "LunarSolarConverter.h"
//1890-2222年对照表（created by generate.htm）
static int lunar_month_days[] = {1887, 0x1694, 0x16aa, 0x4ad5, 0xab6, 0xc4b7, 0x4ae, 0xa56, 0xb52a, 0x1d2a, 0xd54, 0x75aa, 0x156a, 0x1096d, 0x95c, 0x14ae, 0xaa4d, 0x1a4c, 0x1b2a, 0x8d55, 0xad4, 0x135a, 0x495d, 0x95c, 0xd49b, 0x149a, 0x1a4a, 0xbaa5, 0x16a8, 0x1ad4, 0x52da, 0x12b6, 0xe937, 0x92e, 0x1496, 0xb64b, 0xd4a, 0xda8, 0x95b5, 0x56c, 0x12ae, 0x492f, 0x92e, 0xcc96, 0x1a94, 0x1d4a, 0xada9, 0xb5a, 0x56c, 0x726e, 0x125c, 0xf92d, 0x192a, 0x1a94, 0xdb4a, 0x16aa, 0xad4, 0x955b, 0x4ba, 0x125a, 0x592b, 0x152a, 0xf695, 0xd94, 0x16aa, 0xaab5, 0x9b4, 0x14b6, 0x6a57, 0xa56, 0x1152a, 0x1d2a, 0xd54, 0xd5aa, 0x156a, 0x96c, 0x94ae, 0x14ae, 0xa4c, 0x7d26, 0x1b2a, 0xeb55, 0xad4, 0x12da, 0xa95d, 0x95a, 0x149a, 0x9a4d, 0x1a4a, 0x11aa5, 0x16a8, 0x16d4, 0xd2da, 0x12b6, 0x936, 0x9497, 0x1496, 0x1564b, 0xd4a, 0xda8, 0xd5b4, 0x156c, 0x12ae, 0xa92f, 0x92e, 0xc96, 0x6d4a, 0x1d4a, 0x10d65, 0xb58, 0x156c, 0xb26d, 0x125c, 0x192c, 0x9a95, 0x1a94, 0x1b4a, 0x4b55, 0xad4, 0xf55b, 0x4ba, 0x125a, 0xb92b, 0x152a, 0x1694, 0x96aa, 0x15aa, 0x12ab5, 0x974, 0x14b6, 0xca57, 0xa56, 0x1526, 0x8e95, 0xd54, 0x15aa, 0x49b5, 0x96c, 0xd4ae, 0x149c, 0x1a4c, 0xbd26, 0x1aa6, 0xb54, 0x6d6a, 0x12da, 0x1695d, 0x95a, 0x149a, 0xda4b, 0x1a4a, 0x1aa4, 0xbb54, 0x16b4, 0xada, 0x495b, 0x936, 0xf497, 0x1496, 0x154a, 0xb6a5, 0xda4, 0x15b4, 0x6ab6, 0x126e, 0x1092f, 0x92e, 0xc96, 0xcd4a, 0x1d4a, 0xd64, 0x956c, 0x155c, 0x125c, 0x792e, 0x192c, 0xfa95, 0x1a94, 0x1b4a, 0xab55, 0xad4, 0x14da, 0x8a5d, 0xa5a, 0x1152b, 0x152a, 0x1694, 0xd6aa, 0x15aa, 0xab4, 0x94ba, 0x14b6, 0xa56, 0x7527, 0xd26, 0xee53, 0xd54, 0x15aa, 0xa9b5, 0x96c, 0x14ae, 0x8a4e, 0x1a4c, 0x11d26, 0x1aa4, 0x1b54, 0xcd6a, 0xada, 0x95c, 0x949d, 0x149a, 0x1a2a, 0x5b25, 0x1aa4, 0xfb52, 0x16b4, 0xaba, 0xa95b, 0x936, 0x1496, 0x9a4b, 0x154a, 0x136a5, 0xda4, 0x15ac, 0xcab6, 0x126e, 0x92e, 0x8c97, 0xa96, 0xd4a, 0x6da5, 0xd54, 0xf56a, 0x155a, 0xa5c, 0xb92e, 0x152c, 0x1a94, 0x9d4a, 0x1b2a, 0x16b55, 0xad4, 0x14da, 0xca5d, 0xa5a, 0x151a, 0xba95, 0x1654, 0x16aa, 0x4ad5, 0xab4, 0xf4ba, 0x14b6, 0xa56, 0xb517, 0xd16, 0xe52, 0x96aa, 0xd6a, 0x165b5, 0x96c, 0x14ae, 0xca2e, 0x1a2c, 0x1d16, 0xad52, 0x1b52, 0xb6a, 0x656d, 0x55c, 0xf45d, 0x145a, 0x1a2a, 0xda95, 0x16a4, 0x1ad2, 0x8b5a, 0xab6, 0x1455b, 0x8b6, 0x1456, 0xd52b, 0x152a, 0x1694, 0xb6aa, 0x15aa, 0xab6, 0x64b7, 0x8ae, 0xec57, 0xa56, 0xd2a, 0xcd95, 0xb54, 0x156a, 0x8a6d, 0x95c, 0x14ae, 0x4a56, 0x1a54, 0xdd2a, 0x1aaa, 0xb54, 0xb56a, 0x14da, 0x95c, 0x74ab, 0x149a, 0xfa4b, 0x1652, 0x16aa, 0xcad5, 0x5b4, 0x12ba, 0x895b, 0x936, 0x13497, 0xc96, 0xd52, 0xd6a9, 0xd6a, 0x56c, 0x92b6, 0x126e, 0x92e, 0x6c96, 0x1c94, 0xfd4a, 0x1b52, 0xb6a, 0xa56d, 0x55c, 0x125c, 0x992d, 0x192a, 0x13a95};

static int solar_1_1[] = {1887, 0xec04c, 0xec23f, 0xec435, 0xec649, 0xec83e, 0xeca51, 0xecc46, 0xece3a, 0xed04d, 0xed242, 0xed436, 0xed64a, 0xed83f, 0xeda53, 0xedc48, 0xede3d, 0xee050, 0xee244, 0xee439, 0xee64d, 0xee842, 0xeea36, 0xeec4a, 0xeee3e, 0xef052, 0xef246, 0xef43a, 0xef64e, 0xef843, 0xefa37, 0xefc4b, 0xefe41, 0xf0054, 0xf0248, 0xf043c, 0xf0650, 0xf0845, 0xf0a38, 0xf0c4d, 0xf0e42, 0xf1037, 0xf124a, 0xf143e, 0xf1651, 0xf1846, 0xf1a3a, 0xf1c4e, 0xf1e44, 0xf2038, 0xf224b, 0xf243f, 0xf2653, 0xf2848, 0xf2a3b, 0xf2c4f, 0xf2e45, 0xf3039, 0xf324d, 0xf3442, 0xf3636, 0xf384a, 0xf3a3d, 0xf3c51, 0xf3e46, 0xf403b, 0xf424e, 0xf4443, 0xf4638, 0xf484c, 0xf4a3f, 0xf4c52, 0xf4e48, 0xf503c, 0xf524f, 0xf5445, 0xf5639, 0xf584d, 0xf5a42, 0xf5c35, 0xf5e49, 0xf603e, 0xf6251, 0xf6446, 0xf663b, 0xf684f, 0xf6a43, 0xf6c37, 0xf6e4b, 0xf703f, 0xf7252, 0xf7447, 0xf763c, 0xf7850, 0xf7a45, 0xf7c39, 0xf7e4d, 0xf8042, 0xf8254, 0xf8449, 0xf863d, 0xf8851, 0xf8a46, 0xf8c3b, 0xf8e4f, 0xf9044, 0xf9237, 0xf944a, 0xf963f, 0xf9853, 0xf9a47, 0xf9c3c, 0xf9e50, 0xfa045, 0xfa238, 0xfa44c, 0xfa641, 0xfa836, 0xfaa49, 0xfac3d, 0xfae52, 0xfb047, 0xfb23a, 0xfb44e, 0xfb643, 0xfb837, 0xfba4a, 0xfbc3f, 0xfbe53, 0xfc048, 0xfc23c, 0xfc450, 0xfc645, 0xfc839, 0xfca4c, 0xfcc41, 0xfce36, 0xfd04a, 0xfd23d, 0xfd451, 0xfd646, 0xfd83a, 0xfda4d, 0xfdc43, 0xfde37, 0xfe04b, 0xfe23f, 0xfe453, 0xfe648, 0xfe83c, 0xfea4f, 0xfec44, 0xfee38, 0xff04c, 0xff241, 0xff436, 0xff64a, 0xff83e, 0xffa51, 0xffc46, 0xffe3a, 0x10004e, 0x100242, 0x100437, 0x10064b, 0x100841, 0x100a53, 0x100c48, 0x100e3c, 0x10104f, 0x101244, 0x101438, 0x10164c, 0x101842, 0x101a35, 0x101c49, 0x101e3d, 0x102051, 0x102245, 0x10243a, 0x10264e, 0x102843, 0x102a37, 0x102c4b, 0x102e3f, 0x103053, 0x103247, 0x10343b, 0x10364f, 0x103845, 0x103a38, 0x103c4c, 0x103e42, 0x104036, 0x104249, 0x10443d, 0x104651, 0x104846, 0x104a3a, 0x104c4e, 0x104e43, 0x105038, 0x10524a, 0x10543e, 0x105652, 0x105847, 0x105a3b, 0x105c4f, 0x105e45, 0x106039, 0x10624c, 0x106441, 0x106635, 0x106849, 0x106a3d, 0x106c51, 0x106e47, 0x10703c, 0x10724f, 0x107444, 0x107638, 0x10784c, 0x107a3f, 0x107c53, 0x107e48, 0x10803d, 0x108250, 0x108446, 0x10863a, 0x10884e, 0x108a42, 0x108c36, 0x108e4a, 0x10903e, 0x109251, 0x109447, 0x10963b, 0x10984f, 0x109a43, 0x109c37, 0x109e4b, 0x10a041, 0x10a253, 0x10a448, 0x10a63d, 0x10a851, 0x10aa45, 0x10ac39, 0x10ae4d, 0x10b042, 0x10b236, 0x10b44a, 0x10b63e, 0x10b852, 0x10ba47, 0x10bc3b, 0x10be4f, 0x10c044, 0x10c237, 0x10c44b, 0x10c641, 0x10c854, 0x10ca48, 0x10cc3d, 0x10ce50, 0x10d045, 0x10d239, 0x10d44c, 0x10d642, 0x10d837, 0x10da4a, 0x10dc3e, 0x10de52, 0x10e047, 0x10e23a, 0x10e44e, 0x10e643, 0x10e838, 0x10ea4b, 0x10ec41, 0x10ee54, 0x10f049, 0x10f23c, 0x10f450, 0x10f645, 0x10f839, 0x10fa4c, 0x10fc42, 0x10fe37, 0x11004b, 0x11023e, 0x110452, 0x110647, 0x11083b, 0x110a4e, 0x110c43, 0x110e38, 0x11104c, 0x11123f, 0x111435, 0x111648, 0x11183c, 0x111a4f, 0x111c45, 0x111e39, 0x11204d, 0x112242, 0x112436, 0x11264a, 0x11283e, 0x112a51, 0x112c46, 0x112e3b, 0x11304f, 0x113244, 0x113439, 0x11364d, 0x113842, 0x113a54, 0x113c49, 0x113e3d, 0x114051, 0x114246, 0x11443a, 0x11464e, 0x114844, 0x114a37, 0x114c4a, 0x114e3e, 0x115052, 0x115247, 0x11543c, 0x115650, 0x115845, 0x115a38, 0x115c4c, 0x115e41};

int GetBitInt(int data, int length, int shift) {
    return (data & (((1 << length) - 1) << shift)) >> shift;
}

//WARNING: Dates before Oct. 1582 are inaccurate
long SolarToInt(int y, int m, int d) {
    m = (m + 9) % 12;
    y = y - m / 10;
    return 365l * y + y / 4 - y / 100 + y / 400 + (m * 306 + 5) / 10 + (d - 1);
}

static const NSString* tianGan[] = {@"甲",@"乙",@"丙",@"丁",@"戊",@"己",@"庚",@"辛",@"壬",@"癸"};
static const NSString* diZhi[] = {@"子",@"丑",@"寅",@"卯",@"辰",@"巳",@"午",@"未",@"申",@"酉",@"戌",@"亥"};


static NSString *chineseYears[] = {
                        @"甲子",   @"乙丑",  @"丙寅",  @"丁卯",  @"戊辰",  @"己巳",  @"庚午",  @"辛未",  @"壬申",  @"癸酉",
                        @"甲戌",   @"乙亥",  @"丙子",  @"丁丑",  @"戊寅",  @"己卯",  @"庚辰",  @"辛己",  @"壬午",  @"癸未",
                        @"甲申",   @"乙酉",  @"丙戌",  @"丁亥",  @"戊子",  @"己丑",  @"庚寅",  @"辛卯",  @"壬辰",  @"癸巳",
                        @"甲午",   @"乙未",  @"丙申",  @"丁酉",  @"戊戌",  @"己亥",  @"庚子",  @"辛丑",  @"壬寅",  @"癸卯",
                        @"甲辰",   @"乙巳",  @"丙午",  @"丁未",  @"戊申",  @"己酉",  @"庚戌",  @"辛亥",  @"壬子",  @"癸丑",
                        @"甲寅",   @"乙卯",  @"丙辰",  @"丁巳",  @"戊午",  @"己未",  @"庚申",  @"辛酉",  @"壬戌",  @"癸亥", nil};

static NSString *chineseMonths[] = {
                        @"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月",
                        @"九月", @"十月", @"冬月", @"腊月", nil};


static NSString *chineseDays[] = {
                        @"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",
                        @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",
                        @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十",  nil};

@implementation Lunar : NSObject
/**
 *
 * @param lunarYear 农历年份
 * @return String of Ganzhi: 甲子
 * Tiangan:甲乙丙丁戊己庚辛壬癸 Dizhi: 子丑寅卯辰巳无为申酉戌亥
 */
- (NSString*)lunarYearToGanZhi:(int)lunarYear {
    return [NSString stringWithFormat:@"%@%@", tianGan[(lunarYear-4) % 10], diZhi[(lunarYear-4) % 12]];
}
- (NSString *)lunarYearString {
    return [self lunarYearToGanZhi:self.lunarYear];
}
- (NSString *)lunarMonthString {
    return chineseMonths[self.lunarMonth-1];
}
- (NSString *)lunarDayString {
    return chineseDays[self.lunarDay-1];
}
- (NSString *)description {
    return [NSString stringWithFormat:@"Lunar:%d,%d,%d(chinese:%@_%@_%@)",self.lunarYear, self.lunarMonth, self.lunarDay, self.lunarYearString, self.lunarMonthString, self.lunarDayString];
}
@end

@implementation Solar : NSObject
+ (instancetype)newWithDate:(NSDate*)date {
    return [[self alloc] initWithDate:date];
}
- (instancetype)initWithDate:(NSDate*)date {
    if (self = [super init]) {
        NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
        int year = (int) [components year];
        int month = (int) [components month];
        int day = (int) [components day];
        
        self.solarYear = year;
        self.solarMonth = month;
        self.solarDay = day;
    }
    return self;
}
- (NSString *)description {
    return [NSString stringWithFormat:@"Solar:%d,%d,%d",self.solarYear, self.solarMonth, self.solarDay];
}
@end

@implementation LunarSolarConverter
+(NSDate*)createDate:(int)year month:(int)month day:(int)day {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    return [calendar dateFromComponents:components];
}

+ (Solar *)SolarFromInt:(long)g
{
    long y = (10000ll * g + 14780) / 3652425;
    long ddd = g - (365 * y + y / 4 - y / 100 + y / 400);

    if (ddd < 0) {
        y--;
        ddd = g - (365 * y + y / 4 - y / 100 + y / 400);
    }

    long mi = (100 * ddd + 52) / 3060;
    long mm = (mi + 2) % 12 + 1;
    y = y + (mi + 2) / 12;
    long dd = ddd - (mi * 306 + 5) / 10 + 1;
    Solar *solar = [[Solar alloc] init];
    solar.solarYear = (int) y;
    solar.solarMonth = (int) mm;
    solar.solarDay = (int) dd;
    return solar;
}

+ (Solar *)lunarToSolar:(Lunar *)lunar;
{
    int days = lunar_month_days[lunar.lunarYear - lunar_month_days[0]];
    int leap = GetBitInt(days, 4, 13);
    int offset = 0;
    int loopend = leap;

    if (!lunar.isleap) {
        if (lunar.lunarMonth <= leap || leap == 0) {
            loopend = lunar.lunarMonth - 1;
        } else {
            loopend = lunar.lunarMonth;
        }
    }

    for (int i = 0; i < loopend; i++) {
        offset += GetBitInt(days, 1, 12 - i) == 1 ? 30 : 29;
    }

    offset += lunar.lunarDay;

    int solar11 = solar_1_1[lunar.lunarYear - solar_1_1[0]];

    int y = GetBitInt(solar11, 12, 9);
    int m = GetBitInt(solar11, 4, 5);
    int d = GetBitInt(solar11, 5, 0);

    return [self SolarFromInt:(SolarToInt(y, m, d) + offset - 1)];
}

+ (Lunar *)solarToLunar:(Solar *)solar;
{
    Lunar *lunar = [[Lunar alloc] init];
    int index = solar.solarYear - solar_1_1[0];
    int data = (solar.solarYear << 9) | (solar.solarMonth << 5) | (solar.solarDay);
    int solar11 = 0;

    if (solar_1_1[index] > data) {
        index--;
    }

    solar11 = solar_1_1[index];
    int y = GetBitInt(solar11, 12, 9);
    int m = GetBitInt(solar11, 4, 5);
    int d = GetBitInt(solar11, 5, 0);
    long offset = SolarToInt(solar.solarYear, solar.solarMonth, solar.solarDay) - SolarToInt(y, m, d);

    int days = lunar_month_days[index];
    int leap = GetBitInt(days, 4, 13);

    int lunarY = index + solar_1_1[0];
    int lunarM = 1;
    int lunarD = 1;
    offset += 1;

    for (int i = 0; i < 13; i++) {
        int dm = GetBitInt(days, 1, 12 - i) == 1 ? 30 : 29;

        if (offset > dm) {
            lunarM++;
            offset -= dm;
        } else {
            break;
        }
    }

    lunarD = (int) (offset);
    lunar.lunarYear = lunarY;
    lunar.lunarMonth = lunarM;
    lunar.isleap = false;

    if (leap != 0 && lunarM > leap) {
        lunar.lunarMonth = lunarM - 1;

        if (lunarM == leap + 1) {
            lunar.isleap = true;
        }
    }

    lunar.lunarDay = lunarD;
    return lunar;
}

//链接：http://www.jianshu.com/p/5850a5d03b8f
+(NSString*)getChineseCalendarWithDate:(NSDate*)date {
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:date];
    
    NSLog(@"localeComp: %zd,%zd_%zd",localeComp.year,localeComp.month,localeComp.day);
    
    NSString *y_str = chineseYears[localeComp.year-1];
    NSString *m_str = chineseMonths[localeComp.month-1];
    NSString *d_str;
    if (localeComp.day == 0) {//iOS系统计算公历2057年9月28日计算会有错误，显示为丁丑年九月〇（可以去系统日历查看）同理还有公历2097年8月7日，显示为丁巳年七月〇
        d_str = @"〇";
    } else {
        d_str = chineseDays[localeComp.day-1];
    }
    NSString *chineseCal_str =[NSString stringWithFormat: @"%@_%@_%@",y_str,m_str,d_str];
    
    return chineseCal_str;
}

+ (void)TestCalendar {
    NSDate *dt = [LunarSolarConverter createDate:2017 month:11 day:7];
    NSDate *endTime = [LunarSolarConverter createDate:2220 month:12 day:31];
    while ([dt compare:endTime] == NSOrderedAscending) {
        Solar *sd = [Solar newWithDate:dt];
        Lunar *ld = [LunarSolarConverter solarToLunar:sd];
        NSLog(@"solar: %@", sd);
        NSLog(@"lunar: %@", ld);
        
        NSString *chineseCalendar = [LunarSolarConverter getChineseCalendarWithDate:dt];
        NSLog(@"chineseCalendar: %@", chineseCalendar);
        
        dt = [dt dateByAddingTimeInterval:60 * 60 * 24 * 365];
    }
    NSLog(@"check done");
}
@end
