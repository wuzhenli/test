//
//  KeyWinViewController.m
//  test
//
//  Created by li’Pro on 2017/10/13.
//  Copyright © 2017年 wzl. All rights reserved.
//

#import "KeyWinViewController.h"

@interface KeyWinViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *txvBottomConstraint;

@property (weak, nonatomic) IBOutlet UITextView *txv;
@end

@implementation KeyWinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.txv.delegate = self;
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidChangeFrame:) name:UIKeyboardDidChangeFrameNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(KeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(KeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(KeyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
}

/*
 keyboardWillChangeFrame: {
     "UIKeyboardFrameBeginUserInfoKey" : NSRect: {{0, 451}, {375, 216}},
     "UIKeyboardCenterEndUserInfoKey" : NSPoint: {187.5, 522.25},
     "UIKeyboardBoundsUserInfoKey" : NSRect: {{0, 0}, {375, 289.5}},
     "UIKeyboardFrameEndUserInfoKey" : NSRect: {{0, 377.5}, {375, 289.5}},
     "UIKeyboardAnimationDurationUserInfoKey" : 0.25,
     "UIKeyboardCenterBeginUserInfoKey" : NSPoint: {187.5, 559},
     "UIKeyboardAnimationCurveUserInfoKey" : 7,
     "UIKeyboardIsLocalUserInfoKey" : 1
 }
 */
- (void)keyboardWillChangeFrame:(NSNotification *)notification {
    NSLog(@"keyboardWillChangeFrame: %@", notification.userInfo);
    CGRect endRect = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.txvBottomConstraint.constant = [UIScreen mainScreen].bounds.size.height - endRect.origin.y;
    NSTimeInterval time = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:time animations:^{
        [self.view layoutIfNeeded];
    }];
}
- (void)keyboardDidChangeFrame:(NSNotification *)notification {
    NSLog(@"keyboardDidChangeFrame: ");
}

- (void)KeyboardWillHide:(NSNotification *)notification {
    NSLog(@"%s", __func__);
}
- (void)KeyboardWillShow:(NSNotification *)notification {
    NSLog(@"%s", __func__);
}
- (void)KeyboardDidShow:(NSNotification *)notification {
    NSLog(@"%s", __func__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end

























