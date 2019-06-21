//
//  TestBlockStructViewController.m
//  test
//
//  Created by li’s Air on 2018/12/23.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "TestBlockStructViewController.h"

@interface TestBlockStructViewController () {
    UIButton *_btnMember;
}


@property (copy, nonatomic) dispatch_block_t block;
@property (copy, nonatomic) dispatch_block_t captureWeak;
@property (copy, nonatomic) dispatch_block_t captureWeakStrong;
@property (copy, nonatomic) dispatch_block_t blockVariable;;

@end

@implementation TestBlockStructViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}



- (void)testBlockCaptureStackVariable {
    __block int blockInt = 123;
    self.block = ^{
        blockInt = 144;
        NSLog(@"blockInt:%d", blockInt);
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
