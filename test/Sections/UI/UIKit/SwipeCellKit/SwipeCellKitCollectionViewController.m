//
//  SwipeCellKitCollectionViewController.m
//  test
//
//  Created by li’Pro on 2018/11/26.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "SwipeCellKitCollectionViewController.h"
#import "test-Swift.h"


@interface SwipeCellKitCollectionViewController ()<
    UICollectionViewDelegate, 
    UICollectionViewDataSource,
    SliderCollectionViewCellDelegate
    //SwipeCollectionViewCellDelegate
>
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (assign, nonatomic) NSUInteger rowNum;

@end

@implementation SwipeCellKitCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.rowNum = 12;
    self.flowLayout.itemSize = CGSizeMake(SCREEN_Width, 59);
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.minimumInteritemSpacing = 0;
    
    [self.collectionView registerClass:[SliderCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([SliderCollectionViewCell class])];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

#pragma -mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.rowNum;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SliderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SliderCollectionViewCell class]) forIndexPath:indexPath];
    
    cell.lblTitle.text = [NSString stringWithFormat:@"%ld - %ld", indexPath.section, indexPath.item];
    cell.cellDelegate = self;
    cell.contentView.backgroundColor = collectionView.backgroundColor;
    return cell;
}

#pragma -mark SliderCollectionViewCellDelegate

- (void)flagActionOfCellWithCell:(SliderCollectionViewCell *)cell {
    NSLog(@"%s", __func__);
}

- (void)deleteActionOfCellWithCell:(SliderCollectionViewCell *)cell {
    NSLog(@"%s", __func__);
//    self.rowNum --;
    [self.collectionView reloadData];
}



@end
