//
//  StaticRowModel.h
//  test
//
//  Created by li’Pro on 2018/11/22.
//  Copyright © 2018 wzl. All rights reserved.
//

#import <Foundation/Foundation.h>
@class StaticSwitchTableViewCell;

typedef NS_ENUM(NSUInteger, EnumStaticRowType) {
    EnumStaticRowTopic,
    EnumStaticRowReply,
    EnumStaticRowOpinion,
};

NS_ASSUME_NONNULL_BEGIN

@interface StaticRowModel : NSObject

+ (instancetype)staticRowModelWithType:(EnumStaticRowType)type ;

- (void)setCellClass:(Class)cls ;
@property (strong, nonatomic) StaticSwitchTableViewCell *cell;

@property (assign, nonatomic) EnumStaticRowType type;

@property (assign, nonatomic) CGFloat rowHeight;

@end

NS_ASSUME_NONNULL_END
