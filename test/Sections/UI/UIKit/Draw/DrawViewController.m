//
//  DrawViewController.m
//  test
//
//  Created by li’Pro on 2018/11/28.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "DrawViewController.h"
#import "DrawFirstView.h"


@interface DrawViewController ()

@end

@implementation DrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}

- (void)setupUI {
    self.title = NSStringFromClass([self class]);
    self.view.backgroundColor = [UIColor whiteColor];
    
    DrawFirstView *firstView = [[DrawFirstView alloc] initWithFrame:CGRectMake(10, 90, 120, 120)];
    firstView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:firstView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
