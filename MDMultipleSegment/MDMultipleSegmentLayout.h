//
//  MDMultipleSegmentLayout.h
//  MDMultipleSegment
//
//  Created by 梁宪松 on 2017/8/29.
//  Copyright © 2017年 Madao. All rights reserved.
//

#import <UIKit/UIKit.h>

//获取屏幕宽度，高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

FOUNDATION_EXTERN NSInteger const MDItemsPerPage;

@interface MDMultipleSegmentLayout : UICollectionViewLayout

@end
