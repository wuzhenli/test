//
//  GestureViewController.m
//  test
//
//  Created by li’Pro on 2017/11/23.
//  Copyright © 2017年 wzl. All rights reserved.
//

#import "GestureViewController.h"
#import "GestureLabel.h"

@interface GestureViewController ()<UIGestureRecognizerDelegate>

@property (strong, nonatomic) UILabel *lblTest;

@property (strong, nonatomic) UITapGestureRecognizer *tapSingle;
@property (strong, nonatomic) UITapGestureRecognizer *tapDouble;
@property (strong, nonatomic) UIPanGestureRecognizer *pan;
@property (strong, nonatomic) UIPanGestureRecognizer *pan2;

@end

@implementation GestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:self.lblTest];
    
   
//    self.tapDouble = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDouble:)];
//    self.tapDouble.numberOfTapsRequired = 1;
//    self.tapDouble.delaysTouchesBegan = YES;
//    [self.view addGestureRecognizer:self.tapDouble];

    self.pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panEvent:)];
    [self.view addGestureRecognizer:self.pan];
    self.pan.delegate = self;
    
    self.pan2 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan2Event:)];
    [self.view addGestureRecognizer:self.pan2];
    
    
    

//    self.tapSingle = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSingle:)];
//    self.tapSingle.numberOfTapsRequired = 1;
//    [self.view addGestureRecognizer:self.tapSingle];
    
    
    NSLog(@"pan:%p   pan2:%p", self.pan, self.pan2);
}

- (IBAction)greenViewGesture:(id)sender {
    NSLog(@"%s", __func__);
}

- (IBAction)redViewGesture:(id)sender {
    NSLog(@"%s", __func__);
}

#pragma -mark event

- (void)tapSingle:(UITapGestureRecognizer *)gesture {
    NSLog(@"%s", __func__);
}
- (void)tapDouble:(UITapGestureRecognizer *)gesture {
    NSLog(@"%s", __func__);
}
- (void)panEvent:(UIPanGestureRecognizer *)gesture {
    NSLog(@"%s", __func__);
}
- (void)pan2Event:(UIPanGestureRecognizer *)gesture {
    NSLog(@"%s", __func__);
}
- (IBAction)btnClicked:(id)sender {
}


#pragma -mark UIGestureRecognizerDelegate


/**
 return YES:gestureRecognizer 失效，NO ： gestureRecognizer 有效
 */
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    NSLog(@"%p   %p", gestureRecognizer, otherGestureRecognizer);
    if (otherGestureRecognizer == self.pan2) {
        return YES;
    }
    return NO;
}

/**
 return YES: otherGestureRecognizer 手势失效 , gestureRecognizer不会失效
 return NO : otherGestureRecognizer 手势有效 , gestureRecognizer不会失效
 */
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    NSLog(@"%p   %p", gestureRecognizer, otherGestureRecognizer);
//    if (otherGestureRecognizer == self.pan2) {
//        return NO;
//    }
    return YES;
}

#pragma -mark getter

- (UILabel *)lblTest {
    if (!_lblTest) {
        _lblTest = [[GestureLabel alloc] init];
        _lblTest.userInteractionEnabled = YES;
        _lblTest.backgroundColor = [UIColor lightGrayColor];
        _lblTest.frame = CGRectMake(100, 100, 120, 120);
    }
    return _lblTest;
}
@end
