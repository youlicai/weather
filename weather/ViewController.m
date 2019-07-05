//
//  ViewController.m
//  weather
//
//  Created by onlyou on 2019/6/10.
//  Copyright © 2019 onlyou. All rights reserved.
//

#import "ViewController.h"
#import "widget/CurrentWeather.h"
#import "widget/HourWeatherCell.h"
#import "widget/DayWeather.h"
#import "network/RequestApi.h"
#import "widget/OtherWeatherDetails.h"
#import "UIScrollView+RefreshView.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>
@property (nonatomic, strong) CurrentWeather *current_weather;
@property (nonatomic, strong)  UILabel *area;
@property (nonatomic, strong)  UIImageView *location;
@property (nonatomic, strong)  UILabel *last_update;
@property (nonatomic, strong)  UILabel *future_24_hour;
@property (nonatomic, strong)  UILabel *future_7_day;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UITableView *tableView2;
@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIScrollView *scrollview;
@property (nonatomic, strong) OtherWeatherDetails *pollution;
@property (nonatomic, strong) OtherWeatherDetails *humidity;
@property (nonatomic, strong) NSDictionary *hour_data;

@end

@implementation ViewController
NSMutableArray *future_hour_data;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithHexString:@"#fafafa"];
    _scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _scrollview.alwaysBounceVertical=YES;
     self.scrollview.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:_scrollview];
    _current_weather=[[CurrentWeather alloc]initWithFrame:CGRectMake(100*F/2-25*F,20*F, 50*F, 45*F)];
    
    [self.scrollview addSubview:_current_weather];
    _area=[[UILabel alloc]init];
    _area.textAlignment=NSTextAlignmentCenter;
    _area.font=[UIFont fontWithName:nil size:5*F];
    _area.text=@"浦东新区";
    CGSize labelSize=[_area.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-20, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: _area.font} context:nil].size;
    _area.frame=CGRectMake(self.view.frame.size.width/2-labelSize.width/2, CGRectGetMaxY(_current_weather.frame)+5*F, labelSize.width, 5*F);
    [self.scrollview addSubview:_area];
    _location=[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_area.frame)+1*F,CGRectGetMaxY(_current_weather.frame)+5*F, 5*F, 5*F) ];
    [_location setImage:[UIImage imageNamed:@"location"]];
    [self.scrollview addSubview:_location];
    _last_update=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-80, CGRectGetMaxY(_area.frame), 160, 30)];
    _last_update.textAlignment=NSTextAlignmentCenter;
    _last_update.font=[UIFont fontWithName:nil size:3*F];
    _last_update.textColor= [UIColor colorWithHexString:@"#666666"];
    [self.scrollview addSubview:_last_update];
    
    _future_24_hour=[[UILabel alloc]initWithFrame:CGRectMake(3*F, CGRectGetMaxY(_last_update.frame), 30*F, 3*F)];
    _future_24_hour.font=[UIFont fontWithName:nil size:3*F];
    _future_24_hour.text=@"未来24小时天气";
    _future_24_hour.textColor= [UIColor colorWithHexString:@"#444444"];
    [self.scrollview addSubview:_future_24_hour];
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_future_24_hour.frame), self.view.frame.size.width, 30*F)collectionViewLayout:layout];
    //水平滑动
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView.alwaysBounceHorizontal = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.backgroundColor = [UIColor clearColor];
    
    [_collectionView registerClass:[HourWeatherCell class] forCellWithReuseIdentifier:@"cellId"];
    [self.scrollview addSubview:_collectionView];
    
    _future_7_day=[[UILabel alloc]initWithFrame:CGRectMake(3*F, CGRectGetMaxY(_collectionView.frame)+5*F, 30*F, 3*F)];
    _future_7_day.font=[UIFont fontWithName:nil size:3*F];
    _future_7_day.text=@"未来7天天气";
    _future_7_day.textColor= [UIColor colorWithHexString:@"#444444"];
    [self.scrollview addSubview:_future_7_day];
    _view1=[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_future_7_day.frame), self.view.bounds.size.width, 350)];
    
    [self.scrollview addSubview:_view1];
    UIView *line1=[[UIView alloc]initWithFrame:CGRectMake(5*F, CGRectGetMaxY(_view1.frame)+4*F, 90*F, 0.5)];
    line1.backgroundColor=[UIColor grayColor];
    [self.scrollview addSubview:line1];
    
    _pollution=[[OtherWeatherDetails alloc]initWithFrame:CGRectMake(5*F, CGRectGetMaxY(line1.frame)+5*F,95*F, 50*F)];
    
    [self.scrollview addSubview:_pollution];
    UIView *line2=[[UIView alloc]initWithFrame:CGRectMake(5*F, CGRectGetMaxY(_pollution.frame)+3*F, 90*F, 0.5)];
    line2.backgroundColor=[UIColor grayColor];
    [self.scrollview addSubview:line2];
    _humidity=[[OtherWeatherDetails alloc]initWithFrame:CGRectMake(5*F, CGRectGetMaxY(line2.frame)+5*F,95*F, 50*F)];

    [self.scrollview addSubview:_humidity];
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [_scrollview setContentSize:CGSizeMake(self.view.frame.size.width, CGRectGetMaxY(_humidity.frame))];
    [_scrollview setScrollEnabled:YES];
//    [self addObserver:_scrollview forKeyPath:<#(nonnull NSString *)#> options:<#(NSKeyValueObservingOptions)#> context:<#(nullable void *)#>]
//    _scrollview.bounces = NO ;
    
    RequestApi *req=[[RequestApi alloc]init];
    NSString *url=@"https://www.tianqiapi.com/api/";
    NSDictionary *params=@{@"version":@"v1",
                           @"city":@"上海"};
    [req request:url params:params success:^(NSDictionary * _Nonnull resp) {
        dispatch_async(dispatch_get_main_queue(), ^(){
            [self.current_weather initData:[resp[@"data"][0][@"tem"] stringByReplacingOccurrencesOfString:@"℃" withString:@""] info:resp[@"data"][0][@"wea"] aqi:resp[@"data"][0][@"air_level"]];
            self.last_update.text=[@"更新时间:" stringByAppendingString:[resp[@"update_time"] substringFromIndex:11]];
            future_hour_data = [NSMutableArray array];
            
            for (int i=0; i<[resp[@"data"][0][@"hours"] count]; i++) {
                NSMutableDictionary *data=[NSMutableDictionary dictionary];
                data[@"time"]=resp[@"data"][0][@"hours"][i][@"day"];
                data[@"weather"]=resp[@"data"][0][@"hours"][i][@"wea"];
                data[@"temperature"]=resp[@"data"][0][@"hours"][i][@"tem"];;
                [future_hour_data addObject:data];
            }
            
            for (int i=0; i<[resp[@"data"][1][@"hours"] count]; i++) {
                NSMutableDictionary *data=[NSMutableDictionary dictionary];
                data[@"time"]=resp[@"data"][1][@"hours"][i][@"day"];
                data[@"weather"]=resp[@"data"][1][@"hours"][i][@"wea"];
                data[@"temperature"]=resp[@"data"][1][@"hours"][i][@"tem"];;
                [future_hour_data addObject:data];
            }
            
            _collectionView.delegate=self;
            _collectionView.dataSource=self;
            
            
            for(int i=0;i<[resp[@"data"] count];i++){
                DayWeather *label=[[DayWeather alloc]initWithFrame:CGRectMake(0, 0+50*i, 100, 50)];
                [label setData:[[[resp[@"data"][i][@"date"] substringFromIndex:5] stringByAppendingString:@" "] stringByAppendingString:resp[@"data"][i][@"week"]] weather:resp[@"data"][i][@"wea"] min_temperature:resp[@"data"][i][@"tem2"] max_temperature:resp[@"data"][i][@"tem1"] ];
                [self.view1 addSubview:label];
            }
            NSString *temp=resp[@"data"][0][@"air"];
            [_pollution initData:@"23" NO2:@"4" SO2:@"45" aqi_value:[temp intValue]];
            [_humidity initData:resp[@"data"][0][@"tem"] zwx:resp[@"data"][0][@"index"][0][@"level"] humidity_value:@"50"];
        });
        
    } fail:^(NSString * _Nonnull error_string) {
        NSLog(@"ddd");
    }];
    
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return [future_hour_data count];
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 1;
    
}

// 返回每个item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 25*F;
    CGFloat width = 25*F;
    return CGSizeMake(width, height);
 
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HourWeatherCell *cell = (HourWeatherCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    [cell initData:future_hour_data[indexPath.section][@"time"] weather:@"中雨转大雨" temperature:future_hour_data[indexPath.section][@"temperature"]];
    return cell;
    
}


#pragma mark - UITableViewDataSource
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    // 在这个方法中设置总共有多少组数据
//    // 这个方法如果不实现，默认是一组
////    if(tableView ==_tableView){
////        return 1;
////    }
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    // 在这个方法中设置第section组有多行数据
//    NSLog(@"numberOfRowsInSection");
//    return 16;
//}
//


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    // 4.设置cell的一些属性
//    if(tableView==_tableView){
//        HourWeatherCell *cell=[HourWeatherCell getcell:tableView];
//        cell.transform = CGAffineTransformMakeRotation(M_PI / 2);
//        return cell;
//    }else{
//        UITableViewCell *cell=[[UITableViewCell alloc]init];
//        cell.textLabel.text=@"hello";
//        return cell;
//    }
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"heightForRowAtIndexPath");
//    if(tableView==_tableView){
//        return 18*F;
//    }else{
//        return 18*F;
//    }
//}
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
//    // 在这个方法中设置第section组的尾部标题
//    return nil;
//}
//
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    // 在这个方法中设置第section组的头部标题
//    return nil;
//}


@end
