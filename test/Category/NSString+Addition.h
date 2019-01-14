//
//  NSString+Addition.h
//  test
//
//  Created by li’Pro on 2019/1/14.
//  Copyright © 2019 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Addition)

- (CGFloat)textWidthWithFont:(UIFont *)font height:(CGFloat)height ;

- (CGFloat)textHeightWithFont:(UIFont *)font width:(CGFloat)width ;

- (NSString *)adt_md5 ;

- (BOOL)adt_isPhoneNum ; 

@end

NS_ASSUME_NONNULL_END
