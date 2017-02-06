//
//  ZeusTabBar.m
//  MO勘
//
//  Created by Zeus on 2017/1/23.
//  Copyright © 2017年 Zeus. All rights reserved.
//

#import "ZeusTabBar.h"


#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
#import "SixthViewController.h"


@interface ZeusTabBar ()

@property(nonatomic, weak)UIButton *selectedBtn; //之前选中的按钮

@end


@implementation ZeusTabBar

/**
 *  在这个方法里写控件初始化的东西, 调用init方法时会调用
 */
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addButtonWithImage:[UIImage imageNamed:@"未选中"] selectedImage:[UIImage imageNamed:@"选中"] index:0 frame:CGRectMake(10, 10, 60, 60)];
        [self addButtonWithImage:[UIImage imageNamed:@"未选中"] selectedImage:[UIImage imageNamed:@"选中"] index:1 frame:CGRectMake(10, 80, 60, 60)];
        [self addButtonWithImage:[UIImage imageNamed:@"未选中"] selectedImage:[UIImage imageNamed:@"选中"] index:2 frame:CGRectMake(10, 150, 60, 60)];
        [self addButtonWithImage:[UIImage imageNamed:@"未选中"] selectedImage:[UIImage imageNamed:@"选中"] index:3 frame:CGRectMake(10, 220, 60, 60)];
        [self addButtonWithImage:[UIImage imageNamed:@"未选中"] selectedImage:[UIImage imageNamed:@"选中"] index:4 frame:CGRectMake(10, KSCREEN_HEIGHT - 190, 60, 60)];
        [self addButtonWithImage:[UIImage imageNamed:@"未选中"] selectedImage:[UIImage imageNamed:@"选中"] index:5 frame:CGRectMake(10, KSCREEN_HEIGHT - 120, 60, 60)];
        
    }
        return self;
}

- (void)addButtonWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage index:(NSInteger)index frame:(CGRect)frame
{
    UIButton *btn = [[UIButton alloc]init];
    btn.frame = frame;
    btn.tag = 100 + index;
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(selectBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
    //如果是第一个按钮, 则选中(按顺序一个个添加)
    if (self.subviews.count == 1) {
        [self selectBtnAction:btn];
    }
    
}

#pragma mark --- tabBar点击事件 ---
- (void)selectBtnAction:(UIButton *)button
{
    //1.先将之前选中的按钮设置为未选中
    self.selectedBtn.selected = NO;
    //2.再将当前按钮设置为选中
    button.selected = YES;
    //3.最后把当前按钮赋值为之前选中的按钮
    self.selectedBtn = button;
    //4让控制器去执行代理事件
    if ([self.delegate respondsToSelector:@selector(tabBar:selectedFrom:to:)]) {
        [self.delegate tabBar:self selectedFrom:self.selectedBtn.tag-100 to:button.tag-100];
    }
    
}












@end











