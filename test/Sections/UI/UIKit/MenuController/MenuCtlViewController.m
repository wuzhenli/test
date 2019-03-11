//
//  MenuCtlViewController.m
//  test
//
//  Created by li’Pro on 2018/7/11.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "MenuCtlViewController.h"
#import "MCTextView.h"

@interface MenuCtlViewController ()

@property (strong, nonatomic) MCTextView *textView;
@property (strong, nonatomic) UIButton *btn;

@end

@implementation MenuCtlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _textView = [[MCTextView alloc] initWithFrame:CGRectMake(40, 90, 220, 100)];
    _textView.text = @"Do any additional setup after loading the view.";
    _textView.font = [UIFont systemFontOfSize:15];
    _textView.editable = NO;
    [self.view addSubview:_textView];
    
    self.btn.frame = CGRectMake(100, 400, 100, 45);
    [self.view addSubview:self.btn];
}

- (void)btnClicked {
    [_textView showMenuController];
}

- (UIButton *)btn {
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.backgroundColor = [UIColor greenColor];
        [_btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}



@end
















