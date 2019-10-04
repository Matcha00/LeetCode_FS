//
//  LCQuestion.h
//  Leetcode
//
//  Created by 陈欢 on 2019/10/2.
//  Copyright © 2019 Matcha00. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LCQuestion : NSObject
@property (nonatomic, copy) NSString *questionid;
@property (nonatomic, copy) NSString *title_zh;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *title_slug;
@property (nonatomic, copy) NSString *level;
@end

NS_ASSUME_NONNULL_END
