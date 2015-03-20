//
//  Shot.h
//  iDribble
//
//  Created by Vinicius Brito on 19/03/15.
//  Copyright (c) 2015 Vinicius. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shot : NSObject

@property (nonatomic, readwrite) NSString *title;
@property (nonatomic, readwrite) NSString *create_At;
@property (nonatomic, readwrite) NSDictionary *images;
@property (nonatomic, readwrite) NSInteger views_Count;
@property (nonatomic, readwrite) NSInteger idNumber;

//id

@end
