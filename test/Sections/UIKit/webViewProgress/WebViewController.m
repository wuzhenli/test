//
//  WebViewController.m
//  test
//
//  Created by li’s Air on 2018/7/1.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>

@interface WebViewController ()<WKNavigationDelegate, WKUIDelegate>

@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (strong, nonatomic) UIProgressView *progressView;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
    [self setup];
}

- (void)dealloc
{
    [self.webView removeObserver:self
                      forKeyPath:NSStringFromSelector(@selector(estimatedProgress))];
    self.webView.navigationDelegate = nil;
}

- (void)setup {
    [self.view addSubview:self.progressView];
    // 设置访问的URL
    NSURL *url = [NSURL URLWithString:@"http://baidu.com"];
    
    // 根据URL创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // WKWebView加载请求
    [self.webView loadRequest:request];
    self.webView.allowsBackForwardNavigationGestures = YES;
    // 将WKWebView添加到视图
    [_webView addObserver:self
               forKeyPath:NSStringFromSelector(@selector(estimatedProgress))
                  options:0
                  context:nil];
}


#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    
    NSLog(@"didStartProvisionalNavigation");
    
    //开始加载的时候，让进度条显示
    self.progressView.hidden = NO;
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    
    NSLog(@"didCommitNavigation");
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
    NSLog(@"didFinishNavigation");
    
}

- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures
{
    NSLog(@"createWebViewWithConfiguration %@ %@", navigationAction, windowFeatures);
    if (!navigationAction.targetFrame.isMainFrame) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        [(WKWebView *)_webView loadRequest:navigationAction.request];
    }
    return nil;
}


- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    [self handleError:error];
}
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    [self handleError:error];
}

- (void)handleError:(NSError *)error {
    NSLog(@"%@", error);
}

#pragma mark - KVO
//kvo 监听进度
-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                      context:(void *)context{
    
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(estimatedProgress))]
        && object == self.webView) {
        [self.progressView setAlpha:1.0f];
        DLog(@"%lf", self.progressView.progress);
        BOOL animated = self.webView.estimatedProgress > self.progressView.progress;
        [self.progressView setProgress:self.webView.estimatedProgress
                              animated:animated];
        
        if (self.webView.estimatedProgress >= 1.0f) {
            [UIView animateWithDuration:0.3f
                                  delay:0.3f
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 [self.progressView setAlpha:0.0f];
                             }
                             completion:^(BOOL finished) {
                                 [self.progressView setProgress:0.0f animated:NO];
                             }];
        }
    }else{
        [super observeValueForKeyPath:keyPath
                             ofObject:object
                               change:change
                              context:context];
    }
}
- (UIProgressView *)progressView {
    if (!_progressView) {
        UIProgressView *progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        progressView.frame = CGRectMake(0, IS_IPhoneX ? 84 : 64, [UIScreen mainScreen].bounds.size.width, 2);
        
        [progressView setTrackTintColor:[UIColor clearColor]];
        progressView.progressTintColor = [UIColor blueColor];
        
        _progressView = progressView;
    }
    return _progressView;
}

@end
