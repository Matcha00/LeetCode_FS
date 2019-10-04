//
//  LCUrlEngine.m
//  Leetcode
//
//  Created by 陈欢 on 2019/10/2.
//  Copyright © 2019 Matcha00. All rights reserved.
//

#import "LCUrlEngine.h"

@implementation LCUrlEngine
+ (NSString *)getQuestions {
    return [NSString stringWithFormat:@"http://localhost:8090/v1/api/getquestions"];
}
+ (NSString *)getQuestionsDetails {
    return [NSString stringWithFormat:@"http://localhost:8090/v1/api/getQuestionDetails"];
}
@end
