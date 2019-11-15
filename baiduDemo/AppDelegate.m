//
//  AppDelegate.m
//  baiduDemo
//
//  Created by 周涛 on 2019/11/11.
//  Copyright © 2019 dddd. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BMKLocationkit/BMKLocationComponent.h>
@interface AppDelegate ()<BMKLocationAuthDelegate, BMKLocationManagerDelegate>
@property (nonatomic, strong)CLLocationManager *manager;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 要使用百度地图，请先启动BaiduMapManager
       BMKMapManager *mapManager = [[BMKMapManager alloc] init];
       // 如果要关注网络及授权验证事件，请设定generalDelegate参数
       BOOL ret = [mapManager start:@"b6yd78KjtrVTQsrXriRntDq0BV9p15Dr"  generalDelegate:nil];
       if (!ret) {
           NSLog(@"manager start failed!");
       }
  //设置定位AK
    _manager = [CLLocationManager new];
    [_manager requestAlwaysAuthorization];
    [[BMKLocationAuth sharedInstance] checkPermisionWithKey:@"b6yd78KjtrVTQsrXriRntDq0BV9p15Dr" authDelegate:self];
   
    if (@available(iOS 13, *)) {
        
    } else {
        self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        self.window.rootViewController = [[ViewController alloc]init];
        [self.window makeKeyAndVisible];
    }
    
    return YES;
}

- (void)onCheckPermissionState:(BMKLocationAuthErrorCode)iError{
    if (iError) {
        NSLog(@"定位授权失败");
    }else{
        NSLog(@"定位授权成功");
    }
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
