//
//  TestHeightModel.h
//  test
//
//  Created by li’Pro on 2019/1/3.
//  Copyright © 2019 wzl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, EnumModelType) {
    EnumModelTypeAuto,
    EnumModelTypeCalculate
};

@interface TestHeightModel : NSObject

@property (assign, nonatomic) EnumModelType type;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *text;

@end

NS_ASSUME_NONNULL_END
