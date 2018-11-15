//
//  MBProgressHUD+bbs.h
//  HudDemo
//
//  Created by li’s Air on 2018/7/28.
//  Copyright © 2018年 Matej Bukovinski. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (bbs)

@property (nonatomic, strong, readonly) UIView *topSpacer;
@property (nonatomic, strong, readonly) UIView *bottomSpacer;
@property (nonatomic, strong, readonly) UIView *indicator;
@property (nonatomic, strong) NSArray *bezelConstraints;
@property (nonatomic, strong) NSArray *paddingConstraints;

@end
