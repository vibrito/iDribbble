//
//  DetalheViewController.m
//  iDribble
//
//  Created by Vinicius Brito on 20/03/15.
//  Copyright (c) 2015 Vinicius. All rights reserved.
//

#import "DetalheViewController.h"
#import <AFNetworking.h>
#import "Download.h"
#import "MBProgressHUD.h"
#import "Utils.h"
#import <UIImageView+AFNetworking.h>
#import "Detail.h"

@interface DetalheViewController ()

@end

@implementation DetalheViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Colocar a URL e o Token no define.h do aplicativo
    NSString *stringUrl = [NSString stringWithFormat:@"https://api.dribbble.com/v1/shots/%@/?access_token=7ad95864feb428f21b6c5e584fec351222b259fbb818a92907aea36d13de3d7a", _stringId];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [Download downloadWithUrl:stringUrl callback:^(BOOL success, id result)
     {
         if (success)
         {
             Detail *detail = [Utils criaObjetosDetalhes:result];
             self.title = detail.title;
             labelDescription.text = detail.descriptionString;
            
             labelCreated_At.text = [Utils stringDate:detail.created_at];
             
             NSString *stringViews = [NSString stringWithFormat:@"%ld Visualizações", (long)detail.views_count];
             labelViews_Count.text = stringViews;
             NSString *stringComments = [NSString stringWithFormat:@"%ld Comentários", (long)detail.comments_count];
             labelComments_Count.text = stringComments;
             NSURL *url = [NSURL URLWithString:[detail.images objectForKey:@"normal"]];
             [imageViewShot setImageWithURL:url placeholderImage:nil];
         }
         
         else
         {
             //Colocar alerta de erro
         }
         
         [MBProgressHUD hideHUDForView:self.view animated:YES];
     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
