//
//  Synopsis.h
//  weather
//
//  Created by onlyou on 2019/6/10.
//  Copyright © 2019 onlyou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CurrentWeather : UIView

-(void)initData:(NSString *)temperature_nums info:(NSString *)info aqi:(NSString *)aqi;
@end

NS_ASSUME_NONNULL_END
