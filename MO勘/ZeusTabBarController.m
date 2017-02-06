//
//  ZeusTabBarController.m
//  MO勘
//
//  Created by Zeus on 17/1/20.
//  Copyright © 2017年 Zeus. All rights reserved.
//

#import "ZeusTabBarController.h"
#import "ZeusTabBar.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
#import "SixthViewController.h"


@interface ZeusTabBarController ()<ZeusTabBarDelegate>

@property(nonatomic, weak)UIButton *selectedBtn; //当前选中的按钮

@end

@implementation ZeusTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addchildVC:[[FirstViewController alloc]init] title:@"第一" image:@"未选中" selectedImage:@"选中"];
    [self addchildVC:[[SecondViewController alloc]init] title:@"第二" image:@"未选中" selectedImage:@"选中"];
    [self addchildVC:[[ThirdViewController alloc]init] title:@"第三" image:@"未选中" selectedImage:@"选中"];
    [self addchildVC:[[FourthViewController alloc]init] title:@"第四" image:@"未选中" selectedImage:@"选中"];
    [self addchildVC:[[FifthViewController alloc]init] title:@"第五" image:@"未选中" selectedImage:@"选中"];
    [self addchildVC:[[SixthViewController alloc]init] title:@"第六" image:@"未选中" selectedImage:@"选中"];
    
    [self.tabBar removeFromSuperview];  //移除TabBarController自带的下部的条
    ZeusTabBar *tabBar = [[ZeusTabBar alloc]initWithFrame:CGRectMake(0, 64, 80, KSCREEN_HEIGHT)];
    // 设置代理
    tabBar.delegate = self;
    tabBar.backgroundColor = [UIColor redColor];
    // KVC：如果要修系统的某些属性，但被设为readOnly，就是用KVC，即setValue：forKey：。
    // 修改tabBar为自定义tabBar
    [self.view addSubview:tabBar];
    
}


#pragma mark --- 添加自控制器 ---
- (void)addchildVC:(UIViewController *)childVC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字(可以设置tabBar和navigationBar的文字)
    childVC.title = title;
    
    // 设置子控制器的tabBarItem图片
    childVC.tabBarItem.image = [UIImage imageNamed:image];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置文字的样式
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blueColor]} forState:UIControlStateSelected];
    // 为控制器添加导航栏
    UINavigationController *navigationVC = [[UINavigationController alloc]initWithRootViewController:childVC];
    [self addChildViewController:navigationVC];
}


#pragma mark --- 代理方法 ---
- (void)tabBar:(ZeusTabBar *)tabBar selectedFrom:(NSInteger)from to:(NSInteger)to {
    self.selectedIndex = to;
}















#pragma mark --- 当前点击第几个tabbar的代理方法 ---
- (void)returnWhichController:(NSInteger)index
{
    self.selectedIndex = index;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
