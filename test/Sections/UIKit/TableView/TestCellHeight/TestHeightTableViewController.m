//
//  TestHeightTableViewController.m
//  test
//
//  Created by li’Pro on 2019/1/3.
//  Copyright © 2019 wzl. All rights reserved.
//

#import "TestHeightTableViewController.h"
#import "AutoHeightTableViewCell.h"
#import "TestHeightModel.h"


@interface TestHeightTableViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray<TestHeightModel *> *arrModel;

@end

@implementation TestHeightTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 50;
    [self.tableView registerNib:[UINib nibWithNibName:@"AutoHeightTableViewCell" bundle:nil] forCellReuseIdentifier:@"AutoHeightTableViewCell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}


#pragma -mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrModel.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestHeightModel *model = self.arrModel[indexPath.row];
    if (model.type == EnumModelTypeAuto) {
        AutoHeightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AutoHeightTableViewCell" forIndexPath:indexPath];
        cell.lblTitle.text = model.title;
        cell.lblDesc.text = model.text;
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.text = model.title;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestHeightModel *model = self.arrModel[indexPath.row];
    if (model.type == EnumModelTypeAuto) {
        return UITableViewAutomaticDimension;
    } else {
        return 50;
    }
}


- (NSMutableArray<TestHeightModel *> *)arrModel {
    if (!_arrModel) {
        NSMutableArray<TestHeightModel *> *arr = @[].mutableCopy;
        for (int i = 0; i<12; i++) {
            TestHeightModel *m = [TestHeightModel new];
            m.type = i % 2;
            m.title = [NSString stringWithFormat:@"this is title %d", i];
            m.text = [NSString stringWithFormat:@"this is text %d", i];
            if (i % 3 == 0) {
                m.text = [NSString stringWithFormat:@"this isDo any additional setup after loading the view from its nib. text %d", i];
            }
            [arr addObject:m];
            
            
        }
        {
            TestHeightModel *m = [TestHeightModel new];
            m.type = EnumModelTypeAuto;
            m.title = [NSString stringWithFormat:@"习近平擘画推进祖国和平统一进程路线图"];
            m.text = [NSString stringWithFormat:@"学习进行时】1月2日，习近平出席《告台湾同胞书》发表40周年纪念会并发表重要讲话。在讲话中，习近平回顾历史、着力当下、瞩目未来，为推动两岸关系和平发展、推进祖国和平统一进程提出了五点主张。如何理解这五点主张？新华社《学习进行时》原创品牌栏目“讲习所”今天推出文章，为您解读。 海峡两岸分隔已届70年。台湾问题的产生和演变同近代以来中华民族命运休戚相关。”习近平开篇两句话，饱含了70年的沧桑。"];
            [arr addObject:m];
        }
        {
            TestHeightModel *m = [TestHeightModel new];
            m.type = EnumModelTypeAuto;
            m.title = [NSString stringWithFormat:@"推进祖国和平统一进程的重大宣示"];
            m.text = @"五项重大主张系统阐释了实现国家统一的目标内涵、基本方针、路径模式，指明了今后一个时期对台工作的基本思路、重点任务和前进方向，既有原则的坚定性又有极强的针对性和极大的包容性，展现了非凡的政治勇气和政治智慧.";
            [arr addObject:m];
        }
        _arrModel = arr;
    }
    return _arrModel;
}

@end
