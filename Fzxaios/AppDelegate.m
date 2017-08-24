//
//  AppDelegate.m
//  Fzxaios
//
//  Created by Fzxa on 2017/8/14.
//  Copyright © 2017年 Fzxa. All rights reserved.
//

#import "AppDelegate.h"
#import <CYLTabBarController.h>

#import "HomeViewController.h"

@interface AppDelegate ()
#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    CYLTabBarController *tabVC = [[CYLTabBarController alloc]init];
    
    tabVC.tabBarItemsAttributes = [self createTabBarItemsAttributes];
    tabVC.viewControllers = [self createTabBarViewControllers];
    
    [self.window makeKeyAndVisible];
    [self customizeInterface];
    [self.window setRootViewController:tabVC];
    
    return YES;
}


-(NSArray *) createTabBarViewControllers
{
    UIViewController *homeVC = [[HomeViewController alloc]init];
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:homeVC];
    
    UIViewController *categoryVC = [[UIViewController alloc]init];
    UINavigationController *categoryNav = [[UINavigationController alloc]initWithRootViewController:categoryVC];
    
    UIViewController *leanVc = [[UIViewController alloc]init];
    UINavigationController *leanNav = [[UINavigationController alloc]initWithRootViewController:leanVc];
    
    UIViewController *profileVC = [[UIViewController alloc]init];
    UINavigationController *profileNav = [[UINavigationController alloc]initWithRootViewController:profileVC];

    
    return @[homeNav,categoryNav,leanNav,profileNav];
}

-(NSArray *) createTabBarItemsAttributes
{
    
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"首页",
                            CYLTabBarItemImage:@"tabbar_home",
                            CYLTabBarItemSelectedImage:@"tabbar_home_selected"
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"分类",
                            CYLTabBarItemImage : @"tabbar_group",
                            CYLTabBarItemSelectedImage : @"tabbar_group_selected"
                            };
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : @"我的学习",
                            CYLTabBarItemImage : @"tabbar_lean",
                            CYLTabBarItemSelectedImage : @"tabbar_lean_selected"
                            };
    NSDictionary *dict4 = @{
                            CYLTabBarItemTitle : @"账号",
                            CYLTabBarItemImage: @"tabbar_profile",
                            CYLTabBarItemSelectedImage:@"tabbar_profile_selected"
                            };
    return @[dict1,dict2,dict3,dict4];
}

- (void)customizeInterface {
    
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = RGB_COLOR(0, 165, 119);
    
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    //UITabBar *tabBarAppearance = [UITabBar appearance];
    //[tabBarAppearance setBackgroundImage:[UIImage imageNamed:@"tabbar_background"]];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
