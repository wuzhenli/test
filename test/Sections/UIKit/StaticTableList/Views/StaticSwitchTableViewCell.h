//
//  StaticSwitchTableViewCell.h
//  test
//
//  Created by li’Pro on 2018/11/22.
//  Copyright © 2018 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol StaticSwitchTableViewCellDelegate <NSObject>

- (void)cellSwitchRightValueChanged:(UISwitch *)sender ;

@end


@interface StaticSwitchTableViewCell : UITableViewCell

@property (weak, nonatomic) id<StaticSwitchTableViewCellDelegate> delegate;

@property (strong, nonatomic) UIImageView *imgViewLeft;
@property (strong, nonatomic) UILabel *lblTitle;

@property (strong, nonatomic) UILabel *lblDesc;
@property (strong, nonatomic) UISwitch *switchRight;
@property (strong, nonatomic) UIImageView *arrowRight;

/**
 子类重写此方法，重新布局子控件 
 */
- (void)setupSubViews ;

@end

NS_ASSUME_NONNULL_END
