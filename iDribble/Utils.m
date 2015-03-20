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
        shot.title =  [dictJson objectForKey:@"title"];
        shot.images = [dictJson objectForKey:@"images"];
        shot.views_Count = [[dictJson objectForKey:@"views_count"]integerValue];
        shot.idNumber = [[dictJson objectForKey:@"id"] integerValue];
        shot.create_At = [dictJson objectForKey:@"created_at"];
        
        [array addObject: shot];
    }
    
    return array;
}

+ (Detail *)criaObjetosDetalhes : (NSDictionary *) dictJson
{
    Detail *detail = [Detail alloc];
    detail.title =  [dictJson objectForKey:@"title"];
    detail.images = [dictJson objectForKey:@"images"];
    detail.descriptionString =  [dictJson objectForKey:@"description"];
    detail.views_count = [[dictJson objectForKey:@"views_count"]integerValue];
    detail.comments_count = [[dictJson objectForKey:@"id"] integerValue];
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
