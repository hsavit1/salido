//
//  ViewController.m
//  SalidoInterviewQuestion
//
//  Created by Henry Savit on 3/31/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import "DetailViewController.h"
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Photos";
    [self setupTableView];
}

- (void)setupTableView
{
    TableViewCellConfigureBlock configureCell = ^(HSCatalogTableViewCell *cell, CatalogItem *item) {
        [cell configureForCatalogItem:item];
    };
    NSArray *items = [AppDelegate sharedDelegate].store.items;
    self.ds = [[HSCatalogDataSource alloc] initWithItems:items
                                          cellIdentifier:CatalogCellIdentifier
                                      configureCellBlock:configureCell];
    self.tableView.dataSource = self.ds;
//    [self.tableView registerNib:[CatalogCell nib] forCellReuseIdentifier:CatalogCellIdentifier];
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *dVC = [[DetailViewController alloc] initWithNibName:@"Main"
                                                                                     bundle:nil];
    dVC.selectedItem = [self.ds itemAtIndexPath:indexPath];
    [self.navigationController pushViewController:dVC animated:YES];
}

@end
