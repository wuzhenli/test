//
//  PreviewImageView.m
//  test
//
//  Created by li’Pro on 2018/12/24.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "PreviewImageView.h"

@interface PreviewImageView ()<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;

@property (assign, nonatomic) BOOL inZooming;

@end


@implementation PreviewImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)setup {
    [self addSubview:self.scrollView];
    self.scrollView.frame = self.bounds;
    [self.scrollView addSubview:self.imageView];
//    [self addGesture];
}

- (void)addGesture {
    UITapGestureRecognizer *tapSingle = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToTapSingle:)];
    tapSingle.numberOfTapsRequired = 1;
    UITapGestureRecognizer *tapDouble = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToTapDouble:)];
    tapDouble.numberOfTapsRequired = 2;
    [tapSingle requireGestureRecognizerToFail:tapDouble];
    
    [self.scrollView addGestureRecognizer:tapSingle];
    [self.scrollView addGestureRecognizer:tapDouble];
}

- (void)respondsToTapSingle:(UITapGestureRecognizer *)tap {
    NSLog(@"%s", __func__);
    CGPoint p = [tap locationInView:tap.view];
    if (!CGRectContainsPoint(tap.view.bounds, p)) {
        return;
    }
    UIScrollView *scrollView = self.scrollView;
    if (scrollView.zoomScale == scrollView.maximumZoomScale) {
        [scrollView setZoomScale:1. animated:YES];
    } else {
        [scrollView zoomToRect:CGRectMake(p.x, p.y, 1, 1) animated:YES];
    }
}

- (void)respondsToTapDouble:(UITapGestureRecognizer *)tap {
    UIScrollView *scrollView = self.scrollView;
    UIView *zoomView = [self viewForZoomingInScrollView:scrollView];
    CGPoint point = [tap locationInView:zoomView];
    if (!CGRectContainsPoint(zoomView.bounds, point)) {
        return;
    }
    if (scrollView.zoomScale == scrollView.maximumZoomScale) {
        [scrollView setZoomScale:1 animated:YES];
    } else {
        //让指定区域尽可能大的显示在可视区域
        [scrollView zoomToRect:CGRectMake(point.x, point.y, 1, 1) animated:YES];
    }
}

- (void)setImage:(UIImage *)image {
    _image = image;
    
    [self countLayoutWithImage:image completed:^(CGRect imageFrame) {
        self.imageView.image = image;
    }];
}

- (void)countLayoutWithImage:(UIImage *)image completed:(void(^)(CGRect imageFrame))completed {
    [[self class] countWithContainerSize:self.scrollView.bounds.size image:image  verticalFillType:EnumPreviewImageFillTypeCompletely horizontalFillType:EnumPreviewImageFillTypeFullWidth completed:^(CGRect imageFrame, CGSize contentSize, CGFloat minimumZoomScale, CGFloat maximumZoomScale) {
        
        self.scrollView.contentSize = CGSizeMake(contentSize.width, contentSize.height);
        self.scrollView.minimumZoomScale = minimumZoomScale;
        self.scrollView.maximumZoomScale = maximumZoomScale * 1.2;  //多给用户缩放 0.2 倍

        self.imageView.frame = imageFrame;
        
        if (completed) completed(imageFrame);
    }];
}

//计算图片大小核心代码
+ (void)countWithContainerSize:(CGSize)containerSize image:(UIImage *)image verticalFillType:(EnumPreviewImageFillType)verticalFillType horizontalFillType:(EnumPreviewImageFillType)horizontalFillType completed:(void(^)(CGRect _imageFrame, CGSize _contentSize, CGFloat _minimumZoomScale, CGFloat _maximumZoomScale))completed {
    
    CGSize imageSize = image.size;
    CGFloat containerWidth = containerSize.width;
    CGFloat containerHeight = containerSize.height;
    CGFloat containerScale = containerWidth / containerHeight;
    
    CGFloat width = 0, height = 0, x = 0, y = 0, minimumZoomScale = 1, maximumZoomScale = 1;
    CGSize contentSize = CGSizeZero;
    
    //计算最大缩放比例
    CGFloat widthScale = imageSize.width / containerWidth,
    heightScale = imageSize.height / containerHeight,
    maxScale = widthScale > heightScale ? widthScale : heightScale;
    maximumZoomScale = maxScale > 1 ? maxScale : 1;
    
    //其他计算
//    EnumPreviewImageFillType currentFillType = screenOrientation == YBImageBrowserScreenOrientationVertical ? verticalFillType : horizontalFillType;
    EnumPreviewImageFillType currentFillType = verticalFillType;
    
    switch (currentFillType) {
        case EnumPreviewImageFillTypeFullWidth: {
            
            width = containerWidth;
            height = containerWidth * (imageSize.height / imageSize.width);
            if (imageSize.width / imageSize.height >= containerScale) {
                x = 0;
                y = (containerHeight - height) / 2.0;
                contentSize = CGSizeMake(containerWidth, containerHeight);
                minimumZoomScale = 1;
            } else {
                x = 0;
                y = 0;
                contentSize = CGSizeMake(containerWidth, height);
                minimumZoomScale = containerHeight / height;
            }
        }
            break;
        case EnumPreviewImageFillTypeCompletely: {
            
            if (imageSize.width / imageSize.height >= containerScale) {
                width = containerWidth;
                height = containerWidth * (imageSize.height / imageSize.width);
                x = 0;
                y = (containerHeight - height) / 2.0;
            } else {
                height = containerHeight;
                width = containerHeight * (imageSize.width / imageSize.height);
                x = (containerWidth - width) / 2.0;
                y = 0;
            }
            contentSize = CGSizeMake(containerWidth, containerHeight);
            minimumZoomScale = 1;
        }
            break;
        default:
            break;
    }
    
    if (completed) completed(CGRectMake(x, y, width, height), contentSize, minimumZoomScale, maximumZoomScale);
}


#pragma -mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (!self.inZooming) {
    }
}                                               
// any offset changes
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    CGRect imgFrame = self.imageView.frame;
    CGRect scFrame = self.scrollView.bounds;
    // small
//    scrollView:{{-37.83423985226289, -54.828723879244464}, {375, 667}}
//    imageView:{{0, 2.8421709430404007e-14}, {257.95404889419677, 458.81426829981137}}
    if (imgFrame.size.width < scFrame.size.width) { // pinch
        imgFrame.origin.x = 0.5 *(scFrame.size.width - imgFrame.size.width);
    } else {
        imgFrame.origin.x = 0;
    }
    
    if (imgFrame.size.height < scFrame.size.height) {
        imgFrame.origin.y = 0.5 *(scFrame.size.height - imgFrame.size.height);
    } else {
        imgFrame.origin.y = 0;
    }
    
    self.imageView.frame = imgFrame;
}
- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view {
    self.inZooming = YES;
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale {
    self.inZooming = NO;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
}


#pragma -mark getter

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [UIImageView new];
    }
    return _imageView;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.decelerationRate = UIScrollViewDecelerationRateFast;
        _scrollView.maximumZoomScale = 1;
        _scrollView.minimumZoomScale = 1; // 
        _scrollView.contentSize = CGSizeMake(_scrollView.bounds.size.width, _scrollView.bounds.size.height);
        _scrollView.alwaysBounceHorizontal = NO;
        _scrollView.alwaysBounceVertical = YES;
        if (@available(iOS 11.0, *)) {
            _scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        _scrollView.backgroundColor = [UIColor blackColor];
    }
    return _scrollView;
}
@end
