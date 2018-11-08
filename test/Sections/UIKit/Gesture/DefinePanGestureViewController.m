//
//  DefineGestureViewController.m
//  test
//
//  Created by li’Pro on 2018/11/8.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "DefinePanGestureViewController.h"
#import "JLPanGestureRecognizer.h"


@interface DefinePanGestureViewController ()

@property (weak, nonatomic) IBOutlet UIView *redView;

@end


@implementation DefinePanGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    JLPanGestureRecognizer *pan = [[JLPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)];
    [self.view addGestureRecognizer:pan];
}

- (void)panGestureRecognizer:(JLPanGestureRecognizer *)gesture {
    CGPoint p = [gesture translationInView:gesture.view];
    NSLog(@"{%.2lf, %.2lf}", p.x, p.y);
    CGRect frame = self.redView.frame;
    frame.origin.x += p.x;
    frame.origin.y += p.y;
    self.redView.frame = frame;
    
    [gesture setTranslation:CGPointZero inView:gesture.view];
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
