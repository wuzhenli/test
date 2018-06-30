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
@property (strong, nonatomic) NSMutableArray<NSNumber *> *arrHeight;
@property (strong, nonatomic) UIView *headerView;
@end

@implementation TVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"测试tableView";
    self.tableView.tableFooterView = [UIView new];
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedRowHeight = 0;
//    self.tableView.separatorInset = UIEdgeInsetsMake(10, 30, 20, 30);
//    self.tableView.rowHeight = 55;
//    self.tableView.allowsSelectionDuringEditing = YES;
    self.tableView.contentInset = UIEdgeInsetsMake(40, 0, 90, 0);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"right" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarClicked)];
}
- (void)rightBarClicked {
//    NSLog(@"isEditing:%d", self.tableView.isEditing);
    
    if (self.tableView.tableHeaderView) {
        self.tableView.tableHeaderView = nil;
    } else {
        self.tableView.tableHeaderView = self.headerView;
    }
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrTitle.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TVViewController"];
    cell.textLabel.text = self.arrTitle[indexPath.row];
    cell.detailTextLabel.text = @([self.arrTitle[indexPath.row] integerValue] % 7).stringValue;
    cell.shouldIndentWhileEditing = NO;
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 49;//self.arrHeight[indexPath.row].floatValue;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewRowAnimation animation = UITableViewRowAnimationRight; //[self.arrTitle[indexPath.row] integerValue] % 7;
//    [self.arrTitle removeObjectAtIndex:indexPath.row];
//    NSLog(@"animation:%ld", animation);
//    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
    
}
/**
 multily slide action
 */
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *actionDelete = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"normal" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        ;
    }];
    UITableViewRowAction *actionDefault = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"default" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        ;
    }];
    UITableViewRowAction *actionDestructive = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"destructive" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        ;
    }];
    return @[actionDelete, actionDefault, actionDestructive];
}
/* slide delete
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删了";
}
- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row%2;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.arrTitle removeObjectAtIndex:indexPath.row];
    [self.arrHeight removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
}
 */


- (NSMutableArray<NSString *> *)arrTitle {
    if (!_arrTitle) {
        NSUInteger count = 50;
        _arrTitle = [NSMutableArray arrayWithCapacity:count];
        for (NSUInteger i = 0; i<count; i++) {
            [_arrTitle addObject:[NSString stringWithFormat:@"%ld", i]];
        }
    }
    return _arrTitle;
}
- (NSMutableArray<NSNumber *> *)arrHeight {
    if (!_arrHeight) {
        NSUInteger count = 50;
        _arrHeight = [NSMutableArray arrayWithCapacity:count];
        for (NSUInteger i = 0; i<count; i++) {
            NSUInteger h = 50 + arc4random_uniform(50);
            [_arrHeight addObject:@(h)];
        }
    }
    return _arrHeight;
}

- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
        _headerView.backgroundColor = [UIColor greenColor];
    }
    return _headerView;
}
@end
















