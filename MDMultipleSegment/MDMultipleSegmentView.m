//
//  MDMultipleSegmentView.m
//  MDMultipleSegment
//
//  Created by 梁宪松 on 2017/8/29.
//  Copyright © 2017年 Madao. All rights reserved.
//

#import "MDMultipleSegmentView.h"
#import "MDMultipleSegmentLayout.h"
#import "MDMultipleSegmentViewCell.h"


#define kRedColor [[UIColor orangeColor] colorWithAlphaComponent:0.99]

@interface MDMultipleSegmentView ()<UICollectionViewDelegate,
                                    UICollectionViewDataSource>


@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) MDMultipleSegmentLayout *layout;

@end

@implementation MDMultipleSegmentView



- (instancetype)init
{
    if (self = [super init]) {
        
        [self initialProperty];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initialProperty];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame items:(NSArray *)items
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initialProperty];
    }
    
    return self;
}

- (void)initialProperty
{
    _titleFont = [UIFont systemFontOfSize:15];
    _titleNormalColor = [UIColor blackColor];
    _titleSelectColor = kRedColor;
    _selectedSegmentIndex = 0;
    
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    self.collectionView.backgroundColor = self.backgroundColor =  [UIColor whiteColor];
    // 设置约束
    //创建宽度约束
    NSLayoutConstraint * constraintw =  [NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    //创建高度约束
    NSLayoutConstraint * constrainth = [NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    //水平居中约束
    NSLayoutConstraint * constraintCenterX =  [NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    //竖直居中
    NSLayoutConstraint * constraintCenterY =  [NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    //添加约束之前，必须将视图加在父视图上
    [self addSubview:self.collectionView];
    [self addConstraints:@[constrainth,constraintw,constraintCenterX, constraintCenterY]];
}


#pragma mark - Engine
-(void)updateView{
    
    [self.collectionView reloadData];
}

#pragma mark - Getter
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.scrollEnabled = YES;
        [_collectionView registerClass:[MDMultipleSegmentViewCell class] forCellWithReuseIdentifier:NSStringFromClass([MDMultipleSegmentViewCell class])];
    }
    return _collectionView;
}

- (MDMultipleSegmentLayout *)layout
{
    if (!_layout) {
        
        _layout = [[MDMultipleSegmentLayout alloc] init];
    }
    return _layout;
}

#pragma mark - Setter
- (void)setItems:(NSArray *)items
{
    _items = items;
    [self updateView];
}

- (void)setTitleNormalColor:(UIColor *)titleNormalColor
{
    _titleNormalColor = titleNormalColor;
    [self updateView];
}

- (void)setTitleSelectColor:(UIColor *)titleSelectColor
{
    _titleSelectColor = titleSelectColor;
    [self updateView];
}

- (void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    [self updateView];
}

- (void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex
{
    _selectedSegmentIndex = selectedSegmentIndex;
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:selectedSegmentIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    [self updateView];
}

- (void)selectIndex:(NSInteger)index
{
    self.selectedSegmentIndex = index;
}

#pragma mark -  CollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MDMultipleSegmentViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MDMultipleSegmentViewCell class]) forIndexPath:indexPath];
    cell.titleLabel.font = self.titleFont;
    cell.isSeleted = (indexPath.row == _selectedSegmentIndex ? YES : NO);
    cell.titleLabel.textColor = cell.isSeleted ? self.titleSelectColor : self.titleNormalColor;

    NSString *str = [_items objectAtIndex:indexPath.row];
    if (str) {
        cell.titleLabel.text = [_items objectAtIndex:indexPath.row];
    }

    return cell;
}


#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    _selectedSegmentIndex = indexPath.row;
    [collectionView reloadData];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(changeSegmentAtIndex:)]) {
        
        [self.delegate changeSegmentAtIndex:indexPath.row];
    }
}


@end
