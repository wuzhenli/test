//
//  FindLeakViewController.m
//  test
//
//  Created by 吴贞利 on 2020/4/8.
//  Copyright © 2020 wzl. All rights reserved.
//

#import "FindLeakViewController.h"
#import "ActionButton.h"
#import <FBRetainCycleDetector/FBRetainCycleDetector.h>


@interface FindLeakViewController ()

@property (copy, nonatomic) dispatch_block_t block;
@property (strong, nonatomic) ActionButton *actionButton;

@end


@implementation FindLeakViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setTitle:@"<" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(10, 20, 44, 44);
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
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
    
    
    [self.view addSubview:self.actionButton];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.actionButton sendActionsForControlEvents:UIControlEventTouchUpOutside];
    });
}

- (void)backAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)actionButtonClicked:(UIButton *)sender event:(UIEvent *)event {
    NSLog(@"%s", __func__);
    
    FBRetainCycleDetector *detector = [FBRetainCycleDetector new];
    [detector addCandidate:self];
    NSSet<NSArray<FBObjectiveCGraphElement *> *> *retainCycles = [detector findRetainCycles];
    for (NSArray<FBObjectiveCGraphElement *> *cycleArray in retainCycles) {
        NSLog(@"%@", cycleArray);
    }
}

- (void)actionButtonTouchUpOutside {
    NSLog(@"%s", __func__);
}

#pragma mark - getter

- (ActionButton *)actionButton {
    if (!_actionButton) {
        _actionButton = [ActionButton buttonWithType:UIButtonTypeCustom];
        [_actionButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_actionButton setTitle:@"ActionButton" forState:UIControlStateNormal];
        [_actionButton addTarget:self action:@selector(actionButtonClicked:event:) forControlEvents:UIControlEventTouchUpInside];
        [_actionButton addTarget:self action:@selector(actionButtonTouchUpOutside) forControlEvents:UIControlEventTouchUpOutside];
        
        _actionButton.frame = CGRectMake(20, 150, SCREEN_Width-40, 45);
    }
    return _actionButton;
}

@end
