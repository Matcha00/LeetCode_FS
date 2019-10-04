//
//  LCNetworkManager.h
//  Leetcode
//
//  Created by 陈欢 on 2019/10/2.
//  Copyright © 2019 Matcha00. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
NS_ASSUME_NONNULL_BEGIN
typedef void (^LCNetworkCompletionBlock)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject, NSError * _Nullable error);

@interface LCNetworkManager : NSObject
@property (nonatomic,strong) AFHTTPSessionManager* sessionManager;
+ (instancetype)shareInstance;
- (NSURLSessionDataTask*)getByUrl:(id)url success:( void(^)(id responseObject) )success
failure:(void (^)(NSError *error))failure;
- (NSURLSessionDataTask* _Nullable)postByUrl:(id _Nullable)url
paramsBlock:(void(^_Nullable)(NSMutableDictionary * _Nonnull params))paramsBlock
                                  completion:(LCNetworkCompletionBlock)completion;
@end

NS_ASSUME_NONNULL_END
