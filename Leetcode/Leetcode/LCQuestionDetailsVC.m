//
//  LCQuestionDetailsVC.m
//  Leetcode
//
//  Created by 陈欢 on 2019/10/3.
//  Copyright © 2019 Matcha00. All rights reserved.
//

#import "LCQuestionDetailsVC.h"
#import "LCQuestionDetails.h"
#import "Leetcode-Swift.h"
@interface LCQuestionDetailsVC ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailsLabel;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIButton *showCodeButton;
@end

@implementation LCQuestionDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.titleLabel.text = [NSString stringWithFormat:@"%@.  %@", self.questionid,self.questionTitle];
    self.title = self.questionTitle;
    __weak typeof(self) weakSelf = self;
    [[LCNetworkManager shareInstance]postByUrl:LCUrlEngine.getQuestionsDetails paramsBlock:^(NSMutableDictionary * _Nonnull params) {
        params[@"questionid"] = weakSelf.questionid;
    } completion:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject, NSError * _Nullable error) {
        LCQuestionDetails *questionDetails = [LCQuestionDetails mj_objectWithKeyValues:responseObject[@"data"]];
        weakSelf.detailsLabel.attributedText = [weakSelf getQuestionDetailsAttributedString:questionDetails.content_zh];
        [weakSelf.detailsLabel layoutIfNeeded];
        weakSelf.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width,weakSelf.detailsLabel.frame.size.height - weakSelf.detailsLabel.frame.origin.y);
    }];
}
- (NSAttributedString *)getQuestionDetailsAttributedString:(NSString *)text {
    NSDictionary *optoins = @{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType,NSFontAttributeName:[UIFont systemFontOfSize:15]};
    NSData *data = [text dataUsingEncoding:NSUnicodeStringEncoding];
    
    NSAttributedString *attributeString = [[NSAttributedString alloc]initWithData:data options:optoins documentAttributes:nil error:nil];
    return attributeString;
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.view bringSubviewToFront:self.showCodeButton];

}
- (void)showCode {
    Sample *vc = [[Sample alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark lzay
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor blackColor];
        [self.scrollView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.scrollView.mas_left).offset(10);
            make.top.mas_equalTo(self.scrollView.mas_top).offset(20);
            make.width.mas_equalTo(ScreenWidth-20);
            make.height.mas_equalTo(20);
        }];
    }
    return _titleLabel;
}
- (UILabel *)detailsLabel {
    if (!_detailsLabel) {
        _detailsLabel = [[UILabel alloc]init];
        _detailsLabel.numberOfLines = 0;
        [_detailsLabel sizeToFit];
        [self.scrollView addSubview:_detailsLabel];
        [_detailsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.scrollView.mas_left).offset(10);
            make.width.mas_equalTo(ScreenWidth-20);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10);
            make.height.mas_greaterThanOrEqualTo(30);
        }];
    }
    return _detailsLabel;
}
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        [self.view addSubview:_scrollView];
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.view);
        }];
    }
    return _scrollView;
}
- (UIButton *)showCodeButton {
    if (!_showCodeButton) {
        _showCodeButton = [[UIButton alloc]init];
        [_showCodeButton setTitle:@"查看解题源码" forState:UIControlStateNormal];
        [_showCodeButton setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        _showCodeButton.layer.cornerRadius = 10;
        _showCodeButton.layer.backgroundColor = [UIColor blackColor].CGColor;
        [_showCodeButton addTarget:self action:@selector(showCode) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_showCodeButton];
        [_showCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(50);
            make.width.mas_equalTo(120);
            make.bottom.mas_equalTo(self.view.mas_bottom).offset(-44);
            make.centerX.mas_equalTo(self.view.mas_centerX);
        }];
    }
    return _showCodeButton;
}
@end
