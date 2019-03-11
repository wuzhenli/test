//
//  MCTextView.m
//  test
//
//  Created by li’Pro on 2018/7/11.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "MCTextView.h"

@implementation MCTextView

/**
 长按手势方法 
 */
- (void)showMenuController {
    //    NSUInteger length = 0;
    //    if (self.text) {
    //        length = self.text.length;
    //    } else if (self.textLayout.text.string.length) {
    //        length = self.textLayout.text.string.length;
    //    }
    self.selectedRange = NSMakeRange(0, self.text.length);
    [self becomeFirstResponder];
    
    
    UIMenuController *menu = [UIMenuController sharedMenuController];
    // 设置菜单内容
    //    UIMenuItem *copyItem = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copy:)];
    //    menu.menuItems = @[copyItem];
    
    // 菜单最终显示的位置 \
    有两种方式: 一种是以自身的bounds  还有一种是以父控件的frame
    //    CGRect selectedCellMessageBubbleFrame = [self convertRect:self.bounds toView:self];
    [menu setTargetRect:self.bounds inView:self];
    
    // 显示菜单
    [menu setMenuVisible:YES animated:YES];
    
}


- (void)lbl_copy {
    NSString *text = @"";
    //    if (self.text) {
    //        text = self.text;
    //    } else if (self.textLayout.text.string) {
    //        text = self.textLayout.text.string;
    //    }
    [UIPasteboard generalPasteboard].string = text;
}

#pragma -mark override

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

/**
 * 通过第一响应者的这个方法告诉UIMenuController可以显示什么内容
 */
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if ( action == @selector(lbl_copy)
        || action == @selector(copy:)
        || action == @selector(paste:)
        || action == @selector(select:)
        || action == @selector(selectAll:)
        ) // 需要有文字才能支持复制
        return YES;
    return NO;
}

@end
