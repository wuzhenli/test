//
//  BBSProgressHUD.h
//  BBS
//
//  Created by li’Pro on 2018/3/21.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 提示文字显示时长
FOUNDATION_EXPORT CGFloat const kTipDuration;
NS_ASSUME_NONNULL_BEGIN

@interface BBSProgressHUD : NSObject

+ (void)showToView:(nullable UIView *)view text:(NSString *)text ;
+ (void)showLoadingToView:(nullable UIView *)view ;
+ (void)showLoadingToView:(nullable UIView *)view text:(NSString *)text ;

+ (BOOL)hideHUDForView:(nullable UIView *)view ;
+ (BOOL)hideHUDForView:(nullable UIView *)view animated:(BOOL)animated ;

@end

NS_ASSUME_NONNULL_END
