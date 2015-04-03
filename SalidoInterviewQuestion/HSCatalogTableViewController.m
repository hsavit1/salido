//
//  ViewController.m
//  SalidoInterviewQuestion
//
//  Created by Henry Savit on 3/31/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import "HSDetailViewController.h"
#import "HSCatalogTableViewController.h"
#import "HSCatalogDataSource.h"
#import "HSCatalogTableViewCell.h"
#import "CatalogItem.h"
#import "HSCatalogTableViewCell+ConfigureCell.h"
#import "AppDelegate.h"
#import "Store.h"

static NSString * const CatalogCellIdentifier = @"CatalogCell";

@interface HSCatalogTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) HSCatalogDataSource *ds;

@end


@implementation HSCatalogTableViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.title = @"Photos";
    
    [Store store];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveEvent:) name:@"dataRecieved" object:nil];

}

- (void)receiveEvent:(NSNotification *)notification {

    NSArray *items = [[NSArray alloc]initWithObjects:nil];
    items = [[Store store].items copy];
    
    TableViewCellConfigureBlock configureCell = ^(HSCatalogTableViewCell *cell, CatalogItem *item) {
        [cell configureForCatalogItem:item];
    };
    
    if(!items.count){
        NSLog(@"Problem! No data items fetched | dataitems not fetched in time");
    }
    else{
        self.ds = [[HSCatalogDataSource alloc] initWithItems:items
                                              cellIdentifier:CatalogCellIdentifier
                                          configureCellBlock:configureCell];
        self.tableView.dataSource = self.ds;
    }
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HSDetailViewController *dVC = [sb instantiateViewControllerWithIdentifier:@"detailViewController"];
    
    dVC.selectedItem = [self.ds itemAtIndexPath:indexPath];
    
    [self.navigationController pushViewController:dVC animated:YES];
}

@end
