//
//  RefreshHeaderView.m
//  weather
//
//  Created by onlyou on 2019/6/29.
//  Copyright © 2019 onlyou. All rights reserved.
//

#import "RefreshHeaderView.h"


@interface RefreshHeaderView()
@property(nonatomic,strong)UILabel *tips;

@end
@implementation RefreshHeaderView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _tips=[[UILabel alloc]initWithFrame:frame];
    }
    return self;
}
-(void)setStates:(HLRefreshHeaderState *) state{
    if (state==HLRefreshHeaderStateIdle) {
        _tips.text=@"继续下拉就更新";
    }else if (state==HLRefreshHeaderStatePulling){
         _tips.text=@"松开就更新";
    }else if(state==HLRefreshHeaderStateRefreshing){
        _tips.text=@"更新中";
    }
}
@end
