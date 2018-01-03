//
//  SlideViewController.m
//  test
//
//  Created by li’Pro on 2018/1/3.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "SlideViewController.h"

@interface SlideViewController ()<UIScrollViewDelegate, UIGestureRecognizerDelegate>
@property (strong, nonatomic) UILabel *lblLeft;
@property (strong, nonatomic) UILabel *lblRight;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation SlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.scrollView addSubview:self.lblLeft];
    [self.scrollView addSubview:self.lblRight];
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    self.lblLeft.frame = CGRectMake(0, 0, size.width, size.height- 200);
    self.lblRight.frame = CGRectMake(size.width, 0, size.width, size.height-200);
    
    
//    self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    self.scrollView.contentSize = CGSizeMake(size.width * 2, size.height - 200);
    self.scrollView.pagingEnabled = YES;
    
    self.scrollView.bounces = NO;
    self.scrollView.alwaysBounceHorizontal = NO;
//    self.scrollView.delegate = self;
    NSLog(@"%@", self.scrollView.panGestureRecognizer);
    
}

#pragma -mark 
#pragma -mark UIGestureRecognizerDelegate
- (void)endScroll {
    
}
#pragma -mark 
#pragma -mark UIScrollViewDelegate
// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (decelerate == NO) {
        [self endScroll];
    }
}

   // called on finger up as we are moving
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    
}
 // called when scroll view grinds to a halt
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self endScroll];
}     
// called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self endScroll];
}


- (UILabel *)lblLeft {
    if (!_lblLeft) {
        _lblLeft = [[UILabel alloc] init];
        _lblLeft.backgroundColor = [UIColor orangeColor];
        _lblLeft.numberOfLines = 0;
        _lblLeft.text = @"Specify the views for a view controller using the loadView method. In that method, create your view hierarchy programmatically and assign the root view of that hierarchy to the view controller’s view property.";
    }
    return _lblLeft;
}
- (UILabel *)lblRight {
    if (!_lblRight) {
        _lblRight = [[UILabel alloc] init];
        _lblRight.backgroundColor = [UIColor cyanColor];
        _lblRight.numberOfLines = 0;
        _lblRight.text = @"right A view controller is the sole owner of its view and any subviews it creates. It is responsible for creating those views and for relinquishing ownership of them at the appropriate times such as when the view controller itself is released. If you use a storyboard or a nib file to store your view objects, each view controller object automatically gets its own copy of these views when the view controller asks for them. However, if you create your views manually, each view controller must have its own unique set of views. You cannot share views between view controllers.";
    }
    return _lblRight;
}

@end














