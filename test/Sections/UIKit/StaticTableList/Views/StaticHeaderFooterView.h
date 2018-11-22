//
//  StaticHeaderFooterView.h
//  test
//
//  Created by li’Pro on 2018/11/22.
//  Copyright © 2018 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StaticHeaderFooterView : UITableViewHeaderFooterView

@property (strong, nonatomic) UILabel *lblTitle;
@property (strong, nonatomic) NSLayoutConstraint *consLeft;
@property (strong, nonatomic) NSLayoutConstraint *consRight;

@end

NS_ASSUME_NONNULL_END
