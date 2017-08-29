//
//  MDMultipleSegmentLayout.m
//  MDMultipleSegment
//
//  Created by 梁宪松 on 2017/8/29.
//  Copyright © 2017年 Madao. All rights reserved.
//

#import "MDMultipleSegmentLayout.h"

NSInteger const MDItemsPerPage = 4;//一页最多4个

@interface MDMultipleSegmentLayout()
{
    NSMutableArray * _attributeAtts;//属性数组
    NSInteger _totalItemsNum;//总共标签数
}
@end

@implementation MDMultipleSegmentLayout

- (void)prepareLayout
{
    _totalItemsNum = (int)[self.collectionView numberOfItemsInSection:0];
    _attributeAtts = [[NSMutableArray alloc]init];
    CGFloat collectionViewW = CGRectGetWidth(self.collectionView.frame);
    CGFloat collectionViewH = CGRectGetHeight(self.collectionView.frame);
    
    if (_attributeAtts.count) {
        return;
    }
    for (int i = 0; i < _totalItemsNum; i ++) {
        
        UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        if (_totalItemsNum >= MDItemsPerPage) {
            
            attr.size = CGSizeMake(collectionViewW/MDItemsPerPage,
                                   collectionViewH);
        }else
        {
            attr.size = CGSizeMake(collectionViewW/_totalItemsNum,
                                   collectionViewH);
        }
        attr.center = CGPointMake(attr.size.width * (i + 0.5),
                                  CGRectGetMidY(self.collectionView.frame));
        
        [_attributeAtts addObject:attr];
    }
    
}

// 设置内容区域大小
-(CGSize)collectionViewContentSize{
    
    return (_attributeAtts.count <= MDItemsPerPage) ? self.collectionView.frame.size : CGSizeMake(SCREEN_WIDTH/MDItemsPerPage * _attributeAtts.count,
                          CGRectGetHeight(self.collectionView.frame));
}

//返回属性数组
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return _attributeAtts;
}




@end
