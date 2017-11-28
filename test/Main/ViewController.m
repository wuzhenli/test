//
//  ViewController.m
//  test
//
//  Created by li’Pro on 2017/9/26.
//  Copyright © 2017年 wzl. All rights reserved.
//

#import "ViewController.h"
#import "KeyWinViewController.h"
#import "JLGradientButton.h"
#import "IMBoard.h"
#import "GestureViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet JLGradientButton *btnGradient;

@property (strong, nonatomic) UIView *viewRed;
@property (strong, nonatomic) IMBoard *imBoard;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.navigationBarHidden = YES;
    // add one line
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    NSLog(@"%s",__func__);
}


- (void)testGradient {
}
/*
 iPhone 6s
 2017-11-10 10:30:49.604782+0800 test[8176:97697] nativeBounds:{{0, 0}, {750, 1334}}
 2017-11-10 10:30:49.605277+0800 test[8176:97697] nativeScale:2.000000   scale:2.000000
 2017-11-10 10:30:49.605412+0800 test[8176:97697] bounds:{{0, 0}, {375, 667}}
 iPhone 6s Plus
 2017-11-10 10:31:30.123601+0800 test[8407:102365] nativeBounds:{{0, 0}, {1242, 2208}}
 2017-11-10 10:31:30.123857+0800 test[8407:102365] nativeScale:3.000000   scale:3.000000
 2017-11-10 10:31:30.124060+0800 test[8407:102365] bounds:{{0, 0}, {414, 736}}

 */
- (IBAction)btnClicked_1:(JLGradientButton *)sender {
    self.btnGradient.enabled = NO;
    [self.btnGradient setGradientLayerHidden:YES];
}

- (IBAction)btnClicked_2:(id)sender {
    self.btnGradient.enabled = YES;
    [self.btnGradient setGradientLayerHidden:NO];
}

- (IBAction)btnClicked_3:(UIButton *)sender {
    
    
}
- (void)test {

}

- (UIView *)viewRed {
    if (!_viewRed) {
        _viewRed = [[UIView alloc] initWithFrame:CGRectMake(10, 30, 10, 30)];
        _viewRed.backgroundColor = [UIColor redColor];
    }
    return _viewRed;
}

- (IMBoard *)imBoard {
    if (!_imBoard) {
        _imBoard = [IMBoard new];
    }
    return _imBoard;
}

@end

























