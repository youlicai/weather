//
//  DayWeather.h
//  weather
//
//  Created by onlyou on 2019/6/13.
//  Copyright © 2019 onlyou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DayWeather : UIView
-(void)setData:(NSString *)time weather_id:(NSString *)weather_id min_temperature:(NSString *) min_temperature max_temperature:(NSString *) max_temperature;
@end

NS_ASSUME_NONNULL_END
