//
//  BaseAnimationViewController.m
//  test
//
//  Created by li’Pro on 2019/4/15.
//  Copyright © 2019 wzl. All rights reserved.
//  https://juejin.im/post/5bd140abf265da0ae6778180

#import "BaseAnimationViewController.h"

@interface BaseAnimationViewController ()<CAAnimationDelegate>

@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *lblGroupAnimation;

@end

@implementation BaseAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.containerView.hidden = YES;
}

- (IBAction)btnBaseAnimationClicked:(UIButton *)sender {
//    sender.frame = CGRectMake(200, 400, 100, 40);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    //
    animation.duration = 1;
//    animation.repeatCount = 2;
    
    animation.autoreverses = NO;
    animation.removedOnCompletion = NO;
    animation.delegate = self;
    
//    animation.additive = YES;
    animation.cumulative = YES;
    
//    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(100, 60)];
//    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 200)];
    animation.byValue = [NSValue valueWithCGPoint:CGPointMake(20, 30)];
    
    [sender.layer addAnimation:animation forKey:@"move"];
}

- (IBAction)pathAnimation:(UIButton *)sender {
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 5;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path addArcWithCenter:CGPointMake((NSInteger)SCREEN_Width>>1, (NSInteger)SCREEN_Height>>1) radius:(NSInteger)SCREEN_Width>>1 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    
    animation.path = path.CGPath;
    animation.delegate = self;
    animation.rotationMode = kCAAnimationRotateAutoReverse;
    
    [sender.layer addAnimation:animation forKey:nil];
}

- (IBAction)btnKeyFrameAnimationClicked:(UIButton *)sender {
    sender.layer.position = CGPointMake(10, 120);
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 5;
    
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(10, 100)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(300, 100)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(300, 400)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(10, 400)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(10, 100)];
    animation.values = @[value0 ,value1, value2, value3, value4];
    animation.keyTimes = @[@(0), @(0.1), @(0.2), @(0.6), @(1)];
    animation.duration = 3;
    animation.calculationMode = kCAAnimationCubic;
    animation.rotationMode = kCAAnimationRotateAutoReverse;
    
    [sender.layer addAnimation:animation forKey:nil];
}

- (IBAction)btnTransitionClicked:(UIButton *)sender {
    /*
     CATransition* trans=[CATransition animation];
     trans.duration=0.5;
     trans.type=kCATransitionFade;
     [self.view.layer addAnimation:trans forKey:nil];
     
     self.redView.hidden=YES;
     self.greenView.hidden=NO;
     self.view.backgroundColor = [UIColor lightGrayColor];
     */
//    [CATransaction begin];
//    self.containerView.hidden = NO;
////    [CATransaction commit];
//    
//    UILabel *lbl1 = ({
//        UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 40)];
//        l.backgroundColor = [UIColor cyanColor];
//        l.text = @"This is text";
//        l.font = [UIFont boldSystemFontOfSize:20];
//        l;
//    });
//    
//    CATransition *transition = [[CATransition alloc] init];
//    transition.duration = 2;
//    transition.type = kCATransitionPush;
//    transition.subtype = kCATransitionFromRight; // 从右向左 
//    [self.containerView.layer addAnimation:transition forKey:nil];
//    [self.containerView addSubview:lbl1];
    [self testTransaction];
}


- (void)testTransaction {
    [CATransaction begin];
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(150, 200, 100, 100)];
    container.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    [self.view addSubview:container];
    [CATransaction commit];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:container.bounds];
    label1.backgroundColor = [UIColor redColor];
    label1.text = @"1";
    label1.font = [UIFont boldSystemFontOfSize:30];
    label1.textAlignment = NSTextAlignmentCenter;
    [container addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:container.bounds];
    label2.backgroundColor = [UIColor orangeColor];
    label2.text = @"2";
    label2.font = [UIFont boldSystemFontOfSize:30];
    label2.textAlignment = NSTextAlignmentCenter;
    [container addSubview:label2];
    
    //位置2
    [CATransaction begin];
    container.backgroundColor = [UIColor colorWithWhite:0 alpha:1];
    [CATransaction commit];
    
    CATransition *fade = [[CATransition alloc] init];
    fade.duration = 2;
    fade.type = kCATransitionPush;
    fade.subtype = kCATransitionFromRight;
    
    //位置3
    [container.layer addAnimation:fade forKey:nil];
    //位置4
    [container insertSubview:label2 belowSubview:label1];
    
}

- (IBAction)btnGroupAnimationClicked:(UIButton *)sender {
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    
    CABasicAnimation *an1 = [CABasicAnimation animationWithKeyPath:@"position"];
    an1.duration = 2;
    an1.byValue = [NSValue valueWithCGPoint:CGPointMake(0, -100)];
    [sender.layer addAnimation:an1 forKey:nil];
    
    CABasicAnimation *an2 = [CABasicAnimation animationWithKeyPath:@"position"];
    an2.duration = 10;
    an2.byValue = [NSValue valueWithCGPoint:CGPointMake(0, -300)];
    [self.lblGroupAnimation.layer addAnimation:an2 forKey:nil];
    
    group.duration = 3;
    group.animations = @[an1, an2];
}

UIViewPropertyAnimator *animator;
- (IBAction)testInteractiveAnimation:(UIButton *)button {
    button.frame = CGRectMake(200, 100, 100, 100);
    button.layer.cornerRadius = button.bounds.size.width/2;
    button.layer.masksToBounds = YES;
    
    animator = [[UIViewPropertyAnimator alloc] initWithDuration:5 curve:(UIViewAnimationCurveEaseOut) animations:^{
        button.transform = CGAffineTransformMakeScale(0.1, 0.1);
    }];
    
    [animator startAnimation];
    [animator pauseAnimation];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.view addGestureRecognizer:pan];
}
float startFrac;
-(void)panAction:(UIPanGestureRecognizer *)pan{
    if (pan.state == UIGestureRecognizerStateChanged) {
        [animator pauseAnimation];
        float delta = [pan translationInView:self.view].y / self.view.bounds.size.height;
        animator.fractionComplete = startFrac+delta;
    }else if (pan.state == UIGestureRecognizerStateBegan){
        startFrac = animator.fractionComplete;
    }else if (pan.state == UIGestureRecognizerStateEnded){
        [animator startAnimation];
    }
}


#pragma -mark CAAnimationDelegate

/* Called when the animation begins its active duration. */
- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"%s", __func__);
}

/* Called when the animation either completes its active duration or
 * is removed from the object it is attached to (i.e. the layer). 'flag'
 * is true if the animation reached the end of its active duration
 * without being removed. */
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"%s:%d", __func__, flag);
}


@end
