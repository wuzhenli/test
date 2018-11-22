//
//  StaticSecionModel.m
//  test
//
//  Created by li’Pro on 2018/11/22.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "StaticSecionModel.h"

#define HEADER_Left_Margin 15

@interface StaticSecionModel ()

@property (assign, nonatomic) CGFloat headerHeight;
@property (assign, nonatomic) CGFloat footerHeight;

@end


@implementation StaticSecionModel

- (NSMutableArray<StaticRowModel *> *)arrRowModel {
    if (!_arrRowModel) {
        _arrRowModel = @[].mutableCopy;
    }
    return _arrRowModel;
}

- (CGFloat)headerHeight {
    if (_headerHeight < 0.01 && self.headerString.length) {
        CGFloat w = [UIScreen mainScreen].bounds.size.width - self.headerView.consLeft.constant + self.headerView.consRight.constant;
        NSDictionary *atts = @{
                               NSFontAttributeName : self.headerView.lblTitle.font
                               };
        
        CGRect frame = [self.headerString boundingRectWithSize:CGSizeMake(w, HUGE) options:kNilOptions attributes:atts context:nil];
        frame.origin.y = HEADER_Left_Margin;
        self.headerView.frame = frame;
        _headerHeight = self.headerView.frame.size.height + 6;
    }
    return _headerHeight;
}

- (StaticHeaderFooterView *)headerView {
    if (!_headerView && self.headerString.length) {
        _headerView = [[StaticHeaderFooterView alloc] initWithReuseIdentifier:nil];
        _headerView.lblTitle.text = self.headerString;
    }
    return _headerView;
}

@end
