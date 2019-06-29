//
//  MyHu.h
//  weather
//
//  Created by onlyou on 2019/6/19.
//  Copyright © 2019 onlyou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OtherWeatherDetails : UIView
-(void)initData:(NSString *)pm NO2:(NSString *)no2 SO2:(NSString *)so2 aqi_value:(int) aqi_value;
-(void)initData:(NSString *)temp zwx:(NSString *)zwx humidity_value:(NSString *)humidity_value;
-(void)initData:(NSString *)direct power:(NSString *)power;
-(void)drawProgress:(float) prcent;
@end

NS_ASSUME_NONNULL_END
