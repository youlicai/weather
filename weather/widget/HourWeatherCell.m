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

//+(instancetype)getcell:(UITableView *)tableview{
//    static NSString *identifier = @"status";
//    HourWeatherCell *cell=[tableview dequeueReusableCellWithIdentifier:identifier];
//    if(cell==nil){
//        cell=[[HourWeatherCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//    }
//
//    return cell;
//}
//
//-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
//    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if(self){
//        _time=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 18*F, 10*F)];
//        _time.textAlignment=NSTextAlignmentCenter;
//        _time.text=@"23:00";
//        _time.font=[UIFont fontWithName:nil size:14];
//        [self addSubview:_time];
//        _weather=[[UIImageView alloc]initWithFrame:CGRectMake(5*F, 10*F, 8*F, 8*F)];
//        [_weather setImage:[UIImage imageNamed:@"weather"]];
//        [self addSubview:_weather];
//        _temperature=[[UILabel alloc]initWithFrame:CGRectMake(0, 18*F, 18*F, 10*F)];
//        _temperature.text=@"11℃";
//        _temperature.textAlignment=NSTextAlignmentCenter;
//        [self addSubview:_temperature];
//        self.contentView.frame=CGRectMake(0, 0, 20*F, 40*F);
//
//    }
//    return self;
//}


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //添加自己需要个子视图控件
        _time=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 18*F, 10*F)];
        _time.textAlignment=NSTextAlignmentCenter;
        _time.text=@"23:00";
        _time.font=[UIFont fontWithName:nil size:14];
        [self.contentView addSubview:_time];
        _weather=[[UIImageView alloc]initWithFrame:CGRectMake(5*F, 10*F, 8*F, 8*F)];
        [_weather setImage:[UIImage imageNamed:@"weather"]];
        [self.contentView addSubview:_weather];
        _temperature=[[UILabel alloc]initWithFrame:CGRectMake(0, 18*F, 18*F, 10*F)];
        _temperature.text=@"11℃";
        _temperature.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:_temperature];
        //                self.contentView.frame=CGRectMake(0, 0, 20*F, 40*F);
        //
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
