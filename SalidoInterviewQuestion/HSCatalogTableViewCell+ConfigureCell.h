//
//  HSCatalogTableViewCell+ConfigureCell.h
//  SalidoInterviewQuestion
//
//  Created by Henry Savit on 4/1/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import "HSCatalogTableViewCell.h"

@class CatalogItem;

@interface HSCatalogTableViewCell (ConfigureCell)

- (void)configureForCatalogItem:(CatalogItem *)item;

@end
