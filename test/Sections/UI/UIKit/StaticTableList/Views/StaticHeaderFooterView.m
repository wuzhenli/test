//
//  StaticHeaderFooterView.m
//  test
//
//  Created by li’Pro on 2018/11/22.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "StaticHeaderFooterView.h"

@implementation StaticHeaderFooterView

- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self == [super initWithReuseIdentifier:reuseIdentifier]) {
        self.lblTitle = [UILabel new];
        self.lblTitle.textColor = [UIColor lightGrayColor];
        self.lblTitle.font = [UIFont systemFontOfSize:13];
        
        [self.contentView addSubview:self.lblTitle];
        
        __block MASConstraint *consLeft, *consRight;
        [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            consLeft = make.left.offset(15);
            consLeft = make.right.offset(-15);
            make.centerY.equalTo(self.contentView);
        }];
        self.consLeft = [consLeft valueForKey:@"layoutConstraint"];
        self.consRight = [consRight valueForKey:@"layoutConstraint"];
        
    }
    return self;
}

@end
