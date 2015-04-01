//
//  HSCatalogTableViewCell+ConfigureCell.m
//  SalidoInterviewQuestion
//
//  Created by Henry Savit on 4/1/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import "HSCatalogTableViewCell+ConfigureCell.h"
#import "CatalogItem.h"

@implementation HSCatalogTableViewCell (ConfigureCell)

- (void)configureForCatalogItem:(CatalogItem *)item
{
    self.catalogTitleLabel.text = item.name;
}

@end
