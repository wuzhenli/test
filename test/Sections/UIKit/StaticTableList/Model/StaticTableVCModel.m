//
//  StaticTableVCModel.m
//  test
//
//  Created by li’Pro on 2018/11/22.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "StaticTableVCModel.h"

@implementation StaticTableVCModel

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)registerCellUseTableView:(UITableView *)tableView {
    [tableView registerClass:[StaticSwitchTableViewCell class] forCellReuseIdentifier:NSStringFromClass([StaticSwitchTableViewCell class])];
}

- (void)setDataWithDictionary:(NSDictionary *)dic {
    
    StaticSecionModel *section = [StaticSecionModel new];
    {
        StaticRowModel *row = [StaticRowModel staticRowModelWithType:EnumStaticRowTopic];
        [row setCellClass:[StaticSwitchTableViewCell class]];
        row.cell.lblTitle.text = @"话题";
        row.cell.switchRight.on = [[dic objectForKey:@"topic"] boolValue];
        [section.arrRowModel addObject:row];
    } {
        StaticRowModel *row = [StaticRowModel staticRowModelWithType:EnumStaticRowReply];
        [row setCellClass:[StaticSwitchTableViewCell class]];
        row.cell.lblTitle.text = @"回复";
        row.cell.switchRight.on = [[dic objectForKey:@"reply"] boolValue];
        [section.arrRowModel addObject:row];
    } {
        StaticRowModel *row = [StaticRowModel staticRowModelWithType:EnumStaticRowOpinion];
        [row setCellClass:[StaticSwitchTableViewCell class]];
        row.cell.lblTitle.text = @"观点";
        row.cell.switchRight.on = [[dic objectForKey:@"opinion"] boolValue];
        [section.arrRowModel addObject:row];
    }
    [self.arrSectionModel addObject:section];
}

#pragma -mark getter

- (NSMutableArray<StaticSecionModel *> *)arrSectionModel {
    if (!_arrSectionModel) {
        _arrSectionModel = @[].mutableCopy;
    }
    return _arrSectionModel;
}

@end
