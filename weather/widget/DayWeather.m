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
        _date=[[UILabel alloc]initWithFrame:CGRectMake(5*F, 0, 30*F, 10*F)];
        _weather=[[UIImageView alloc]initWithFrame:CGRectMake(45*F, 2*F, 7*F, 7*F)];
        _temperature=[[UILabel alloc]initWithFrame:CGRectMake(65*F, 0, 30*F, 10*F)];
        _temperature.textAlignment=NSTextAlignmentRight;
        _temperature.font=[UIFont fontWithName:nil size:4*F];
        [self addSubview:_date];
        [self addSubview:_weather];
        [self addSubview:_temperature];
//        self.backgroundColor=[UIColor redColor];
    }
    return self;
}
-(void)setData:(NSString *)time weather:(NSString *)weather min_temperature:(NSString *) min_temperature max_temperature:(NSString *) max_temperature;{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:time];
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:nil size:4.5*F] range:NSMakeRange(0,5)];
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:nil size:3*F] range:NSMakeRange(6,3)];
    _date.attributedText = str;
    _date.text=time;
    weather=[self getweather:weather];
    [_weather setImage:[UIImage imageNamed:weather]];
    NSString *temperature=[min_temperature stringByAppendingString:@"/"];
    temperature=[temperature stringByAppendingString:max_temperature];
    _temperature.text=temperature;
}

-(NSString *)getweather:(NSString *)weather{
    NSString *r_weather;
    if([weather containsString:@"转"]){
        NSArray *array = [weather componentsSeparatedByString:@"转"];
        r_weather=array[1];
    }else
        r_weather=weather;
    
    return r_weather;
}
@end
