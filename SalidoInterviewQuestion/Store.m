//
//  Store.m
//  SalidoInterviewQuestion
//
//  Created by Henry Savit on 4/1/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import "Store.h"
#import "CatalogItem.h"
#import "AFNetworking.h"

NSString * const kAPIKey = @"9520e90171cebf267fc05e9dcee4c0e3";
static NSString * const kWineOnlineURLString = @"http://services.wine.com/api/beta2/service.svc/JSON/catalog?apikey=9520e90171cebf267fc05e9dcee4c0e3";

@implementation Store

+ (instancetype)store
{
    return [[self alloc] init];
}

- (id)init
{
    self = [super init];
    if (self) {
        [self readArchive];
    }
    return self;
}

- (void)readArchive{

    NSString *parameter = @"";
    NSString *combinedString = [kWineOnlineURLString stringByAppendingString:parameter];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:kWineOnlineURLString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    //
}


@end
