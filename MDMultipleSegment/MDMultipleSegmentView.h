//
//  MDMultipleSegmentView.h
//  MDMultipleSegment
//
//  Created by 梁宪松 on 2017/8/29.
//  Copyright © 2017年 Madao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MDMultipleSegmentView;

@protocol MDMultipleSegmentViewDeletegate <NSObject>
@optional

/**
 选中下标方法
 @param segIndex 当前选中下标
 */
-(void)changeSegmentAtIndex:(NSInteger)segIndex;

@end


@interface MDMultipleSegmentView : UIView

/**
 *  Delegate
 */
@property (nonatomic, weak) id<MDMultipleSegmentViewDeletegate> delegate;

/**
 *  标题数组
 */
@property (nonatomic, copy) NSArray <NSString *> *items;

/**
 *  未选中时的文字颜色,默认黑色
 */
@property (nonatomic,strong) UIColor *titleNormalColor;

/**
 *  选中时的文字颜色,默认红色
 */
@property (nonatomic,strong) UIColor *titleSelectColor;

/**
 *  字体大小，默认15
 */
@property (nonatomic,strong) UIFont *titleFont;

/**
 *  当前被选中的下标，设置默认选中下标为0
 */
@property (nonatomic,assign) NSInteger selectedSegmentIndex;

/**
 *  初始化方法
 *
 *  @param items 标题数组
 */
-(instancetype)initWithFrame:(CGRect)frame items:(NSArray *)items;

/**
 选中下标
 */
-(void)selectIndex:(NSInteger)index;

@end
