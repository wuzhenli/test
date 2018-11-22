//
//  StaticRowModel.m
//  test
//
//  Created by li’Pro on 2018/11/22.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "StaticRowModel.h"
#import "StaticSwitchTableViewCell.h"

@interface StaticRowModel () <StaticSwitchTableViewCellDelegate>

@end

@implementation StaticRowModel

+ (instancetype)staticRowModelWithType:(EnumStaticRowType)type {
    StaticRowModel *model = [StaticRowModel new];
    model.type = type;
    return model;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.rowHeight = 49;
    }
    return self;
}

- (void)setCellClass:(Class)cls {
    self.cell = [[cls alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    self.cell.delegate = self;
    [self adjustCellSubViewWithType:self.type];
}

- (void)adjustCellSubViewWithType:(EnumStaticRowType)type {
    switch (type) {
        case EnumStaticRowReply: {
            self.cell.lblDesc.hidden = NO;
            self.cell.switchRight.hidden = YES;
            break;
        }
        case EnumStaticRowTopic: {
            self.cell.lblDesc.hidden = YES;
            self.cell.switchRight.hidden = NO;
            break;
        }
        case EnumStaticRowOpinion: {
            self.cell.lblDesc.hidden = YES;
            self.cell.switchRight.hidden = NO;
            break;
        }
    }
}

#pragma -mark StaticSwitchTableViewCellDelegate

- (void)cellSwitchRightValueChanged:(UISwitch *)sender {
    
}



@end
