//
//  ReverseViewController.m
//  test
//
//  Created by li’Pro on 2019/4/17.
//  Copyright © 2019 wzl. All rights reserved.
//  https://www.jianshu.com/p/ed451596a4e1

#import "ReverseViewController.h"
#import "LoginViewController.h"


@interface ReverseViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ReverseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btnReverseclicked:(id)sender {
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    // 旋转角度， 其中的value表示图像旋转的最终位置
    keyAnimation.values = [NSArray arrayWithObjects:
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0,1,0)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation((M_PI/2), 0,1,0)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0,1,0)],
                           nil];
    keyAnimation.cumulative = NO;
    keyAnimation.duration = 0.4;
    keyAnimation.repeatCount = 1;
    keyAnimation.removedOnCompletion = NO;
    
    [self.imgView.layer addAnimation:keyAnimation forKey:@"transform"];
    // [self performSelector:@selector(changeImg) withObject:nil afterDelay:0.6 * actionSeconds];
    
    /*
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    
    animation.toValue = [NSNumber numberWithFloat:M_PI];
    animation.duration = 0.5;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = YES;
    [self.imgView.layer addAnimation:animation forKey:nil];
    */
    /* 会翻转但有阴影
    [UIView transitionWithView:self.imgView duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
       
    }completion:^(BOOL finished) {

    }];
     */
    
}


- (IBAction)btnChangeRootVC:(id)sender {
    LoginViewController *vc = [[LoginViewController alloc] init];
    
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    // 旋转角度， 其中的value表示图像旋转的最终位置
    keyAnimation.values = [NSArray arrayWithObjects:
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0,1,0)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation((M_PI/2), 0,1,0)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0,1,0)],
                           nil];
    keyAnimation.cumulative = NO;
    keyAnimation.duration = 1;
    keyAnimation.repeatCount = 1;
    keyAnimation.removedOnCompletion = NO;
    
    [[UIApplication sharedApplication].keyWindow.layer addAnimation:keyAnimation forKey:@"transform"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIApplication sharedApplication].keyWindow.rootViewController = vc;
    });
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
