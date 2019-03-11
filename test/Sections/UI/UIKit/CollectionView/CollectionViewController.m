//
//  CollectionViewController.m
//  test
//
//  Created by li’Pro on 2018/5/10.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "CollectionViewController.h"
#import "TestCollectionViewCell.h"


NSString *const Identifier = @"mycell_id";
@interface CollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) UICollectionView *collectionView;
@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Identifier forIndexPath:indexPath];
    cell.lblText.text = [NSString stringWithFormat:@"%ld - %ld", indexPath.section, indexPath.row];
    cell.contentView.backgroundColor = [UIColor greenColor];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return self.themeLayout.itemSizeOfImage;
    NSUInteger columns = 4;
    CGFloat margin = 4;
    
    CGFloat SC_W = [UIScreen mainScreen].bounds.size.width;
    CGFloat itemW = (SC_W - (columns+1) * margin) / columns;
    itemW = (NSUInteger)(itemW * 1000) / 1000.f;
    CGSize itemSize = CGSizeMake(itemW, itemW);
    return itemSize;
}
#pragma -mark getter
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        NSUInteger columns = 4;
        CGFloat margin = 4;
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//        layout.minimumLineSpacing = margin;
        layout.minimumInteritemSpacing = margin;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
//        CGFloat SC_W = [UIScreen mainScreen].bounds.size.width;
//        CGFloat itemW = (SC_W - (columns+1) * margin) / columns;
//        itemW = (NSUInteger)(itemW * 1000) / 1000.f;
//        layout.itemSize = CGSizeMake(itemW, itemW);
        
        CGRect frame = [UIScreen mainScreen].bounds;
        frame.origin.y = 0;
        frame.size.height = [UIScreen mainScreen].bounds.size.height;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor lightGrayColor];;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.contentInset = UIEdgeInsetsMake(margin, 0, 0, 0);
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([TestCollectionViewCell class]) bundle:[NSBundle mainBundle]];
        [_collectionView registerNib:nib forCellWithReuseIdentifier:Identifier];
    }
    return _collectionView;
}

@end
