//
//  ScrollViewController.m
//  test
//
//  Created by li’s Air on 2018/7/1.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()<UIScrollViewDelegate>
@property (assign, nonatomic) BOOL inZooming;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *singleTap;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *doubleTap;

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    self.scrollView.delegate = self;
    self.scrollView.maximumZoomScale = 2;
    self.scrollView.contentSize = CGSizeMake(SCREEN_Width, SCREEN_Height);
    self.imgView.frame = self.scrollView.bounds;
    
    [self.singleTap requireGestureRecognizerToFail:self.doubleTap];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (IBAction)btnBackClicked:(id)sender {
}
- (IBAction)singleTap:(id)sender {
    NSLog(@"%s", __func__);
}
- (IBAction)twoTap:(UITapGestureRecognizer *)tap {// 放大缩小
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

#pragma -mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (!self.inZooming) {
        NSLog(@"%s", __func__);
    }
}                                               // any offset changes
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    NSLog(@"%s", __func__);
    CGRect imgFrame = self.imgView.frame;
    CGRect scFrame = self.scrollView.bounds;
    // small
//    scrollView:{{-37.83423985226289, -54.828723879244464}, {375, 667}}
//    imgView:{{0, 2.8421709430404007e-14}, {257.95404889419677, 458.81426829981137}}
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
    
    self.imgView.frame = imgFrame;
}
- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imgView;
}
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view {
    self.inZooming = YES;
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale {
    self.inZooming = NO;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
}

@end





















