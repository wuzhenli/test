//
//  TVViewController.m
//  test
//
//  Created by li’s Air on 2018/6/24.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "TVViewController.h"

@interface TVViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray<NSString *> *arrTitle;
@end

@implementation TVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"测试tableView";
    self.tableView.tableFooterView = [UIView new];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 400, 0);
    });
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrTitle.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TVViewController"];
    cell.textLabel.text = self.arrTitle[indexPath.row];
    
    return cell;
}



- (NSMutableArray<NSString *> *)arrTitle {
    if (!_arrTitle) {
        NSUInteger count = 10;
        _arrTitle = [NSMutableArray arrayWithCapacity:count];
        for (NSUInteger i = 0; i<count; i++) {
            [_arrTitle addObject:[NSString stringWithFormat:@"0-%ld", i]];
        }
    }
    return _arrTitle;
}


@end
















