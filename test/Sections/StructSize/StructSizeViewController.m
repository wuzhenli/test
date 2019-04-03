//
//  StructSizeViewController.m
//  test
//
//  Created by li’Pro on 2019/1/29.
//  Copyright © 2019 wzl. All rights reserved.
//

#import "StructSizeViewController.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

static const DDLogLevel ddLogLevel = DDLogLevelVerbose;

@interface StructSizeViewController ()

@end

@implementation StructSizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // https://www.cnblogs.com/0201zcr/p/4789332.html
    [self testSizeOfSequence];
    DDLogVerbose(@"StructSizeViewController");
}

- (void)testSizeOfSequence {
    struct s1 {
        char c1;
        int i;
        char c2;
    };
    struct s2 {
        char c1;
        char c2;
        int i;
    };
// 2019-01-29 17:20:27.063271+0800 test[15954:339058] testSizeOfSequence:12 - 8
    NSLog(@"testSizeOfSequence:%lu - %lu", sizeof(struct s1), sizeof(struct s2));
    struct stu5  
    {  
        char i;  
        struct   
        {  
            char c;  
            int j;  
        } ss;   
        char a;  
        char b;  
        char d;  
        char e;  
        char f;  
    };
    NSLog(@"stu5:%d", sizeof(struct stu5)); // 20
}

- (void)testStructSize { // https://www.cnblogs.com/0201zcr/p/4789332.html
    struct stu1 {
        int i;
        char c;
        int j;
    };
    NSLog(@"sizeof stu1:%u", sizeof(struct stu1));// 12
    
    struct stu2  
    {  
        int k;  
        short t;  
    }; 
    NSLog(@"sizeof stu2:%u", sizeof(struct stu2));// 8
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
