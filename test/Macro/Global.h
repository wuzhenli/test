//
//  Global.h
//  test
//
//  Created by li’s Air on 2018/6/30.
//  Copyright © 2018年 wzl. All rights reserved.
//

#ifndef Global_h
#define Global_h


#define SCREEN_Width [UIScreen mainScreen].bounds.size.width
#define SCREEN_Height [UIScreen mainScreen].bounds.size.height
#define IS_IPhoneX (812 == [UIScreen mainScreen].bounds.size.height)



#define COLOR(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.f]
#define RandomColor COLOR(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))




#endif /* Global_h */
