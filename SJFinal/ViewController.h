//
//  ViewController.h
//  SJFinal
//
//  Created by Student on 5/6/15.
//  Copyright (c) 2015 shp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *goldValue;
@property (weak, nonatomic) IBOutlet UILabel *monsterHealth;
@property int attackDMG;
@property int level;
@property int damageUpgradeLevel;
@property int goldUpgradeLevel;
@property double monsterHP;
@property double goldDropped;
@property int gold;
@property (strong, nonatomic) IBOutlet UILabel *goldUpgradeCost;
@property (strong, nonatomic) IBOutlet UILabel *damageUpgradeCost;
@property int killCount;
@property int x;

- (IBAction)levelOne:(id)sender;
- (IBAction)levelTwo:(id)sender;
- (IBAction)levelThree:(id)sender;
- (IBAction)levelFour:(id)sender;
- (IBAction)levelFive:(id)sender;
- (IBAction)Attack:(id)sender;
- (IBAction)GoldUpgrade:(id)sender;
- (IBAction)DamageUpgrade:(id)sender;
- (IBAction)Info:(id)sender;
- (IBAction)tweetTapped:(id)sender;

@end