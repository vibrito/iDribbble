//
//  DetalheViewController.h
//  iDribble
//
//  Created by Vinicius Brito on 20/03/15.
//  Copyright (c) 2015 Vinicius. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetalheViewController : UIViewController
{
    
    __weak IBOutlet UIImageView *imageViewShot;
    __weak IBOutlet UILabel *labelDescription;
    __weak IBOutlet UILabel *labelViews_Count;
    __weak IBOutlet UILabel *labelComments_Count;
    __weak IBOutlet UILabel *labelCreated_At;
}

@property (nonatomic, strong) NSString *stringId;

@end
