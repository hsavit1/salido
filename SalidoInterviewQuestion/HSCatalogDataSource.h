//
//  CategoryDataSource.h
//  SalidoInterviewQuestion
//
//  Created by Henry Savit on 4/1/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^TableViewCellConfigureBlock)(id cell, id item);

@interface HSCatalogDataSource : NSObject <UITableViewDataSource>

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
