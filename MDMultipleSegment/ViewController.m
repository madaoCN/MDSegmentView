//
//  ViewController.m
//  MDMultipleSegment
//
//  Created by 梁宪松 on 2017/8/29.
//  Copyright © 2017年 Madao. All rights reserved.
//

#import "ViewController.h"
#import "MDMultipleSegmentView.h"
#import "MDFlipCollectionView.h"

@interface ViewController ()<MDMultipleSegmentViewDeletegate,
                            MDFlipCollectionViewDelegate>
{
    MDMultipleSegmentView *_segView;
    MDFlipCollectionView *_collectView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    _segView = [[MDMultipleSegmentView alloc] init];
    _segView.delegate =  self;
    _segView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 44);
    _segView.items = @[@"东",@"南", @"西", @"北", @"日", @"月"];
    [self.view addSubview:_segView];
    
    NSArray *arr = @[[self controller],
                     [self controller],
                     [self controller],
                     [self controller],
                     [self controller],
                     [self controller],

                    ];
    
    _collectView = [[MDFlipCollectionView alloc] initWithFrame:CGRectMake(0,
    CGRectGetMaxY(_segView.frame),
    CGRectGetWidth(_segView.frame),
    CGRectGetHeight(self.view.bounds) - CGRectGetMaxY(_segView.frame)) withArray:arr];
    _collectView.delegate = self;
    [self.view addSubview:_collectView];
}

- (UIViewController *)controller
{
    UIViewController *vc = [[UIViewController alloc] init];
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    vc.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    return vc;
}

- (void)changeSegmentAtIndex:(NSInteger)index
{
    [_collectView selectIndex:index];
}


- (void)flipToIndex:(NSInteger)index
{
    [_segView selectIndex:index];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
