//
//  LCQuestionsData.h
//  Leetcode
//
//  Created by 陈欢 on 2019/10/2.
//  Copyright © 2019 Matcha00. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCQuestion.h"
NS_ASSUME_NONNULL_BEGIN

@interface LCQuestionsData : NSObject
@property (nonatomic, strong) NSArray<LCQuestion *> *questionsData;
@end

NS_ASSUME_NONNULL_END
