//
//  TestVCController.m
//  test
//
//  Created by li’s Air on 2018/7/6.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "TestVCController.h"

@interface TestVCController ()

@property (strong, nonatomic)  UIView *grayView;
@property (strong, nonatomic)  UIView *redView;


@end

@implementation TestVCController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    [self.view addSubview:self.grayView];
//    [self.grayView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.height.mas_equalTo(200);
//        make.top.offset(100);
//        make.centerX.offset(0);
//    }];
//    
//    [self.grayView addSubview:self.redView];
//    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leftMargin.rightMargin.bottomMargin.topMargin.offset(0);
//    }];
//    self.grayView.layoutMargins = UIEdgeInsetsMake(50, 50, 50, 50);
    [self testRedianConfig];
}
//- (void)viewDidLayoutSubviews {
//    [super viewDidLayoutSubviews];
//}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"statusBarHeight:%lf", [UIApplication sharedApplication].statusBarFrame.size.height);
};

- (void)testRedianConfig {
    
    
    [self.view addSubview:self.redView];
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.top.offset(66);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
}

- (void)example2 {
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.centerX.equalTo(self.view);
//        make.height.equalTo(self.view.mas_height).offset(-160);
        make.top.offset(90);
        make.bottom.offset(-2);
    }];
    
    UIView *yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor yellowColor];
    [blueView addSubview:yellowView];
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(blueView);
//        make.centerY.equalTo(blueView);
        make.width.centerX.equalTo(blueView);
        make.height.equalTo(blueView).multipliedBy(0.5);
    }];
    
    UIView *blackView = [[UIView alloc] init];
    blackView.backgroundColor = [UIColor blackColor];
    [yellowView addSubview:blackView];
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(yellowView.mas_trailingMargin);
        make.leading.equalTo(yellowView.mas_leadingMargin);
        make.top.equalTo(yellowView.mas_topMargin);
        make.bottom.equalTo(yellowView.mas_bottomMargin);
    }];
    
    
    // 设置blueView的layoutMargins都为50，yellowView高为blueView的一半且中心点重合，UIKit约束计算后得出yellowView此时上下边缘到blueView的上下边缘距离满足50 points距离的结论。但是左右边缘不满足所以当yellowView的preservesSuperviewLayoutMargins为YES时，UIKit自动调整blackView的左右边距以满足blueView的margins。当yellowView.preservesSuperviewLayoutMargins = NO;的时候blackView完全遮盖yellowView
    blueView.layoutMargins = UIEdgeInsetsMake(50, 50, 50, 50);
    yellowView.layoutMargins = UIEdgeInsetsZero;
    // YES：自己无法满足父视图的 layoutMargins 则自己调整子视图，NO ： 不做调整
    yellowView.preservesSuperviewLayoutMargins = YES;
}

- (void)example1 {
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    NSMutableArray *constraints = [NSMutableArray array];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.view addConstraints:constraints];
    
    UIView *yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor yellowColor];
    yellowView.translatesAutoresizingMaskIntoConstraints = NO;
    [blueView addSubview:yellowView];
    [constraints removeAllObjects];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:yellowView attribute:NSLayoutAttributeLeftMargin relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeLeftMargin multiplier:1.0 constant:0.0]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:yellowView attribute:NSLayoutAttributeRightMargin relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeRightMargin multiplier:1.0 constant:0.0]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:yellowView attribute:NSLayoutAttributeTopMargin relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant:0.0]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:yellowView attribute:NSLayoutAttributeBottomMargin relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:0.0]];
    [blueView addConstraints:constraints];
    
    blueView.layoutMargins = UIEdgeInsetsMake(50, 50, 50, 50);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}



- (void)testView {
    //    typedef NS_OPTIONS(NSUInteger, UIViewAutoresizing) {
    //        UIViewAutoresizingNone                 = 0,
    //        UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,   1
    //        UIViewAutoresizingFlexibleWidth        = 1 << 1,   2
    //        UIViewAutoresizingFlexibleRightMargin  = 1 << 2,   4
    //        UIViewAutoresizingFlexibleTopMargin    = 1 << 3,   8
    //        UIViewAutoresizingFlexibleHeight       = 1 << 4,   16
    //        UIViewAutoresizingFlexibleBottomMargin = 1 << 5
    //    };
    UIView *sp = self.view.superview;
    NSLog(@"self.view:%@   %ld" , self.view, self.view.autoresizingMask);
    NSLog(@"self.view.superview:%@", self.view.superview);
    NSLog(@"%@", self.view.constraints);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UIView *)grayView {
    if (!_grayView) {
        _grayView = [UIView new];
        _grayView.backgroundColor = [UIColor grayColor];
    }
    return _grayView;
}

- (UIView *)redView {
    if (!_redView) {
        _redView = [UIView new];
        _redView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}

@end
