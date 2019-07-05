//
//  RequestApi.h
//  weather
//
//  Created by onlyou on 2019/6/17.
//  Copyright © 2019 onlyou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RequestApi : NSObject
-(void)request:(NSString *)url params:(NSDictionary *)dict success:(void(^)(NSDictionary *resp))success fail:(void(^)(NSString * error_string))fail;
@end

NS_ASSUME_NONNULL_END
