//
//  CellShotTableViewCell.h
//  iDribble
//
//  Created by Vinicius Brito on 20/03/15.
//  Copyright (c) 2015 Vinicius. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShotTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *imageViewShot;
@property (nonatomic, weak) IBOutlet UILabel *labelTitle;
@property (nonatomic, weak) IBOutlet UILabel *labelCreated_At;
@property (nonatomic, weak) IBOutlet UILabel *labelViews_Count;



@end
