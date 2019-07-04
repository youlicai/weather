//
//  RefreshHeaderView.h
//  weather
//
//  Created by onlyou on 2019/6/29.
//  Copyright © 2019 onlyou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, HLRefreshHeaderState){
    HLRefreshHeaderStateIdle,         //闲置状态
    HLRefreshHeaderStatePulling,      //松开就可以进行刷新的状态
    HLRefreshHeaderStateRefreshing    //正在刷新中的状态
};
@interface RefreshHeaderView : UIView
-(void)setStates:(HLRefreshHeaderState *) state;
@end

NS_ASSUME_NONNULL_END
