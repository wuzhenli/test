//
//  StaticTableViewController.m
//  test
//
//  Created by li’Pro on 2018/11/22.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "StaticTableViewController.h"
#import "StaticTableVCModel.h"


@interface StaticTableViewController ()

@property (strong, nonatomic) StaticTableVCModel *model;

@end

@implementation StaticTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableViewStyle = UITableViewStyleGrouped;
    
    [self.model registerCellUseTableView:self.tableView];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(64);
        make.left.right.bottom.equalTo(self.view);
    }];
    [BBSProgressHUD showLoadingToView:self.view];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSDictionary *dic = @{
                              @"topic" : @YES,
                              @"reply" : @NO,
                              @"opinion" : @YES
                              };
        [self.model setDataWithDictionary:dic];
        [BBSProgressHUD hideHUDForView:self.view];
        [self.tableView reloadData];
    });
}


#pragma -mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.model.arrSectionModel.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    StaticSecionModel *secModel = self.model.arrSectionModel[section];
    return secModel.arrRowModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StaticSecionModel *secModel = self.model.arrSectionModel[indexPath.section];
    return secModel.arrRowModel[indexPath.row].cell;
}

#pragma -mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    StaticSecionModel *secModel = self.model.arrSectionModel[indexPath.section];
    return secModel.arrRowModel[indexPath.row].rowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    StaticSecionModel *secModel = self.model.arrSectionModel[section];
    return secModel.headerHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    StaticSecionModel *secModel = self.model.arrSectionModel[section];
    return secModel.footerHeight;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    StaticSecionModel *secModel = self.model.arrSectionModel[section];
    return secModel.headerView;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    StaticSecionModel *secModel = self.model.arrSectionModel[section];
    return secModel.footerView;
}

#pragma -mark getter

- (StaticTableVCModel *)model {
    if (!_model) {
        _model = [StaticTableVCModel new];
    }
    return _model;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:self.tableViewStyle];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        //_tableView.separatorColor = COLOR_LINE_DE;
        
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.rowHeight = 49;
    }
    return _tableView;
}


@end
