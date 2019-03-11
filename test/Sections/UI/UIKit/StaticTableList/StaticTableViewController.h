//
//  StaticTableViewController.h
//  test
//
//  Created by li’Pro on 2018/11/22.
//  Copyright © 2018 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StaticTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (assign, nonatomic) UITableViewStyle tableViewStyle;
@property (strong, nonatomic) UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
