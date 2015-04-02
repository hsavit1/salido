//
//  JSONResponseSerializerWithData.h
//  SalidoInterviewQuestion
//
//  Created by Henry Savit on 4/2/15.
//  Copyright (c) 2015 Henry Savit. All rights reserved.
//

#import "AFURLResponseSerialization.h"

/// NSError userInfo key that will contain response data
static NSString * const JSONResponseSerializerWithDataKey = @"JSONResponseSerializerWithDataKey";

@interface JSONResponseSerializerWithData : AFJSONResponseSerializer

@end