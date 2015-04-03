//
//  AppDelegate.h
//  SalidoInterviewQuestion
//
//  Created by Henry Savit on 3/31/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Store;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

+ (instancetype)sharedDelegate;
@property (strong, nonatomic) UIWindow *window;

@end

