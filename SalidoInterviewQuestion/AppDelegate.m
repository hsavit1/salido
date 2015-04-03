//
//  AppDelegate.m
//  SalidoInterviewQuestion
//
//  Created by Henry Savit on 3/31/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import "AppDelegate.h"
#import "Store.h"
#import "AFNetworkActivityIndicatorManager.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


+ (instancetype)sharedDelegate
{
    return [UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
