//
//  Store.m
//  SalidoInterviewQuestion
//
//  Created by Henry Savit on 4/1/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import "Store.h"
#import "CatalogItem.h"

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

- (void)readArchive
{
    //fetch from db
    
    
//    NSURL *archiveURL = [[NSBundle bundleForClass:[self class]] URLForResource:@"photodata" withExtension:@"bin"];
//    NSAssert(archiveURL != nil, @"Unable to find archive in bundle.");
//    NSData *data = [NSData dataWithContentsOfURL:archiveURL options:0 error:NULL];
//    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
//    _users = [unarchiver decodeObjectOfClass:[NSArray class] forKey:@"users"];
//    _items = [unarchiver decodeObjectOfClass:[NSArray class] forKey:@"photos"];
//    [unarchiver finishDecoding];
}

//- (NSArray *)items
//{
////    return [self.items sortedArrayUsingComparator:^NSComparisonResult(CatalogItem *item1, CatalogItem *item2) {
////        return [item2.creationDate compare:item1.creationDate];
////    }];
//    return nil;
//}


@end
