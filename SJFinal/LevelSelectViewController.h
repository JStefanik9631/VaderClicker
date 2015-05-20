//
//  LevelSelectViewController.h
//  SJFinal
//
//  Created by Student on 5/6/15.
//  Copyright (c) 2015 shp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LevelSelectViewController : UIViewController

@property int level;
@property (strong, nonatomic) IBOutlet UITextField *levelNumber;


- (IBAction)setLevel:(id)sender;

@end
