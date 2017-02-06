//
//  ZeusTabBar.h
//  MO勘
//
//  Created by Zeus on 2017/1/23.
//  Copyright © 2017年 Zeus. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZeusTabBar;

@protocol ZeusTabBarDelegate <NSObject>

/**
 *  工具栏按钮被选中, 记录从哪里跳转到哪里. (方便以后做相应特效)
 */
- (void) tabBar:(ZeusTabBar *)tabBar selectedFrom:(NSInteger) from to:(NSInteger)to;



@end




@interface ZeusTabBar : UIView

@property(nonatomic, weak)id<ZeusTabBarDelegate> delegate;

@end
