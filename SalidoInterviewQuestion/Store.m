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
#import "SVProgressHUD.h"

NSString * const kAPIKey = @"9520e90171cebf267fc05e9dcee4c0e3";
static NSString * const kWineOnlineURLString = @"http://services.wine.com/api/beta2/service.svc/JSON/catalog?apikey=9520e90171cebf267fc05e9dcee4c0e3";

@implementation Store

+ (instancetype)store{
    static Store *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        [self networkingCode];
    }
    return self;
}

-(void)networkingCode{
    [SVProgressHUD show];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [JSONResponseSerializerWithData serializer];
    [manager GET:kWineOnlineURLString parameters:@{@"key1": @"value1"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        self.responseDictionary = (NSDictionary*)responseObject;
        int numObjects = (int)[[[self.responseDictionary objectForKey:@"Products"] valueForKey:@"List"] count];
        //NSLog(@"%i", numObjects);
        
        NSMutableArray *mut = [[NSMutableArray alloc]init];
        for(int i = 0; i < numObjects; i++){
            NSDictionary *tempDictionary = [[NSDictionary alloc]initWithDictionary:[[self.responseDictionary objectForKey:@"Products"] objectForKey:@"List"][i]];
            
            NSString *productName = [tempDictionary objectForKey:@"Name"];
            NSInteger retailPrice = [[tempDictionary objectForKey:@"PriceRetail"] integerValue];
//            NSString *imageUrlString = [[tempDictionary objectForKey:@"ProductAttributes"] objectForKey:@"ImageUrl"];
            
            CatalogItem *item = [[CatalogItem alloc]init];
            item.retailPrice = [NSNumber numberWithInteger:retailPrice];
            item.name = productName;
            item.jsonDump = (NSString*)[[self.responseDictionary objectForKey:@"Products"] objectForKey:@"List"][i];
//            item.catalogImageUrl = imageUrlString;
            
            
            [mut addObject:item];
            //NSDictionary *ratingsDictionary = [[NSDictionary alloc]initWithDictionary:[tempDictionary objectForKey:@"Ratings"]];
            //NSDictionary *vinyardDictionary = [[NSDictionary alloc]initWithDictionary:[tempDictionary objectForKey:@"Vinyard"]];
        }
        
        self.items = [[NSArray alloc]initWithArray:mut];
        
        [SVProgressHUD dismiss];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"dataRecieved" object:nil];
        
    }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             id json = error.userInfo[JSONResponseSerializerWithDataKey];
             NSLog(@"failure %@", json);
             [SVProgressHUD dismiss];
         }];
}


@end
