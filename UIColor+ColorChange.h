//
//  UIColor+ColorChange.h
//  weather
//
//  Created by onlyou on 2019/6/28.
//  Copyright © 2019 onlyou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ColorChange)
// 颜色转换：iOS中（以#开头）十六进制的颜色转换为UIColor(RGB)
+ (UIColor *) colorWithHexString: (NSString *)color;
@end

NS_ASSUME_NONNULL_END
