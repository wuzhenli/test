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

@interface ViewController ()
@property (weak, nonatomic) IBOutlet JLGradientButton *btnGradient;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSDictionary *dic = @{
                          @"key" : @"中午"
                          };
    NSLog(@"not define debug:%@", dic);
    
    [self.btnGradient setStartPoint:CGPointMake(0, 0)];
    [self.btnGradient setEndPoint:CGPointMake(1, 1)];
    
}
- (IBAction)btnClicked_1:(JLGradientButton *)sender {
    NSValue *colorLeft = (__bridge id)[UIColor colorWithRed:255/255.f green:1/255.f blue:1/255.f alpha:1].CGColor;
    NSValue *colorRight = (__bridge id)[UIColor colorWithRed:1/255.f green:255/255.f blue:1/255.f alpha:1].CGColor;
    
    [self.btnGradient setColors:@[colorLeft, colorRight]];
}

- (IBAction)btnClicked_2:(id)sender {
//    [self.btnGradient setStartPoint:CGPointMake(0, 0)];
//    [self.btnGradient setEndPoint:CGPointMake(1, 1)];
    
//    [self.btnGradient setStartPoint:CGPointMake(1, 0)];
//    [self.btnGradient setEndPoint:CGPointMake(1, 1)];
    
    [self.btnGradient setStartPoint:CGPointMake(0.5, 0)];
    [self.btnGradient setEndPoint:CGPointMake(0.5, 1)];
}

- (IBAction)btnClicked_3:(id)sender {
    [self.btnGradient setLocations:@[@0.1, @0.2]];
}



@end

























