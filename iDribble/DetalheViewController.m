//
//  DetalheViewController.m
//  iDribble
//
//  Created by Vinicius Brito on 20/03/15.
//  Copyright (c) 2015 Vinicius. All rights reserved.
//

#import "DetalheViewController.h"
#import "Define.h"
#import "Detail.h"

@interface DetalheViewController ()

@end

@implementation DetalheViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *stringUrl = [NSString stringWithFormat:@"%@%@/?access_token=%@",URLGetShots, _stringId, URLToken];
    [Download downloadWithUrl:stringUrl callback:^(BOOL success, id result)
     {
         if (success)
         {
             Detail *detail = [Utils criaObjetosDetalhes:result];
             self.title = detail.title;
             [webViewDescription loadHTMLString:detail.descriptionString baseURL:nil];
            
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
             UIAlertController * alerta =   [UIAlertController
                                           alertControllerWithTitle:@"Erro"
                                           message:result
                                           preferredStyle:UIAlertControllerStyleAlert];
             
             UIAlertAction* ok = [UIAlertAction
                                  actionWithTitle:@"OK"
                                  style:UIAlertActionStyleDefault
                                  handler:^(UIAlertAction * action)
                                  {
                                      [alerta dismissViewControllerAnimated:YES completion:nil];
                                      
                                  }];
             
             [alerta addAction:ok];
             
             [self presentViewController:alerta animated:YES completion:nil];
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
