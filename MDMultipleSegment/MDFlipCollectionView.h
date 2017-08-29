//
//  MDFlipCollectionView.h
//  MDMultipleSegment
//
//  Created by 梁宪松 on 2017/8/29.
//  Copyright © 2017年 Madao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MDFlipCollectionViewDelegate <NSObject>
/**
 滑动回调
 @param index 对应的下标（从1开始）
 */
- (void)flipToIndex:(NSInteger)index;
@end


@interface MDFlipCollectionView : UIView

/**
 存放对应的内容控制器
 */
@property (nonatomic, strong)NSMutableArray <UIViewController *>*dataArray;
/**
 delegate
 */
@property (nonatomic, weak) id<MDFlipCollectionViewDelegate> delegate;

/**
 初始化方法

 @param frame frame
 @param contentArray 视图控制器数组
 @return instancetype
 */
-(instancetype)initWithFrame:(CGRect)frame withArray:(NSArray <UIViewController *>*)contentArray;
/**
 手动选中某个页面
 
 @param index 默认为1（即从1开始）
 */
-(void)selectIndex:(NSInteger)index;


@end
