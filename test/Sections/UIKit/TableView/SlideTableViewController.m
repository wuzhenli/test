//
//  SlideTableViewController.m
//  test
//
//  Created by li’s Air on 2018/6/30.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "SlideTableViewController.h"
#import "SlideData.h"

@interface SlideTableViewController ()<MGSwipeTableCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray<SlideData *> *arrData;
@end

@implementation SlideTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.arrData = [SlideData defaultSlideData];
}

#pragma -mark
#pragma -mark MGSwipeTableCellDelegate
-(BOOL) swipeTableCell:(nonnull MGSwipeTableCell*) cell tappedButtonAtIndex:(NSInteger) index direction:(MGSwipeDirection)direction fromExpansion:(BOOL) fromExpansion {
    NSLog(@"%ld", index);
    cell.rightButtons = @[[MGSwipeButton buttonWithTitle:@"Delete" backgroundColor:[UIColor redColor]]];
    [cell refreshButtons:NO];
    return NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * reuseIdentifier = @"programmaticCell";
    MGSwipeTableCell * cell = [self.tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[MGSwipeTableCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    }
    SlideData *data = self.arrData[indexPath.row];
    
    cell.textLabel.text = data.title;
    cell.detailTextLabel.text = @"Detail text";
    cell.delegate = self; //optional
    
    
    //configure left buttons
    cell.leftButtons = @[[MGSwipeButton buttonWithTitle:@"" icon:[UIImage imageNamed:@"check.png"] backgroundColor:[UIColor greenColor]],
                         [MGSwipeButton buttonWithTitle:@"" icon:[UIImage imageNamed:@"fav.png"] backgroundColor:[UIColor blueColor]]];
    cell.leftSwipeSettings.transition = MGSwipeTransitionDrag;//MGSwipeTransition3D;
    
    //configure right buttons
    MGSwipeButton *delete = [MGSwipeButton buttonWithTitle:@"DELE" backgroundColor:[UIColor redColor] callback:^BOOL(MGSwipeTableCell * _Nonnull cell) {
        NSLog(@"--- you clicked delete");
        return NO;
    }];
    cell.rightButtons = @[delete,
                          [MGSwipeButton buttonWithTitle:@"More" backgroundColor:[UIColor lightGrayColor]]];
    cell.rightSwipeSettings.transition = MGSwipeTransitionDrag;//MGSwipeTransition3D;
    
    
    MGSwipeExpansionSettings *setting = cell.rightExpansion;;
    setting.buttonIndex = 0;
    setting.fillOnTrigger = YES;
    cell.rightSwipeSettings.transition = data.transition;
    
    
    
    return cell;
}
@end















