//
//  RequestApi.m
//  weather
//
//  Created by onlyou on 2019/6/17.
//  Copyright © 2019 onlyou. All rights reserved.
//

#import "RequestApi.h"

@implementation RequestApi
-(void)request:(NSString *)url params:(NSDictionary *)dict success:(void(^)(NSDictionary *resp))success fail:(void(^)(NSString * error_string))fail{
    NSLog(@"request");
    NSEnumerator *keys=[dict keyEnumerator];
    url=[url stringByAppendingString:@"?"];
    for (NSString *key in keys) {
        url=[url stringByAppendingString:key];
        url=[url stringByAppendingString:@"="];
        url=[url stringByAppendingString:[dict objectForKey:key]];
        url=[url stringByAppendingString:@"&"];
    }
    url=[url substringToIndex:[url length]-1];
    url=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURLRequest *req=[NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadRevalidatingCacheData timeoutInterval:30];
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionTask *task=[session dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error==nil){
            NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//            NSLog(dict);
            success(dict);
        }else{
            fail(@"error");
        }
    }];
    [task resume];
}
@end
