//
//  MyTableViewCell.h
//  weather
//
//  Created by onlyou on 2019/6/11.
//  Copyright © 2019 onlyou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HourWeatherCell : UICollectionViewCell

//+(instancetype)getcell:(UITableView *)tableview;
-(void)initData:(NSString *) time weather:(NSString *)weather temperature:(NSString *)temperature;
@end

NS_ASSUME_NONNULL_END
