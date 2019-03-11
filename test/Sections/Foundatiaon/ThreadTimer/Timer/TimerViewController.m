//
//  TimerViewController.m
//  test
//
//  Created by li’Pro on 2018/6/28.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()
@property (strong, nonatomic) CADisplayLink *displayLink;
@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary *dic = @{
                          @"a" : @1,
                          @"b" : @2,
                          @"c" : @3
                          };
    NSLog(@"timer dic:%@", dic);
}
- (void)displayLinkEvent {
    NSLog(@"%s", __func__);
}

- (IBAction)startClicked:(id)sender {
    NSLog(@"%s", __func__);
    self.displayLink.paused = NO;
}

- (IBAction)pauseClicked:(id)sender {
    self.displayLink.paused = YES;
}

- (CADisplayLink *)displayLink {
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkEvent)];
        _displayLink.paused = YES;
        [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        if (@available(iOS 10.0, *)) {
            _displayLink.preferredFramesPerSecond = 1;
        } else {
            // Fallback on earlier versions
            _displayLink.frameInterval = 60 * 5;
        }
    }
    return _displayLink;
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
