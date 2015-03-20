//
//  Utils.h
//  iDribble
//
//  Created by Vinicius Brito on 20/03/15.
//  Copyright (c) 2015 Vinicius. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shot.h"
#import "Detail.h"

@interface Utils : NSObject

+ (NSArray *)criaObjetos : (NSArray *) arrayJson;
+ (Detail *)criaObjetosDetalhes : (NSDictionary *) dictJson;

+ (NSString *)stringDate : (NSString *) date;

@end
