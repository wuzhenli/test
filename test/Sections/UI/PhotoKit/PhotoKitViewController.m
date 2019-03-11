//
//  PhotoKitViewController.m
//  test
//
//  Created by li’Pro on 2018/1/11.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "PhotoKitViewController.h"
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "SaveAlbumTool.h"


@interface PhotoKitViewController ()

@end

@implementation PhotoKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveImageToAlbum:(id)sender {
    UIImage *img = [UIImage imageNamed:@"reward_icon_price_rate"];
    
//    [self save:img];
    [SaveAlbumTool checkAlbumAuthorizationCompletion:^(BOOL granted) {
        if (granted) {
            [SaveAlbumTool saveImage:img toAblumName:@"testAlbum"];
        } else {
            [BBSProgressHUD showToView:self.view text:@"没有相册权限"];
        }
    }];
}




-(void)saveImage:(UIImage *)img {
    
    //(1) 获取当前的授权状态
    PHAuthorizationStatus lastStatus = [PHPhotoLibrary authorizationStatus];
    //(2) 请求授权
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        //回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            if(status == PHAuthorizationStatusDenied)  {
                if (lastStatus == PHAuthorizationStatusNotDetermined) {
                    return;
                }
            }
            else if(status == PHAuthorizationStatusAuthorized) {
                //保存图片---调用上面封装的方法
//                [self syncSaveImageWithPhoto:img];
                // [self saveImageToCustomAblum:img];
            }
            else if (status == PHAuthorizationStatusRestricted) {
                [BBSProgressHUD showToView:self.view text:@"没有相册访问权限"];
            }
        });
    }];
}


@end
