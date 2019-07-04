//
//  Synopsis.m
//  weather
//
//  Created by onlyou on 2019/6/10.
//  Copyright © 2019 onlyou. All rights reserved.
//

#import "CurrentWeather.h"
@interface CurrentWeather()
@property (nonatomic, strong)  UILabel *temperature;//温度数字
@property (nonatomic, strong)  UILabel *unit;//单位 d摄氏度
@property (nonatomic, strong)  UILabel *other;//天气情况
@end

@implementation CurrentWeather

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        _temperature=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.width*0.7)];
        _temperature.font=[UIFont fontWithName:nil size:90];
        _temperature.textAlignment=NSTextAlignmentCenter;
        _unit=[[UILabel alloc]initWithFrame:CGRectMake(frame.size.width*0.7, 0, frame.size.width*0.4, frame.size.width*0.4)];
        _unit.font=[UIFont fontWithName:nil size:30];
        _other=[[UILabel alloc]initWithFrame:CGRectMake(0, _temperature.bounds.size.height*3/4, frame.size.width,frame.size.height-_temperature.bounds.size.height)];
        _other.textAlignment=NSTextAlignmentCenter;
        _other.textColor=[UIColor colorWithHexString:@"#444444"];
        _other.font=[UIFont fontWithName:nil size:18];
        [self addSubview:_temperature];
        [self addSubview:_unit];
        [self addSubview:_other];
    }

    return self;
}

-(void)initData:(NSString *)temperature_nums info:(NSString *)info aqi:(NSString *) aqi{
    _temperature.text=temperature_nums;
    self.unit.text=@"℃";
    if([aqi containsString:@"优"]){
        aqi=@"空气优";
    }else if([aqi containsString:@"良"]){
        aqi=@"空气良";
    }
//    NSString *aqi_string;
//    if(aqi<=50){
//        aqi_string=@" 空气优";
//    }else if(50<aqi&&aqi<=100){
//        aqi_string=@" 空气良";
//    }else if(100<aqi&&aqi<=150){
//        aqi_string=@" 轻度污染";
//    }else if(150<aqi&&aqi<=200){
//        aqi_string=@" 中度污染";
//    }else if(200<aqi&&aqi<=250){
//        aqi_string=@" 重度污染";
//    }else if(250<aqi&&aqi<=300){
//        aqi_string=@" 严重污染";
//    }else
//        aqi_string=@" 严重污染";
    
    self.other.text=[info stringByAppendingString:[@" " stringByAppendingString:aqi]];
}
@end
