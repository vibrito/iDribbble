//
//  Utils.m
//  iDribble
//
//  Created by Vinicius Brito on 20/03/15.
//  Copyright (c) 2015 Vinicius. All rights reserved.
//

#import "Utils.h"

@implementation Utils


+ (NSArray *)criaObjetos : (NSArray *) arrayJson
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSDictionary *dictJson in arrayJson)
    {
        Shot *shot = [Shot alloc];
        
        if ([dictJson objectForKey:@"title"] != (id)[NSNull null])
            shot.title =  [dictJson objectForKey:@"title"];
        
        if ([dictJson objectForKey:@"images"] != (id)[NSNull null])
            shot.images = [dictJson objectForKey:@"images"];
        
        if ([dictJson objectForKey:@"views_count"] != (id)[NSNull null])
            shot.views_Count = [[dictJson objectForKey:@"views_count"]integerValue];
        
        if ([dictJson objectForKey:@"id"] != (id)[NSNull null])
            shot.idNumber = [[dictJson objectForKey:@"id"] integerValue];
        
        if ([dictJson objectForKey:@"created_at"] != (id)[NSNull null])
            shot.create_At = [dictJson objectForKey:@"created_at"];
        
        [array addObject: shot];
    }
    
    return array;
}

+ (Detail *)criaObjetosDetalhes : (NSDictionary *) dictJson
{
    Detail *detail = [Detail alloc];
    
    if ([dictJson objectForKey:@"title"] != (id)[NSNull null])
        detail.title =  [dictJson objectForKey:@"title"];
    
    if ([dictJson objectForKey:@"images"] != (id)[NSNull null])
        detail.images = [dictJson objectForKey:@"images"];
    
    if ([dictJson objectForKey:@"description"] != (id)[NSNull null])
        detail.descriptionString =  [dictJson objectForKey:@"description"];

    if ([dictJson objectForKey:@"views_count"] != (id)[NSNull null])
        detail.views_count = [[dictJson objectForKey:@"views_count"]integerValue];
    
    if ([dictJson objectForKey:@"id"] != (id)[NSNull null])
        detail.comments_count = [[dictJson objectForKey:@"id"] integerValue];
    
    if ([dictJson objectForKey:@"created_at"] != (id)[NSNull null])
        detail.created_at = [dictJson objectForKey:@"created_at"];
    
    
    return detail;
}

+ (NSString *)stringDate : (NSString *) date
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"YYYY-MM-dd\'T\'HH:mm:ssZZZZZ"];
    NSDate *dateString = [dateFormat dateFromString:date];
    
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *stringDateSimples = [dateFormat stringFromDate:dateString];
    NSString *stringDateCriadoEm = [NSString stringWithFormat:@"Criado em: %@", stringDateSimples];
    return stringDateCriadoEm;
}


@end
