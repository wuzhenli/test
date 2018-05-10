//
//  ViewController.m
//  test
//
//  Created by li’Pro on 2017/9/26.
//  Copyright © 2017年 wzl. All rights reserved.
//

#import "ViewController.h"
#import "KeyWinViewController.h"
#import "JLGradientButton.h"
#import "IMBoard.h"
#import "GestureViewController.h"
#import "APIViewController.h"
#import "SlideViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import <math.h>
#import "DBTool.h"
#import "SafeArrayTool.h"
#import "JLPresentAnimation.h"
#import "JLAnimationPresentationController.h"

#define Dispatch_Safe_Main(block) \
if ([NSThread isMainThread]) { \
block(); \
} else { \
dispatch_async(dispatch_get_main_queue(), block); \
}


@interface ViewController ()

@property (weak, nonatomic) IBOutlet JLGradientButton *btnGradient;
@property (weak, nonatomic) IBOutlet UILabel *lblTest;
@property (weak, nonatomic) IBOutlet UIView *viewRed;

@property (strong, nonatomic) DBTool *dbTool;
@property (strong, nonatomic) SafeArrayTool *arrTool;

@property (strong, nonatomic) IMBoard *imBoard;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.viewRed.frame = CGRectMake(0, 0, 100, 100);
    self.viewRed.layer.delegate = nil;
   
   
    [self testUrl];
}
- (void)testUrl {
    NSString *str = @"http://provider.test.6rooms.net/upload/bbs_thread/20180428/10066/src/20180428172833_KGWS9FtYlJtTq2Fehew6.jpg?width=326&height=482";
    NSURL *url = [NSURL URLWithString:str];
    NSString *query = url.query;
    
    
}

- (void)testSendText {
    NSRange range = NSMakeRange(7, 8);
    // {6, 4}  {13, 4}
    NSString *text = @"进入巨大打卡@我试试 搭建@孙悟空";
    
    NSArray<NSString *> *arrNames = @[@"我试试", @"孙悟空"];
    NSString *pattern = [arrNames componentsJoinedByString:@"|@"];
    pattern = [NSString stringWithFormat:@"@%@", pattern];
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:pattern options:kNilOptions error:nil];
    
    NSArray<NSTextCheckingResult *> *result = [regular matchesInString:text options:kNilOptions range:NSMakeRange(0, text.length)];
    [result enumerateObjectsUsingBlock:^(NSTextCheckingResult * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (NSLocationInRange(range.location, obj.range )) {
            NSLog(@" in range:%@", NSStringFromRange(obj.range));
        }
        
    }];
}

- (void)testShowingText {
    // /\#s([\s\S]+?,[0-9]+?)\#e/im
    NSString *text = @"可以at了#s药不,能停,20024#e#s沙悟净,20014#e今天你吃饭了吗#s杨赛,40017#e, 还有#s李强,40029#e";
    NSMutableString *showText = [[NSMutableString alloc] initWithString:text];
    
    NSString *pattern = @"#s([\\s\\S]+?,[0-9]+?)#e";
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:pattern options:kNilOptions error:nil];
    NSArray<NSTextCheckingResult *> *arr = [regular matchesInString:text options:kNilOptions range:NSMakeRange(0, text.length)];
    [arr enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(NSTextCheckingResult * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *atString = [text substringWithRange:NSMakeRange(obj.range.location + 2, obj.range.length-4)];
        
        NSArray<NSString *> *arrNameId = [atString componentsSeparatedByString:@","];
        NSString *name = [atString substringToIndex:(atString.length - 1 - arrNameId.lastObject.length)];
        NSString *uId = [arrNameId lastObject];
        NSLog(@"name:%@| id:%@|", name, uId);
        
        NSString *replaceName = [NSString stringWithFormat:@"@%@ ", name];
        [showText replaceCharactersInRange:obj.range withString:replaceName];
    }];
    NSLog(@"%@", showText);
}




- (IBAction)viewRedTaped:(id)sender {
 
    Class c = NSClassFromString(@"CollectionViewController");
    UIViewController *vc = [[c alloc] init];
    
    
//    JLAnimationPresentationController *presentationController = [[JLAnimationPresentationController alloc] initWithPresentedViewController:vc presentingViewController:self];
//    vc.transitioningDelegate = presentationController;
    
    [self presentViewController:vc animated:YES completion:nil];
    
}

/*
 iPhone 6s
 2017-11-10 10:30:49.604782+0800 test[8176:97697] nativeBounds:{{0, 0}, {750, 1334}}
 2017-11-10 10:30:49.605277+0800 test[8176:97697] nativeScale:2.000000   scale:2.000000
 2017-11-10 10:30:49.605412+0800 test[8176:97697] bounds:{{0, 0}, {375, 667}}
 iPhone 6s Plus
 2017-11-10 10:31:30.123601+0800 test[8407:102365] nativeBounds:{{0, 0}, {1242, 2208}}
 2017-11-10 10:31:30.123857+0800 test[8407:102365] nativeScale:3.000000   scale:3.000000
 2017-11-10 10:31:30.124060+0800 test[8407:102365] bounds:{{0, 0}, {414, 736}}

 */
- (IBAction)btnClicked_1:(JLGradientButton *)sender {
    self.viewRed.transform = CGAffineTransformMakeScale(2, 2);
}

- (IBAction)btnClicked_2:(id)sender {
    self.viewRed.transform = CGAffineTransformIdentity;
}

- (IBAction)btnClicked_3:(UIButton *)sender {
    NSLog(@"frame:%@", NSStringFromCGRect(self.viewRed.frame));
    NSLog(@"bounds:%@", NSStringFromCGRect(self.viewRed.bounds));
}
- (void)test {

}
#pragma -mark 
#pragma -mark goto VC
- (void)gotoPhotoKitVC {
    Class c = NSClassFromString(@"PhotoKitViewController");
    UIViewController *vc = [[c alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)gotoAPIVC {
    APIViewController *vc = [[APIViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma -mark 
#pragma -mark getter


- (IMBoard *)imBoard {
    if (!_imBoard) {
        _imBoard = [IMBoard new];
    }
    return _imBoard;
}

@end

























