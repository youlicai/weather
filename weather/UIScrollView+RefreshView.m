//
//  UIScrollView+RefreshView.m
//  weather
//
//  Created by onlyou on 2019/6/29.
//  Copyright © 2019 onlyou. All rights reserved.
//

#import "UIScrollView+RefreshView.h"
#import "RefreshHeaderView.h"
@interface UIScrollView (RefreshView)<UIScrollViewDelegate>
    @property(nonatomic,strong)RefreshHeaderView *refreshHeader;
@end

@implementation UIScrollView (RefreshView)
-(void)addRefreshHeader{
    if(self.refreshHeader){
        self.refreshHeader=[[RefreshHeaderView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 60)];
    }
};
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat hight = scrollView.frame.size.height;
    CGFloat contentOffset = scrollView.contentOffset.y;
    CGFloat distanceFromBottom = scrollView.contentSize.height - contentOffset;
    CGFloat offset = contentOffset - 1000;
    //    self.lastcontentOffset = contentOffset;
    NSLog(@"%f",contentOffset);

    

}

@end
