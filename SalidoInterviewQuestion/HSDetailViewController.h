//
//  DetailViewController.h
//  SalidoInterviewQuestion
//
//  Created by Henry Savit on 4/1/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CatalogItem;

@interface HSDetailViewController : UIViewController

@property (nonatomic, strong) CatalogItem *selectedItem;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *vineyardInfoLabel;

@end
