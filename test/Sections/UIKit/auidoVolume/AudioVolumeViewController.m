//
//  AudioVolumeViewController.m
//  test
//
//  Created by li’Pro on 2018/9/13.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "AudioVolumeViewController.h"
#import "VolumeView.h"


@interface AudioVolumeViewController ()

@property (strong, nonatomic) VolumeView *volumeView;

@end

@implementation AudioVolumeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _volumeView = [[VolumeView alloc] initWithFrame:CGRectMake(0, 100, 322, 6)];
    [self.view addSubview:_volumeView];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    double v = arc4random_uniform(10) / 10.f;
    NSLog(@"%lf", v);
    self.volumeView.volume = v;
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

