//
//  BlockBaseViewController.m
//  test
//
//  Created by li’s Air on 2018/12/22.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "BlockBaseViewController.h"

@interface BlockBaseViewController ()

@end

@implementation BlockBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"测试block功能";
}

- (IBAction)btnTestBlockAreaClicked:(id)sender {
    [self pushViewControllerName:@"BlockAreaViewController"];
}


- (IBAction)btnBlockStructClicked:(id)sender {
    [self pushViewControllerName:@"TestBlockStructViewController"];
}

- (void)pushViewControllerName:(NSString *)name {
    Class c = NSClassFromString(name);
    [self.navigationController pushViewController:[c new] animated:YES];
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
