//
//  DetailViewController.m
//  SalidoInterviewQuestion
//
//  Created by Henry Savit on 4/1/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import "HSDetailViewController.h"
#import "AFNetworking.h"
#import "CatalogItem.h"

@interface HSDetailViewController ()

@end

@implementation HSDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//should really be in a separate class but lack of time
-(void)setupImageView{
    NSString * methodURL = self.selectedItem.catalogImageUrl;
    NSInteger someIDYouHaveOfAnImage = 13;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFImageResponseSerializer serializer];
    NSDictionary * parameterDictionary = @{@"Parameter" : [NSNumber numberWithInteger:someIDYouHaveOfAnImage]};
    [manager GET:methodURL parameters:parameterDictionary success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[UIImage class]]) {
            UIImage * image = responseObject;
            // Here is your image object
            self.imageView.image = image;
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failure getting the file : %@", error.localizedDescription);
    }];
}

- (IBAction)addItemButtonPressed:(id)sender {

}

@end
