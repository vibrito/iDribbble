//
//  Download.m
//  iDribble
//
//  Created by Vinicius Brito on 19/03/15.
//  Copyright (c) 2015 Vinicius. All rights reserved.
//

#import "Download.h"
#import <AFNetworking.h>

@implementation Download

+(void)downloadWithUrl:(NSString*)url callback:(DownloadCallback)callback
{
    //Monitorar a internet
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status)
     {
        //NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
         if ([[AFNetworkReachabilityManager sharedManager] isReachable] || [[AFNetworkReachabilityManager sharedManager] isReachableViaWiFi] || [[AFNetworkReachabilityManager sharedManager] isReachableViaWWAN])
         {
             AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
             [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
              {
                  //             NSLog(@"JSON: %@", responseObject);
                  callback(YES,responseObject);
              }
              
                  failure:^(AFHTTPRequestOperation *operation, NSError *error)
              {
                  //             NSLog(@"Error: %@", error);
                  callback(NO, @"Algo inesperado aconteceu");
              }];
         }
         
         else
         {
             callback(NO, @"Por favor, verifique sua conexão");
         }
    }];
    
    //Parar monitoramento
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
}

@end
