//
//  TestViewController.m
//  test
//
//  Created by li’Pro on 2017/9/27.
//  Copyright © 2017年 wzl. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIWindow *window = [self getFrontWindow];
    
    static CGFloat offset = 0;
    UIView *viewRed = ({
        UIView *v = [[UIView alloc] initWithFrame:CGRectMake(100 + offset, 100 + offset, 100, 100)];
        offset += 3;
        v.backgroundColor = RandomColor;
        v;
    });
    
    [window addSubview:viewRed];
    
}

- (UIWindow *)getFrontWindow {
    NSEnumerator<__kindof UIWindow *> *frontToBackWindows = [UIApplication sharedApplication].windows.reverseObjectEnumerator;
 
    for (UIWindow *win in frontToBackWindows) {
        BOOL visible = win.alpha > 0 && !win.hidden;
        BOOL onMainScreen = win.screen == [UIScreen mainScreen];
        BOOL isKeyWindow = win.isKeyWindow;
        
        if (visible && onMainScreen && isKeyWindow) {
            NSLog(@"win:%@", win);
            return win;
        }
    }
    
    return nil;
}

@end
