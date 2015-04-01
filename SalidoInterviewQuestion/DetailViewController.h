//
//  DetailViewController.h
//  SalidoInterviewQuestion
//
//  Created by Henry Savit on 4/1/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CatalogItem;
@interface DetailViewController : UIViewController

@property (nonatomic, strong) CatalogItem *selectedItem;

@end
