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
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    [self.contentView addSubview:self.imgViewLeft];
    [self.imgViewLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(36, 36));
    }];
    
    [self.contentView addSubview:self.lblTitle];
    [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.imgViewLeft.mas_right).offset(10);
    }];
    
    [self.contentView addSubview:self.switchRight];
    [self.switchRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.lblDesc];
    [self.lblDesc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.centerY.equalTo(self.contentView);
    }];
}

#pragma -mark event reponse

- (void)switchRightValueChanged {
    if (self.delegate &&
        [self.delegate respondsToSelector:@selector(cellSwitchRightValueChanged:)]) {
        [self.delegate cellSwitchRightValueChanged:self.switchRight];
    }
}


#pragma -mark getter

- (UIImageView *)imgViewLeft {
    if (!_imgViewLeft) {
        _imgViewLeft = [UIImageView new];
    }
    return _imgViewLeft;
}

- (UILabel *)lblTitle {
    if (!_lblTitle) {
        UILabel *lbl = [[UILabel alloc] init];
        lbl.textColor = [UIColor blackColor];
        lbl.font = [UIFont systemFontOfSize:15];
        _lblTitle = lbl;
    }
    return _lblTitle;
}

- (UILabel *)lblDesc {
    if (!_lblDesc) {
        UILabel *lbl = [[UILabel alloc] init];
        lbl.textColor = [UIColor lightGrayColor];
        lbl.font = [UIFont systemFontOfSize:15];
        _lblDesc = lbl;
    }
    return _lblDesc;
}

- (UISwitch *)switchRight {
    if (!_switchRight) {
        UISwitch *sch = [[UISwitch alloc] init];
        [sch addTarget:self action:@selector(switchRightValueChanged) forControlEvents:UIControlEventValueChanged];
        _switchRight = sch;
    }
    return _switchRight;
}

- (UIImageView *)arrowRight {
    if (!_arrowRight) {
        _arrowRight = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"opinion_detail_icon_arrow_to_topic"]];
    }
    return _arrowRight;
}
@end
