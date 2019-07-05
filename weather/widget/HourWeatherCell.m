//
//  MyTableViewCell.m
//  weather
//
//  Created by onlyou on 2019/6/11.
//  Copyright © 2019 onlyou. All rights reserved.
//

#import "HourWeatherCell.h"
@interface HourWeatherCell()
@property(nonatomic,strong)UILabel *time;
@property(nonatomic,strong)UIImageView *weather;
@property(nonatomic,strong)UILabel *temperature;


@end

@implementation HourWeatherCell


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //添加自己需要个子视图控件
        _time=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 25*F, 10*F)];
        _time.textAlignment=NSTextAlignmentCenter;
        _time.font=[UIFont fontWithName:nil size:3*F];
        [self.contentView addSubview:_time];
        _weather=[[UIImageView alloc]initWithFrame:CGRectMake(8*F, 10*F, 8*F, 8*F)];
        [self.contentView addSubview:_weather];
        _temperature=[[UILabel alloc]initWithFrame:CGRectMake(0, 18*F, 25*F, 10*F)];
        _temperature.font=[UIFont fontWithName:nil size:4*F];
        _temperature.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:_temperature];
    }
    return self;
}
-(void)initData:(NSString *) time weather:(NSString *)weather temperature:(NSString *)temperature{
    _temperature.text=temperature;
    _time.text=time;
    weather=[self getweather:weather];
   [_weather setImage:[UIImage imageNamed:weather]];
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
