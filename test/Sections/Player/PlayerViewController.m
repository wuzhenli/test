//
//  PlayerViewController.m
//  test
//
//  Created by li’Pro on 2018/5/31.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "PlayerViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface PlayerViewController ()
@property (strong, nonatomic) AVPlayer *player;
@property (strong, nonatomic) AVPlayerLayer *playerLayer;
@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    self.playerLayer.frame = CGRectMake(0, 90, 300, 500);
    self.playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:self.playerLayer];
    [self.player play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark 
#pragma -mark getter
- (AVPlayer *)player {
    if (!_player) {
        NSString *strUrl = @"http://static.youku.com/v20170518.0/v/swf/upsplayer/loader.swf?VideoIDS=XMzYzNjEzNzQ3Ng%3D%3D&embedid=NDIuNjIuMjguMTA4AjkwOTAzNDM2OQIC&wd=&winType=BDskin&cna=VS5kE%2BtC5jgCASo%2BHGwSyHgg&partnerid=7886e2a3f706e67d&vext=pid%253D7886e2a3f706e67d%2526emb%253DNDIuNjIuMjguMTA4AjkwOTAzNDM2OQIC%2526bc%253D%2526cna%253DVS5kE%2BtC5jgCASo%2BHGwSyHgg%2526vvlogext%253Dpc_i%25253D1524449398945Gc5%252526pc_u%25253D-%252526rvpvid%25253D-%252526rycid%25253D-%252526yvft%25253D1526637503000%252526vsidc%25253D1%252526seid%25253D1527559767478k0A%252526vstp%25253D70%252526svstp%25253D73%2526type%253D0%2526embsig%253D1_1527737508_0c1e4af36fc8fc7942fa0318118aeff0";
//        NSString *strUrl = @"http://1256784423.vod2.myqcloud.com/1c3ce909vodgzp1256784423/73a283317447398156355243349/EDhnyo1wwzwA.mp4";
        NSString *path = [[NSBundle mainBundle] pathForResource:@"preview_2.mov" ofType:nil];
        NSURL *urlLocal = [NSURL fileURLWithPath:path];
        NSURL *url = [NSURL URLWithString:strUrl];
        AVPlayerItem *item = [[AVPlayerItem alloc] initWithURL:url];
        _player = [[AVPlayer  alloc] initWithPlayerItem:item];
    }
    return _player;
}

@end









