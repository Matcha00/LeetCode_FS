//
//  ViewController.m
//  Leetcode
//
//  Created by 陈欢 on 2019/10/2.
//  Copyright © 2019 Matcha00. All rights reserved.
//

#import "ViewController.h"
#import "LCQuestion.h"
#import "LCQuestionCell.h"
#import "LCQuestionDetailsVC.h"
@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray <LCQuestion *> *questions;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    __weak typeof(self) WeakSelf =self
    self.title = @"LeetCode";
    [[LCNetworkManager shareInstance]getByUrl:[LCUrlEngine getQuestions] success:^(id  _Nonnull responseObject) {
        NSArray<LCQuestion*> *questions = [LCQuestion mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
        self.questions = questions;
        [self.tableView reloadData];
    } failure:^(NSError * _Nonnull error) {

    }];
}

#pragma mark Delegate DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.questions.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [LCQuestionCell defaultQuestionCellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LCQuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(LCQuestionCell.class) forIndexPath:indexPath];
    cell.question = self.questions[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LCQuestion *question = self.questions[indexPath.row];
    
    LCQuestionDetailsVC *questionDetailsVC = [[LCQuestionDetailsVC alloc]init];
    questionDetailsVC.questionid = question.questionid;
    questionDetailsVC.questionTitle = question.title_zh;
    [self.navigationController pushViewController:questionDetailsVC animated:YES];
}


#pragma mark Lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[LCQuestionCell class] forCellReuseIdentifier:NSStringFromClass(LCQuestionCell.class)];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.view);
        }];
    }
    return _tableView;
}
@end
