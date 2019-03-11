//
//  TestAnimationViewController.m
//  test
//
//  Created by li’Pro on 2018/11/15.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "TestAnimationViewController.h"
#import "PresentAlphaViewController.h"
#import "AlphaPresentationController.h"


@interface TestAnimationViewController ()<UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) AlphaPresentationController *presentationController;

@end

@implementation TestAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btnPresentAnimation:(id)sender {
    PresentAlphaViewController *vc = [[PresentAlphaViewController alloc] init];
    
    AlphaPresentationController *presentation = [[AlphaPresentationController alloc] initWithPresentedViewController:vc presentingViewController:self];
    self.presentationController = presentation;
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma -mark UIViewControllerTransitioningDelegate

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source {
    return self.presentationController;
}


@end
