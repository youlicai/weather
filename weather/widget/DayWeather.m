//
//  DayWeather.m
//  weather
//
//  Created by onlyou on 2019/6/13.
//  Copyright © 2019 onlyou. All rights reserved.
//

#import "DayWeather.h"
@interface DayWeather()
@property(nonatomic ,strong) UILabel *date;
@property(nonatomic ,strong) UIImageView *weather;
@property(nonatomic ,strong) UILabel *temperature;
@end
@implementation DayWeather

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        _date=[[UILabel alloc]initWithFrame:CGRectMake(5*F, 0, 30*F, 15*F)];
        _weather=[[UIImageView alloc]initWithFrame:CGRectMake(45*F, 3*F, 8*F, 8*F)];
        _temperature=[[UILabel alloc]initWithFrame:CGRectMake(65*F, 0, 30*F, 15*F)];
        _temperature.textAlignment=NSTextAlignmentRight;
        [self addSubview:_date];
        [self addSubview:_weather];
        [self addSubview:_temperature];
    }
    return self;
}
-(void)setData:(NSString *)time weather_id:(NSString *)weather_id min_temperature:(NSString *) min_temperature max_temperature:(NSString *) max_temperature;{
//    time = [time substringFromIndex:5];
//    time=[time stringByReplacingOccurrencesOfString:@"-" withString:@"月"];
//    time=[time stringByAppendingString:@"日"];
    _date.text=time;
//    NSLog([@(weather_id) stringValue]);
    [_weather setImage:[UIImage imageNamed:weather_id]];
    NSString *temperature=[min_temperature stringByAppendingString:@"/"];
    temperature=[temperature stringByAppendingString:max_temperature];
    _temperature.text=temperature;
}
@end
