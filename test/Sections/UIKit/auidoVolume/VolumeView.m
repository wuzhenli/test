//
//  VolumeView.m
//  test
//
//  Created by li’Pro on 2018/9/13.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "VolumeView.h"

@interface VolumeView ()
@property (weak, nonatomic) CAShapeLayer *shapeLayer;
@end


@implementation VolumeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
    self.backgroundColor = [UIColor lightGrayColor];
    self.image = [UIImage imageNamed:@"send_theme_bg_volume_wave"];
    
    UIBezierPath *backgroudPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, self.frame.size.width * 0.8, self.frame.size.height)];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = [backgroudPath CGPath];
    self.shapeLayer = layer;
    //    [self.layer addSublayer:layer];
    
    
    //遮罩
    //    UIBezierPath *imgPath = [UIBezierPath bezierPathWithRect:self.bounds];
    //    CAShapeLayer *imgLayer = [CAShapeLayer layer];
    //    imgLayer.path = imgPath.CGPath;
    //    self.layer.contents = 
    self.layer.mask = self.shapeLayer;
}

- (void)setVolume:(double)volume {
    if (volume < 0 || volume > 1) {
        return;
    }
    
    
}

@end
