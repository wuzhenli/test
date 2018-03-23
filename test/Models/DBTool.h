//
//  DBTool.h
//  test
//
//  Created by li’Pro on 2018/3/22.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DBTool : NSObject
- (void)addObj:(NSString *)obj key:(NSString *)key ;
- (void)removeObj:(NSString *)obj key:(NSString *)key ;
- (NSMutableDictionary *)allValue ;
- (void)show ;
@end
