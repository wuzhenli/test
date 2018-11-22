//
//  StaticSwitchTableViewCell.m
//  test
//
//  Created by li’Pro on 2018/11/22.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "StaticSwitchTableViewCell.h"

@implementation StaticSwitchTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
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
    return self;
}


#pragma -mark getter

- (UILabel *)lblTitle {
    if (!_lblTitle) {
        UILabel *lbl = [[UILabel alloc] init];
        lbl.textColor = [UIColor blackColor];
        lbl.font = [UIFont systemFontOfSize:15];
        _lblTitle = lbl;
    }
    return _lblTitle;
}

- (UISwitch *)switchRight {
    if (!_switchRight) {
        UISwitch *sch = [[UISwitch alloc] init];
        _switchRight = sch;
    }
    return _switchRight;
}

@end
