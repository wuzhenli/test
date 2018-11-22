//
//  StaticTableVCModel.h
//  test
//
//  Created by li’Pro on 2018/11/22.
//  Copyright © 2018 wzl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StaticSecionModel.h"

#import "StaticSwitchTableViewCell.h"


NS_ASSUME_NONNULL_BEGIN

@interface StaticTableVCModel : NSObject

@property (strong, nonatomic) NSMutableArray<StaticSecionModel *> *arrSectionModel;

- (void)registerCellUseTableView:(UITableView *)tableView ;

- (void)setDataWithDictionary:(NSDictionary *)dic ;

@end

NS_ASSUME_NONNULL_END
