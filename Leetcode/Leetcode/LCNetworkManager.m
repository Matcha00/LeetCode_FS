//
//  LCNetworkManager.m
//  Leetcode
//
//  Created by 陈欢 on 2019/10/2.
//  Copyright © 2019 Matcha00. All rights reserved.
//

#import "LCNetworkManager.h"

@implementation LCNetworkManager
+ (instancetype)shareInstance
{
    static  LCNetworkManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LCNetworkManager alloc]init];
    });
    return instance;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _sessionManager = [AFHTTPSessionManager manager];
        
        AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
        requestSerializer.timeoutInterval = 20;
        [requestSerializer setHTTPShouldHandleCookies:YES];
        _sessionManager.requestSerializer = requestSerializer;
        _sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return self;
}
- (NSURLSessionDataTask*)getByUrl:(id)url
         success:(void (^)(id responseObject))success
         failure:(void (^)(NSError *error))failure
{
    //转url为string类型
    NSString *urlStr;
    if ([url isKindOfClass:[NSString class]]) {
        urlStr = url;
    }else if ([url isKindOfClass:[NSURL class]]) {
        urlStr = [url absoluteString];
    }

    return [self.sessionManager GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
              success(responseObject);
          }
          failure:^(NSURLSessionDataTask *task, NSError *error) {
              failure(error);
          }];
}
//+ (NSURLSessionDataTask*)postByUrl:(id)url
//                       paramsBlock:(void(^_Nullable)(NSMutableDictionary * _Nonnull params))paramsBlock
//                           success:(void (^)(id responseObject, int errNo, NSDictionary* data))success
//                           failure:(void (^)(NSError *error))failure {
//    return [[self shareInstance] postByUrl:url paramsBlock:paramsBlock success:success failure:failure];
//}
//
//- (NSURLSessionDataTask*)postByUrl:(id)url
//                       paramsBlock:(void(^_Nullable)(NSMutableDictionary * _Nonnull params))paramsBlock
//                           success:(void (^)(id responseObject, int errNo, NSDictionary* data))success
//                           failure:(void (^)(NSError *error))failure {
//    NSMutableDictionary *params = nil;
//    if (paramsBlock) {
//        params = [NSMutableDictionary dictionary];
//        paramsBlock(params);
//    }
//    return [self postByUrl:url paras:params success:success failure:failure];
//}
//
//+ (NSURLSessionDataTask* _Nullable)postByUrl:(id _Nullable)url
//                                 paramsBlock:(void(^_Nullable)(NSMutableDictionary * _Nonnull params))paramsBlock
//                                  completion:(BBTNetworkCompletionBlock _Nullable)completion {
//    return [[self shareInstance] postByUrl:url paramsBlock:paramsBlock completion:completion];
//}

- (NSURLSessionDataTask* _Nullable)postByUrl:(id _Nullable)url
                                 paramsBlock:(void(^_Nullable)(NSMutableDictionary * _Nonnull params))paramsBlock
                                  completion:(LCNetworkCompletionBlock)completion {
    NSString *urlStr;
    if ([url isKindOfClass:[NSString class]]) {
        urlStr = url;
    }else if ([url isKindOfClass:[NSURL class]]) {
        urlStr = [url absoluteString];
    }
    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable) {
//        [[BBTErrorNetWorkHelper defaultInstance]presentNetworkErrorWithTitle:nil controller:self.appearanceVC ];
    }
    
    
    NSMutableDictionary *params = nil;
    if (paramsBlock) {
        params = [NSMutableDictionary dictionary];
        paramsBlock(params);
    }
    
    return [self.sessionManager POST:urlStr parameters:params progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        completion==nil ?: completion(task, responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion==nil ?: completion(task, nil, error);
    }];
}
@end
