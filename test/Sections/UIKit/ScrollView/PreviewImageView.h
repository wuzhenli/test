//
//  PreviewImageView.h
//  test
//
//  Created by li’Pro on 2018/12/24.
//  Copyright © 2018 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, EnumPreviewImageFillType) {
    EnumPreviewImageFillTypeFullWidth,   //宽度抵满屏幕宽度，高度不定
    EnumPreviewImageFillTypeCompletely   //保证图片完整显示情况下最大限度填充
};

NS_ASSUME_NONNULL_BEGIN

@interface PreviewImageView : UIView

@property (strong, nonatomic) UIImage *image;

@end

NS_ASSUME_NONNULL_END
