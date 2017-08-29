//
//  MDFlipCollectionView.m
//  MDMultipleSegment
//
//  Created by 梁宪松 on 2017/8/29.
//  Copyright © 2017年 Madao. All rights reserved.
//

#import "MDFlipCollectionView.h"

@interface MDFlipCollectionView()<UICollectionViewDelegate,
                                  UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation MDFlipCollectionView


-(instancetype)initWithFrame:(CGRect)frame withArray:(NSArray <UIViewController *>*)contentArray
{
    self = [super initWithFrame:frame];
    if (self) {
        _dataArray = [NSMutableArray arrayWithArray:contentArray];
        [self addSubview:self.collectionView];
        self.collectionView.frame = self.bounds;
    }
    return self;
}


#pragma mark - Getter
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.scrollEnabled = YES;
        _collectionView.pagingEnabled = YES;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delaysContentTouches = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = self.frame.size;
    flowLayout.minimumLineSpacing = 0.1;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.sectionInset = UIEdgeInsetsMake(0,
                                               0.1,
                                               0,
                                               0.1);
    return flowLayout;
}

#pragma mark - scrollView delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([self.delegate respondsToSelector:@selector(flipToIndex:)]) {
        int index = scrollView.contentOffset.x / self.frame.size.width;
        [self.delegate flipToIndex:index];
    }
    
}

#pragma mark - select onesIndex
-(void)selectIndex:(NSInteger)index
{
//    [UIView animateWithDuration:0.35 animations:^{
//
//        [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
//
//    }];
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredVertically|UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}

#pragma mark -  CollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    
    UIViewController *vc = [_dataArray objectAtIndex:indexPath.row];
    vc.view.frame = cell.bounds;
    [cell.contentView addSubview:vc.view];
    return cell;
}

#pragma mark - UICollectionViewDelegate



@end
