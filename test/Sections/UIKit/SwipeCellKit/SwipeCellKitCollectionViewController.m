//
//  SwipeCellKitCollectionViewController.m
//  test
//
//  Created by li’Pro on 2018/11/26.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "SwipeCellKitCollectionViewController.h"
#import "SwipeCellKitCollectionViewCell.h"


@interface SwipeCellKitCollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation SwipeCellKitCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.flowLayout.itemSize = CGSizeMake(SCREEN_Width, 80);
    
    
    UINib *nib = [UINib nibWithNibName:@"SwipeCellKitCollectionViewCell" bundle:nil];
    
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:NSStringFromClass([SwipeCellKitCollectionViewCell class])];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

#pragma -mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 12;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SwipeCellKitCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SwipeCellKitCollectionViewCell class]) forIndexPath:indexPath];
    
    cell.lblTitle.text = [NSString stringWithFormat:@"%ld - %ld", indexPath.section, indexPath.item];
    
    return cell;
}

@end
