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
#import "JSONResponseSerializerWithData.h"

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
 
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [JSONResponseSerializerWithData serializer];
    [manager GET:kWineOnlineURLString parameters:@{@"key1": @"value1"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        self.responseDictionary = (NSDictionary*)responseObject;
//        NSLog(@"success %@", responseObject);
        
        int numObjects = (int)[[[self.responseDictionary objectForKey:@"Products"] valueForKey:@"List"] count];
        //NSLog(@"%i", numObjects);
        for(int i = 0; i < numObjects; i++){
            NSLog(@"%@", [[self.responseDictionary objectForKey:@"Products"] objectForKey:@"List"]);
        }
    }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             // get the json here
             id json = error.userInfo[JSONResponseSerializerWithDataKey];
             NSLog(@"failure %@", json);
    }];

}


@end
