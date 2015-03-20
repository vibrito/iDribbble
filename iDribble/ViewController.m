//
//  ViewController.m
//  iDribble
//
//  Created by Vinicius Brito on 19/03/15.
//  Copyright (c) 2015 Vinicius. All rights reserved.
//

#import "ViewController.h"
#import "Download.h"
#import <AFNetworking.h>
#import "Shot.h"
#import "MBProgressHUD.h"
#import "ShotTableViewCell.h"
#import "Utils.h"
#import <UIImageView+AFNetworking.h>
#import "DetalheViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.title = @"Home";
    [self refreshData];
}

- (void)refreshData
{
    
    //Colocar a URL e o Token no define.h do aplicativo
    NSString *stringUrl = @"http://api.dribbble.com/v1/shots/?list=0&access_token=7ad95864feb428f21b6c5e584fec351222b259fbb818a92907aea36d13de3d7a&page=0&per_page=30";

    arrayShots = [[NSArray alloc] init];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [Download downloadWithUrl:stringUrl callback:^(BOOL success, id result)
    {
        if (success)
             arrayShots = [Utils criaObjetos:result];
        
        else
        {
            //Colocar alerta de erro
        }
        
        [_tableViewPrincipal reloadData];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayShots count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ShotCell";
    ShotTableViewCell *cell = [_tableViewPrincipal dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[ShotTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Shot *shot = [arrayShots objectAtIndex:indexPath.row];
    NSString *stringViews = [NSString stringWithFormat:@"%ld Visualizações", (long)shot.views_Count];
    cell.labelTitle.text = shot.title;
    cell.labelViews_Count.text = stringViews;
    cell.labelCreated_At.text = [Utils stringDate:shot.create_At];
    
    NSURL *url = [NSURL URLWithString:[shot.images objectForKey:@"teaser"]];
    [cell.imageViewShot setImageWithURL:url placeholderImage:nil];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    intIndex = indexPath.row;
    [self performSegueWithIdentifier:@"segueDetalhes" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetalheViewController *detalhes = [segue destinationViewController];
    Shot *shot = [arrayShots objectAtIndex:intIndex];
    NSString *stringId = [NSString stringWithFormat:@"%ld", (long)shot.idNumber];
    detalhes.stringId = stringId;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
