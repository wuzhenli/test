//
//  StaticTitleSwitchCell.m
//  test
//
//  Created by li’Pro on 2018/11/22.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "StaticTitleSwitchCell.h"

@implementation StaticTitleSwitchCell

- (void)setupSubViews {
    [self.contentView addSubview:self.lblTitle];
    [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.offset(15);
    }];
    
    [self.contentView addSubview:self.switchRight];
    [self.switchRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.centerY.equalTo(self.contentView);
    }];
}

@end
