//
//  PushPresentViewController.m
//  test
//
//  Created by li’Pro on 2019/4/18.
//  Copyright © 2019 wzl. All rights reserved.
//

#import "PushPresentViewController.h"
#import "PushDestViewController.h"

@interface PushPresentViewController ()

@end

@implementation PushPresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btnPushClicked:(UIButton *)sender {
//    PushDestViewController *vc = [PushDestViewController new];
//    [self.navigationController pushViewController:vc animated:NO];
    sender.backgroundColor = [UIColor redColor];
    /*
     
     CA_EXTERN CATransitionType const kCATransitionFade 渐变
     API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
     CA_EXTERN CATransitionType const kCATransitionMoveIn 新UUI 从其他方向移动过来
     API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
     CA_EXTERN CATransitionType const kCATransitionPush 新UUI 从其他方向移动过来，原UI 移走
     API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
     CA_EXTERN CATransitionType const kCATransitionReveal 从上面抽走
     .用字符串表示
     pageCurl            向下翻一页
     pageUnCurl          向上翻一页
     rippleEffect        滴水效果
     suckEffect          收缩效果，如一块布被抽走
     cube                立方体效果
     oglFlip             上下翻转效果
     */
    CATransition *transition = [CATransition animation];
    transition.duration = 0.4;
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromLeft;
    //    [self.navigationController.view.layer addAnimation:transition forKey:nil];

    [sender.layer addAnimation:transition forKey:nil];
    
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
