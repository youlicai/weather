//
//  MyHu.m
//  weather
//
//  Created by onlyou on 2019/6/19.
//  Copyright © 2019 onlyou. All rights reserved.
//

#import "OtherWeatherDetails.h"

@interface OtherWeatherDetails()
@property (nonatomic, strong)  UIView *left;
@property (nonatomic, strong)  UIView *right;
@property (nonatomic, strong)  UILabel *desc;
@property (nonatomic, strong)  UILabel *start_text;
@property (nonatomic, strong)  UILabel *end_text;
@property (nonatomic, strong)  UILabel *mid_text;
//@property (nonatomic, strong)  UILabel *pm2;
//@property (nonatomic, strong)  UILabel *pm2_value;
@end

@implementation OtherWeatherDetails

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        _left=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 40*F, frame.size.height)];
        [self addSubview:_left];
        _right=[[UIView alloc]initWithFrame:CGRectMake(50*F, 0, 50*F, frame.size.height)];
        [self addSubview:_right];
        
        
            }
    return self;
}

//-(void)drawProgress(){
//
//}
-(void)initData:(NSString *)pm NO2:(NSString *)no2 SO2:(NSString *)so2 aqi_value:(int)aqi_value{
    
    _desc=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 160, 20)];
    _desc.textAlignment=NSTextAlignmentCenter;
    _desc.font=[UIFont fontWithName:nil size:18];
    [_left addSubview:_desc];
    
    _mid_text=[[UILabel alloc]initWithFrame:CGRectMake(60, 90, 40, 40)];
    _mid_text.textAlignment=NSTextAlignmentCenter;
    _mid_text.font=[UIFont fontWithName:nil size:30];
    
    [_left addSubview:_mid_text];
    
    _start_text=[[UILabel alloc]initWithFrame:CGRectMake(20, 190, 30, 20)];
    _start_text.textAlignment=NSTextAlignmentCenter;
    _start_text.font=[UIFont fontWithName:nil size:16];
    _start_text.text=@"0";
    [_left addSubview:_start_text];
    
    _end_text=[[UILabel alloc]initWithFrame:CGRectMake(110, 190, 30, 20)];
    _end_text.textAlignment=NSTextAlignmentCenter;
    _end_text.font=[UIFont fontWithName:nil size:16];
    
    _end_text.text=@"500";
    [_left addSubview:_end_text];

    
    _desc.text=@"污染指数";
    _mid_text.text=[NSString stringWithFormat:@"%d",aqi_value];
    UILabel *pm2=[[UILabel alloc]initWithFrame:CGRectMake(0,15*F, 20*F, 10*F)];
    pm2.text=@"PM2.5";
    UILabel *pm2_value=[[UILabel alloc]initWithFrame:CGRectMake(20*F,15*F, 20*F, 10*F)];
    pm2_value.text=@"24";
    [_right addSubview:pm2];
    [_right addSubview:pm2_value];
    
    UILabel *n2=[[UILabel alloc]initWithFrame:CGRectMake(0,25*F, 20*F, 10*F)];
    n2.text=@"NO2";
    UILabel *n2_value=[[UILabel alloc]initWithFrame:CGRectMake(20*F,25*F, 20*F, 10*F)];
    n2_value.text=@"24";
    [_right addSubview:n2];
    [_right addSubview:n2_value];
    
    UILabel *s2=[[UILabel alloc]initWithFrame:CGRectMake(0,35*F, 20*F, 10*F)];
    s2.text=@"SO2";
    UILabel *s2_value=[[UILabel alloc]initWithFrame:CGRectMake(20*F,35*F, 20*F, 10*F)];
    s2_value.text=@"24";
    [_right addSubview:s2];
    [_right addSubview:s2_value];
    float aqi=0;
    if(aqi_value<=50){
        aqi=0.1;
    }else
    if(50<aqi_value&&aqi_value<=100){
        aqi=0.2;
    }else
    if(100<aqi_value&&aqi_value<=150){
        aqi=0.3;
    }else
    if(150<aqi_value&&aqi_value<=200){
        aqi=0.4;
    }else
    if(200<aqi_value&&aqi_value<=250){
        aqi=0.5;
    }else
    if(250<aqi_value&&aqi_value<=300){
        aqi=0.9;
    }
    
    [self drawProgress:aqi];
}
-(void)initData:(NSString *)temp zwx:(NSString *)zwx humidity_value:(NSString *)humidity_value{
    
    [self drawProgress:[humidity_value floatValue]/100];
    _desc=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 160, 20)];
    _desc.textAlignment=NSTextAlignmentCenter;
    _desc.font=[UIFont fontWithName:nil size:18];
    [_left addSubview:_desc];
    
    
    _mid_text=[[UILabel alloc]initWithFrame:CGRectMake(60, 90, 40, 40)];
    _mid_text.textAlignment=NSTextAlignmentCenter;
    _mid_text.font=[UIFont fontWithName:nil size:30];
     _mid_text.text=humidity_value;
    
    [_left addSubview:_mid_text];
    
    _start_text=[[UILabel alloc]initWithFrame:CGRectMake(20, 190, 30, 20)];
    _start_text.textAlignment=NSTextAlignmentCenter;
    _start_text.font=[UIFont fontWithName:nil size:16];
    _start_text.text=@"0";
    [_left addSubview:_start_text];
    
    _end_text=[[UILabel alloc]initWithFrame:CGRectMake(110, 190, 30, 20)];
    _end_text.textAlignment=NSTextAlignmentCenter;
    _end_text.font=[UIFont fontWithName:nil size:16];
    
    _end_text.text=@"100";
    [_left addSubview:_end_text];

    _desc.text=@"空气湿度";
    UILabel *tempt=[[UILabel alloc]initWithFrame:CGRectMake(0,18*F, 25*F, 10*F)];
    tempt.text=@"体感温度";
    UILabel *s2_value=[[UILabel alloc]initWithFrame:CGRectMake(25*F,18*F, 25*F, 10*F)];
    s2_value.text=temp;
    [_right addSubview:tempt];
    [_right addSubview:s2_value];
    
    UILabel *zwx1=[[UILabel alloc]initWithFrame:CGRectMake(0,28*F, 25*F, 10*F)];
    zwx1.text=@"紫外线指数";
    UILabel *_value=[[UILabel alloc]initWithFrame:CGRectMake(25*F,28*F, 25*F, 10*F)];
    _value.text=zwx;
    [_right addSubview:zwx1];
    [_right addSubview:_value];
}
-(void)initData:(NSString *)direct power:(NSString *)power{
    
}
-(void)drawProgress:(float) prcent{
    
    CGPoint point=CGPointMake(CGRectGetMidX(_left.bounds),CGRectGetMidY(_left.bounds));
    CAShapeLayer *layer = [CAShapeLayer new];
    layer.frame=CGRectMake(0, 10, 160, 160);
    layer.lineWidth = 10;
    //圆环的颜色
    layer.strokeColor = [UIColor colorWithHexString:@"#333333"].CGColor;
    //背景填充色
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineCap = kCALineCapRound;
    //设置半径为10
    CGFloat radius = 18*F;
    //按照顺时针方向
    BOOL clockWise = true;
    //初始化一个路径
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:point radius:radius startAngle:(0.75*M_PI) endAngle:2.25f*M_PI clockwise:clockWise];
    
    layer.path = [path CGPath];
    [_left.layer addSublayer:layer];
    
    
    CAShapeLayer *layer1 = [CAShapeLayer new];
    layer1.frame=CGRectMake(0, 10, 160, 160);
    layer1.lineWidth = 10;
    //圆环的颜色
    layer1.strokeColor =[UIColor colorWithHexString:@"#eeeeee"].CGColor;
    //背景填充色
    layer1.fillColor = [UIColor clearColor].CGColor;
    layer1.lineCap = kCALineCapRound;
    //设置半径为10
    
    //初始化一个路径
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:point radius:radius startAngle:(0.75*M_PI) endAngle:(0.75f+prcent*1.5f)*M_PI clockwise:clockWise];
    
    layer1.path = [path1 CGPath];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0.0);
    animation.toValue = @(1.0);
    layer.autoreverses = NO;
    animation.duration = 1.0;
    
    // 设置layer的animation
    [layer1 addAnimation:animation forKey:nil];
    [_left.layer addSublayer:layer1];


}
@end
