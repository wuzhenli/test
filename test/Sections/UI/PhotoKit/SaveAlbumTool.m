//
//  SaveAlbumTool.m
//  test
//
//  Created by li’Pro on 2018/11/15.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "SaveAlbumTool.h"

/*
 PHAuthorizationStatusNotDetermined = 0, // User has not yet made a choice with regards to this application
 PHAuthorizationStatusRestricted,  1      // This application is not authorized to access photo data.
 // The user cannot change this application’s status, possibly due to active restrictions
 //   such as parental controls being in place.
 PHAuthorizationStatusDenied,   2         // User has explicitly denied this application access to photos data.
 PHAuthorizationStatusAuthorized    3   
 */

@implementation SaveAlbumTool

+ (void)checkAlbumAuthorizationCompletion:(void(^)(BOOL granted))completion {
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        NSLog(@"PHAuthorizationStatus:%ld", status);
        //回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            switch (status) {
                case PHAuthorizationStatusRestricted:
                case PHAuthorizationStatusDenied:
                    !completion ? : completion(NO);
                    break;
                case PHAuthorizationStatusAuthorized:
                    !completion ? : completion(YES);
                    break;
                case PHAuthorizationStatusNotDetermined:
                    break;
            }
        });
    }];
}

/**
 * 同步方式保存图片到系统的相机胶卷中,返回的是当前保存成功后相册图片对象集合
 * 保存失败返回 nil
 */
+ (PHFetchResult<PHAsset *> *)syncSaveImage:(UIImage *)image {
    //--1 创建 ID 这个参数可以获取到图片保存后的 asset对象
    __block NSString *createdAssetID = nil;
    //--2 保存图片
    NSError *error = nil;
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        //----block 执行的时候还没有保存成功--获取占位图片的 id，通过 id 获取图片---同步
        createdAssetID = [PHAssetChangeRequest          creationRequestForAssetFromImage:image].placeholderForCreatedAsset.localIdentifier;
    } error:&error];
    
    //--3 如果失败，则返回空
    if (error) {
        return nil;
    }
    //--4 成功后，返回对象
    //获取保存到系统相册成功后的 asset 对象集合，并返回
    PHFetchResult<PHAsset *> *assets = [PHAsset fetchAssetsWithLocalIdentifiers:@[createdAssetID] options:nil];
    return assets;
}

+ (void)alertNoAuthorizationTip {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // app名称
    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    
    NSString *msg = [NSString stringWithFormat:@"请在iPhone的“设置-隐私-照片”选项中，允许%@访问你的照片。", app_Name];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"无法保存" message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        ;
    }]];
    
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (rootVC.presentedViewController) {
        rootVC = rootVC.presentedViewController;
    }
    [rootVC presentViewController:alert animated:YES completion:nil];
}

/**将图片保存到自定义相册中*/
+ (BOOL)saveImage:(UIImage *)image toAblumName:(NSString *)name {
    //1 将图片保存到系统的【相机胶卷】中---调用刚才的方法
    PHFetchResult<PHAsset *> *assets = [self syncSaveImage:image];
    if (assets == nil) {
        return NO;
    }
    //2 拥有自定义相册（与 APP 同名，如果没有则创建）--调用刚才的方法
    PHAssetCollection *assetCollection = [self getAssetCollectionWithAppNameAndCreateIfNotExists:name];
    if (assetCollection == nil) {
        return NO;
    }
    //3 将刚才保存到相机胶卷的图片添加到自定义相册中 --- 保存带自定义相册--属于增的操作，需要在PHPhotoLibrary的block中进行
    NSError *error = nil;
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        //--告诉系统，要操作哪个相册
        PHAssetCollectionChangeRequest *collectionChangeRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:assetCollection];
        //--添加图片到自定义相册--追加--就不能成为封面了
        //--[collectionChangeRequest addAssets:assets];
        //--插入图片到自定义相册--插入--可以成为封面
        [collectionChangeRequest insertAssets:assets atIndexes:[NSIndexSet indexSetWithIndex:0]];
        NSLog(@"-----in save album block");
    } error:&error];
    NSLog(@"after save block");
    if (error) {
        return NO;
    }
    return YES;
}

/**
 * 获取 APP 同名的自定义相册,如果没有则创建
 * 创建失败返回 nil 
 */
+ (PHAssetCollection *)getAssetCollectionWithAppNameAndCreateIfNotExists:(NSString *)name {
    //2 获取与 APP 同名的自定义相册
    PHFetchResult<PHAssetCollection *> *collections = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil]; 
    for (PHAssetCollection *collection in collections) { //遍历
        if ([collection.localizedTitle isEqualToString:name]) {
            //找到了同名的自定义相册--返回
            return collection;
        }
    }
    
    //说明没有找到，需要创建
    NSError *error = nil;
    __block NSString *createID = nil; //用来获取创建好的相册
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        //发起了创建新相册的请求，并拿到ID，当前并没有创建成功，待创建成功后，通过 ID 来获取创建好的自定义相册
        PHAssetCollectionChangeRequest *request = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:name];
        createID = request.placeholderForCreatedAssetCollection.localIdentifier;
    } error:&error];
    if (error) {
        return nil;
    }else{
        //通过 ID 获取创建完成的相册 -- 是一个数组
        return [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:@[createID] options:nil].firstObject;
    }
    
}

@end
