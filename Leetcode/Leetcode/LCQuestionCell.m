//
//  LCQuestionCell.m
//  Leetcode
//
//  Created by 陈欢 on 2019/10/2.
//  Copyright © 2019 Matcha00. All rights reserved.
//

#import "LCQuestionCell.h"
#import "LCQuestion.h"
@implementation LCQuestionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOpacity = 0.8;
        self.layer.shadowOffset = CGSizeMake(0, 0);
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


#pragma mark Public

- (void)setQuestion:(LCQuestion *)question {
    _question = question;
    
    self.questionidLabel.text = question.questionid;
    self.titleLabel.text = question.title_zh;
    self.level.text = question.level;
}
+ (CGFloat)defaultQuestionCellHeight {
    return 70;
}

- (void)setFrame:(CGRect)frame
{
    
    
    frame.origin.x += 20;
    
    frame.origin.y += 20;
    
    frame.size.width -= 40;
    frame.size.height -= 20;
    
    [super setFrame:frame];
}

#pragma mark Lazy

- (UILabel *)questionidLabel {
    if (!_questionidLabel) {
        _questionidLabel = [[UILabel alloc]init];
        _questionidLabel.font = [UIFont systemFontOfSize:16];
        _questionidLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_questionidLabel];
        [_questionidLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).offset(10);
            make.top.mas_equalTo(self.contentView.mas_top).mas_equalTo(5);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(80);
        }];
    }
    return _questionidLabel;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:20];
        _titleLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.questionidLabel.mas_right).offset(5);
            make.right.mas_equalTo(self.contentView.mas_right);
            make.top.mas_equalTo(self.questionidLabel.mas_top);
        }];
    }
    return _titleLabel;
}
- (UILabel *)level {
    if (!_level) {
        _level = [[UILabel alloc]init];
        _level.textColor = [UIColor redColor];
        _level.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_level];
        [_level mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.titleLabel.mas_left);
            make.right.mas_equalTo(self.contentView.mas_right);
            make.height.mas_equalTo(15);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(5);
        }];
    }
    return _level;
}
@end
