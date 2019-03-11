//
//  KeyboardViewController.m
//  test
//
//  Created by li’s Air on 2018/6/30.
//  Copyright © 2018年 wzl. All rights reserved.
/*
 UIWindow : UIView
 UIViewController: UIResponder
 UIButton : UIControl : UIView : UIResponder
 */

#import "KeyboardViewController.h"

@interface KeyboardViewController ()
@property (strong, nonatomic) UIView *redView;
@property (strong, nonatomic) UIButton *btn;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation KeyboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrameNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)keyboardWillChangeFrameNotification:(NSNotification *)notification {
    NSLog(@"textView:%d  view:%d", self.textView.isFirstResponder, self.view.isFirstResponder);
    if (! self.textView.isFirstResponder) {
        return;
    }
    CGRect endRect = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat offY = [UIScreen mainScreen].bounds.size.height - endRect.origin.y;
    NSTimeInterval time = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
}


#pragma -mark
#pragma -mark UIResponder
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    [self.view endEditing:YES];
    NSLog(@"%s", __func__);
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog(@"%s", __func__);
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog(@"%s", __func__);
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog(@"%s", __func__);
}
@end


















