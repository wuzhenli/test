//
//  GestureViewController.m
//  test
//
//  Created by li’Pro on 2017/11/23.
//  Copyright © 2017年 wzl. All rights reserved.
//

#import "GestureViewController.h"
#import "GestureLabel.h"

@interface GestureViewController ()
@property (strong, nonatomic) UILabel *lblTest;

@property (strong, nonatomic) UITapGestureRecognizer *tapSingle;
@property (strong, nonatomic) UITapGestureRecognizer *tapDouble;
@end

@implementation GestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.lblTest];
    
//    self.tapSingle = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSingle:)];
//    self.tapSingle.numberOfTapsRequired = 1;
//    [self.lblTest addGestureRecognizer:self.tapSingle];
    
    self.tapDouble = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDouble:)];
    self.tapDouble.numberOfTapsRequired = 2;
    [self.lblTest addGestureRecognizer:self.tapDouble];
//    
//    [self.tapSingle requireGestureRecognizerToFail:self.tapDouble];
}



#pragma -mark 
#pragma -mark event
- (void)tapSingle:(UITapGestureRecognizer *)gesture {
    NSLog(@"%s", __func__);
}
- (void)tapDouble:(UITapGestureRecognizer *)gesture {
    NSLog(@"%s", __func__);
}
- (IBAction)btnClicked:(id)sender {
    self.tapDouble.delaysTouchesBegan = YES;
}
#pragma -mark 
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
