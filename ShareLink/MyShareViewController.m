//
//  MyShareViewController.m
//  ShareLink
//
//  Created by li’Pro on 2018/12/28.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "MyShareViewController.h"

@interface MyShareViewController ()

@end

@implementation MyShareViewController

- (BOOL)isContentValid {
    return YES;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *btn = [[UIButton alloc] init];
    [btn addTarget:self action:@selector(btnCloseClicked) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"Close" forState:UIControlStateNormal];
//    btn.backgroundColor = [UIColor lightGrayColor];
    btn.frame = CGRectMake(10, 20, 44, 44);
    [self.view addSubview:btn];
    
    {
        UIButton *btn = [[UIButton alloc] init];
        [btn addTarget:self action:@selector(btnPostClicked) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = [UIColor lightGrayColor];
        btn.frame = CGRectMake(20, 100, 100, 44);
        [btn setTitle:@"POST" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.view addSubview:btn];
    }
}

- (void)btnCloseClicked {
    [self.extensionContext completeRequestReturningItems:@[] completionHandler:nil];
}
    

- (void)btnPostClicked {
    //加载动画初始化
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicatorView.frame = CGRectMake((self.view.frame.size.width - activityIndicatorView.frame.size.width) / 2,
                                             (self.view.frame.size.height - activityIndicatorView.frame.size.height) / 2,
                                             activityIndicatorView.frame.size.width,
                                             activityIndicatorView.frame.size.height);
    activityIndicatorView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:activityIndicatorView];
    
    //激活加载动画
    [activityIndicatorView startAnimating];
    
    __weak MyShareViewController *theController = self;
    __block BOOL hasExistsUrl = NO;
    [self.extensionContext.inputItems enumerateObjectsUsingBlock:^(NSExtensionItem * _Nonnull extItem, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [extItem.attachments enumerateObjectsUsingBlock:^(NSItemProvider * _Nonnull itemProvider, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if ([itemProvider hasItemConformingToTypeIdentifier:@"public.url"])
            {
                [itemProvider loadItemForTypeIdentifier:@"public.url"
                                                options:nil
                                      completionHandler:^(id<NSSecureCoding>  _Nullable item, NSError * _Null_unspecified error) {
                                          
                                          if ([(NSObject *)item isKindOfClass:[NSURL class]])
                                          {
                                              NSLog(@"分享的URL = %@", item);
                                              NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.www.jaly.www.test"];
                                              [userDefaults setValue:((NSURL *)item).absoluteString forKey:@"share-url"];
                                              //用于标记是新的分享
                                              [userDefaults setBool:YES forKey:@"has-new-share"];
                                              
                                              [activityIndicatorView stopAnimating];
                                              [theController.extensionContext completeRequestReturningItems:@[extItem] completionHandler:nil];
                                          }
                                          
                                      }];
                
                hasExistsUrl = YES;
                *stop = YES;
            }
            
        }];
        
        if (hasExistsUrl)
        {
            *stop = YES;
        }
        
    }];
    
    if (!hasExistsUrl)
    {
        //直接退出
        [self.extensionContext completeRequestReturningItems:@[] completionHandler:nil];
    } else {
        UIResponder *responder = self;
        while (responder)
        {
            if ([responder respondsToSelector:@selector(openURL:)])
            {
                [responder performSelector:@selector(openURL:) withObject:[NSURL URLWithString:@"BBS://"]];
                break;
            }
            responder = [responder nextResponder];
        }
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
