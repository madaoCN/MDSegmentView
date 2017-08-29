//
//  MDMultipleSegmentViewCell.h
//  MDMultipleSegment
//
//  Created by 梁宪松 on 2017/8/29.
//  Copyright © 2017年 Madao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDMultipleSegmentViewCell : UICollectionViewCell

/**
 *  标签label
 */
@property (nonatomic, strong) UILabel *titleLabel;

/**
 *  当前是否被选中
 */
@property (nonatomic, assign) BOOL isSeleted;

/**
 *  选中后下划线高度
 */
@property (nonatomic, assign) CGFloat bottomLineWidth;


@end
