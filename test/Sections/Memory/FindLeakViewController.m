//
//  FindLeakViewController.m
//  test
//
//  Created by 吴贞利 on 2020/4/8.
//  Copyright © 2020 wzl. All rights reserved.
//

#import "FindLeakViewController.h"

@interface FindLeakViewController ()

@property (copy, nonatomic) dispatch_block_t block;

@end


@implementation FindLeakViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [UILabel new];
    label.text = @"返回出现内存泄露";
    label.font = [UIFont systemFontOfSize:18];
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = CGRectMake(20, 100, SCREEN_Width - 40, 45);
    [self.view addSubview:label];
    
    self.block = ^{
        NSLog(@"%@ %@", NSStringFromClass([self class]), self);
    };
    self.block();
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
