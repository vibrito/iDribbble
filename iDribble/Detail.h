//
//  Detail.h
//  iDribble
//
//  Created by Vinicius Brito on 20/03/15.
//  Copyright (c) 2015 Vinicius. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Detail : NSObject

@property (nonatomic, readwrite) NSString *title;
@property (nonatomic, readwrite) NSDictionary *images;
@property (nonatomic, readwrite) NSString *descriptionString;
@property (nonatomic, readwrite) NSInteger views_count;
@property (nonatomic, readwrite) NSInteger comments_count;
@property (nonatomic, readwrite) NSString *created_at;

@end
