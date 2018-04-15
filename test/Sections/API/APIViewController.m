//
//  APIViewController.m
//  test
//
//  Created by li’Pro on 2017/12/5.
//  Copyright © 2017年 wzl. All rights reserved.
//

#import "APIViewController.h"

@interface APIViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation APIViewController
/**
 * 
  test[1162:32241] -[APIViewController initWithNibName:bundle:]
  test[1162:32241] -[APIViewController init]

 */
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"%s", __func__);
    }
    return self;
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        NSLog(@"%s", __func__);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"origin maskView:%@", self.imgView.maskView);
    self.imgView.image = [UIImage imageNamed:@"4"];
    
    self.view.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.3];
    CGSize scSize = [UIScreen mainScreen].bounds.size;
    self.preferredContentSize = CGSizeMake(scSize.width, 300);
}

- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
    
    // When the current trait collection changes (e.g. the device rotates),
    // update the preferredContentSize.
    self.view.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.3];
    CGSize scSize = [UIScreen mainScreen].bounds.size;
    self.preferredContentSize = CGSizeMake(scSize.width, 300);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setMaskView];
}
- (void)setMaskView {
    UIView *v = [[UIView alloc] initWithFrame:self.imgView.bounds];
    v.backgroundColor = [UIColor orangeColor];
    v.layer.cornerRadius = 12;
    v.layer.masksToBounds = YES;
    self.imgView.maskView = v;
}

- (void)setMask {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.imgView.bounds cornerRadius:30];
    CAShapeLayer *layer = [CAShapeLayer layer];
    [layer setFillColor:[UIColor redColor].CGColor];
    layer.shadowOpacity = 0.5;
    layer.shadowRadius = 40;
    layer.path = path.CGPath;
    self.imgView.layer.mask = layer;
    
    NSLog(@"--");
}


- (IBAction)btnClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end













