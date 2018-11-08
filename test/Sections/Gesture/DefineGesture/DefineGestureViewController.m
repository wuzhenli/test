//
//  DefineGestureViewController.m
//  test
//
//  Created by li’s Air on 2018/8/4.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "DefineGestureViewController.h"
#import "CircleGestureRecognizer.h"


@interface DefineGestureViewController ()

@property (strong, nonatomic) CircleGestureRecognizer *gesture;

@end

@implementation DefineGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.gesture = [[CircleGestureRecognizer alloc] initWithTarget:self action:@selector(circleGesture:)];
    [self.view addGestureRecognizer:self.gesture];
}

#pragma -mark gesture

- (void)circleGesture:(CircleGestureRecognizer *)gesture {
    NSLog(@"%s", __func__);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
