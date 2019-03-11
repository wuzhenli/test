//
//  BlockCrashViewController.m
//  test
//
//  Created by li’Pro on 2019/1/22.
//  Copyright © 2019 wzl. All rights reserved.
//

#import "BlockCrashViewController.h"
#import "Person.h"

@interface BlockCrashViewController ()

@property (strong, nonatomic) dispatch_block_t block;
@property (strong, nonatomic) NSMutableArray *array;

@end

@implementation BlockCrashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    __weak typeof(self) ws = self;
    
    self.block = ^{
        [ws log];
    };
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.block();
}

- (IBAction)btnClicked:(id)sender {
    NSMutableArray *array = [self getArray];
    for (Person *p in array) {
        if ([p.name isEqualToString:@"name:3"]) {
            [array removeObject:p];
            [array addObject:p];
            break;
        }
    }
    
    NSLog(@"%@", array);
}





- (void)log {
    NSLog(@"%s", __func__);
}


- (NSMutableArray *)getArray {
    NSMutableArray *arr = @[].mutableCopy;
    for (int i = 0; i < 10; i++) {
        Person *p = [Person new];
        p.name = [NSString stringWithFormat:@"name:%d", i];
        [arr addObject:p];
    }
    return arr;
}

@end
