//
//  Store.h
//  SalidoInterviewQuestion
//
//  Created by Henry Savit on 4/1/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject

+ (instancetype)store;

@property (nonatomic, strong) NSArray *items;
//@property (readonly, nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSDictionary *responseDictionary;


- (NSArray*)items;

@end
