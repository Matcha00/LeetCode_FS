//
//  LCQuestionCell.h
//  Leetcode
//
//  Created by 陈欢 on 2019/10/2.
//  Copyright © 2019 Matcha00. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LCQuestion;
NS_ASSUME_NONNULL_BEGIN

@interface LCQuestionCell : UITableViewCell
@property (nonatomic, strong) LCQuestion *question;
@property (nonatomic, strong) UILabel *questionidLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *level;
+ (CGFloat)defaultQuestionCellHeight;
@end

NS_ASSUME_NONNULL_END
