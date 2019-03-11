//
//  PresentAlphaViewController.m
//  test
//
//  Created by li’Pro on 2018/11/15.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "PresentAlphaViewController.h"

@interface PresentAlphaViewController ()

@end

@implementation PresentAlphaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor orangeColor]; //[ colorWithAlphaComponent:0.4];
    
//    CGSize scSize = [UIScreen mainScreen].bounds.size;
//    self.preferredContentSize = CGSizeMake(scSize.width, 300);
}

- (IBAction)btnBackClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
//{
//    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
//    
//    // When the current trait collection changes (e.g. the device rotates),
//    // update the preferredContentSize.
//    //    self.view.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.3];
//    CGSize scSize = [UIScreen mainScreen].bounds.size;
//    if (self.view) {
//        scSize.height = CGRectGetHeight(self.view.frame);
//    }
//    self.preferredContentSize = scSize;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
