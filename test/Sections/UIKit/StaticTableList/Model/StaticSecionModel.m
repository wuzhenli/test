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

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.minimumFooterHeight = 6;
        self.minimumHeaderHeight = 6;
    }
    return self;
}

#pragma -mark private

- (CGRect)getFrameWithView:(StaticHeaderFooterView *)view {
    CGFloat w = [UIScreen mainScreen].bounds.size.width - view.consLeft.constant + view.consRight.constant;
    NSDictionary *atts = @{
                           NSFontAttributeName : view.lblTitle.font
                           };
    
    CGRect frame = [view.lblTitle.text boundingRectWithSize:CGSizeMake(w, HUGE) options:kNilOptions attributes:atts context:nil];
    return frame;
}


- (NSMutableArray<StaticRowModel *> *)arrRowModel {
    if (!_arrRowModel) {
        _arrRowModel = @[].mutableCopy;
    }
    return _arrRowModel;
}

- (CGFloat)headerHeight {
    if (_headerHeight < 0.01) {
        if (self.headerString.length) {
            CGRect frame = [self getFrameWithView:self.headerView];
            _headerHeight = frame.size.height + 6;
        } else {
            _headerHeight = self.minimumHeaderHeight;
        }
    }
    return _headerHeight;
}

- (CGFloat)footerHeight {
    if (_footerHeight < 0.01) {
        if (self.footerString.length) {
            CGRect frame = [self getFrameWithView:self.footerView];
            _footerHeight = frame.size.height + 6;
        } else {
            _footerHeight = self.minimumFooterHeight;
        }
    }
    return _footerHeight;
}

- (StaticHeaderFooterView *)headerView {
    if (!_headerView && self.headerString.length) {
        _headerView = [[StaticHeaderFooterView alloc] initWithReuseIdentifier:nil];
        _headerView.lblTitle.text = self.headerString;
    }
    return _headerView;
}

- (StaticHeaderFooterView *)footerView {
    if (!_footerView && self.footerString.length) {
        _footerView = [[StaticHeaderFooterView alloc] initWithReuseIdentifier:nil];
        _footerView.lblTitle.text = self.footerString;
    }
    return _footerView;
}

@end
