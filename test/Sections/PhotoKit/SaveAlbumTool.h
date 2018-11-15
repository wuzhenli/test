//
//  SaveAlbumTool.h
//  test
//
//  Created by li’Pro on 2018/11/15.
//  Copyright © 2018 wzl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

@interface SaveAlbumTool : NSObject

+ (void)checkAlbumAuthorizationCompletion:(void(^)(BOOL granted))completion ;

+ (void)alertNoAuthorizationTip ;

/**
 * 同步方式保存图片到系统的相机胶卷中,返回的是当前保存成功后相册图片对象集合
 * 保存失败返回 nil
 */
+ (PHFetchResult<PHAsset *> *)syncSaveImage:(UIImage *)image ;

/**将图片保存到自定义相册中*/
+ (BOOL)saveImage:(UIImage *)image toAblumName:(NSString *)name ;

/**
 * 获取 APP 同名的自定义相册,如果没有则创建
 * 创建失败返回 nil 
 */
+ (PHAssetCollection *)getAssetCollectionWithAppNameAndCreateIfNotExists:(NSString *)name ;

@end

NS_ASSUME_NONNULL_END
