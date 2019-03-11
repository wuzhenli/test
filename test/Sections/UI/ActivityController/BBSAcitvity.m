//
//  BBSAcitvity.m
//  test
//
//  Created by li’Pro on 2018/12/28.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "BBSAcitvity.h"

NSString *const UIActivityTypeZSCustomMine = @"BBSCustomActivityMine";

@implementation BBSAcitvity

- (NSString *)activityType {
    return UIActivityTypeZSCustomMine;
}

- (nullable NSString *)activityTitle {
    return @"TestApp";
}

- (nullable UIImage *)activityImage {
    return [UIImage imageNamed:@"icon_60"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    return YES;
}
- (void)prepareWithActivityItems:(NSArray *)activityItems {
    
}
+ (UIActivityCategory)activityCategory {
    return UIActivityCategoryShare;
}

- (void)performActivity {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"BBS" message:@"define activity" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        ;
    }]];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:^{
        ;
    }];
}


@end
