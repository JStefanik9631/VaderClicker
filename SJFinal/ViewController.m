//
//  ViewController.m
//  SJFinal
//
//  Created by Student on 5/6/15.
//  Copyright (c) 2015 shp. All rights reserved.
//

#import "ViewController.h"
#import "Audio.h"
@interface ViewController ()

@property (strong, nonatomic) Audio *audioController;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    self.audioController = [[Audio alloc] init];
    [self.audioController tryPlayMusic];
    _killCount = 0;
    _level = 1;
    _monsterHP = 15;
    _damageUpgradeLevel = 1;
    _goldUpgradeLevel = 1;
    _gold = 0;
    NSString *temp = [NSString stringWithFormat:@"%d", _gold];
    _goldValue.text = temp;

    temp = [NSString stringWithFormat:@"%.0f", _monsterHP];
    _monsterHealth.text = temp;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)levelOne:(id)sender
{
    _level = 1;
    _monsterHP = (10 * 1.5) * _level;
    NSString *temp = [NSString stringWithFormat:@"%.0f", _monsterHP];
    _monsterHealth.text = temp;
}

- (IBAction)levelTwo:(id)sender
{
    if (_killCount >= 10)
    {
        _level = 2;
        _monsterHP = (10 * 1.5) * _level;
        NSString *temp = [NSString stringWithFormat:@"%.0f", _monsterHP];
        _monsterHealth.text = temp;
    }
    
}

- (IBAction)levelThree:(id)sender {
    if (_killCount >= 20)
    {
    _level = 3;
    _monsterHP = (10 * 1.5) * _level;
    NSString *temp = [NSString stringWithFormat:@"%.0f", _monsterHP];
    _monsterHealth.text = temp;
    }
}

- (IBAction)levelFour:(id)sender {
    if (_killCount >= 30)
    {
    _level = 4;
    _monsterHP = (10 * 1.5) * _level;
    NSString *temp = [NSString stringWithFormat:@"%.0f", _monsterHP];
    _monsterHealth.text = temp;
    }
}
- (IBAction)levelFive:(id)sender {
    if (_killCount >= 40)
    {
    _level = 5;
    _monsterHP = (10 * 1.5) * _level;
    NSString *temp = [NSString stringWithFormat:@"%.0f", _monsterHP];
    _monsterHealth.text = temp;
    }
}

- (IBAction)Attack:(id)sender
{
    _attackDMG = (2.5 * 1.5) * _damageUpgradeLevel;
    
    _monsterHP -= _attackDMG;
    if (_monsterHP <= 0)
    {
        _killCount++;
        _gold += 3 * _level * _goldUpgradeLevel;
        NSString *temp = [NSString stringWithFormat:@"%d", _gold];
        _goldValue.text = temp;
        _monsterHP = (10 * 1.5) * _level;
        
    }
    NSString *temp = [NSString stringWithFormat:@"%.0f", _monsterHP];
    _monsterHealth.text = temp;
    
    
}

- (IBAction)GoldUpgrade:(id)sender {
    
    if(_gold >= (200*_goldUpgradeLevel))
    {
        _gold = _gold - (200*_goldUpgradeLevel);
    _goldUpgradeLevel++;
    NSString *temp = [NSString stringWithFormat:@"%d", _gold];
        _goldValue.text = temp;
        
        int temp2 = 200*_goldUpgradeLevel;
        temp = [NSString stringWithFormat:@"%d", temp2];
        _goldUpgradeCost.text = temp;
    }
    
}

- (IBAction)DamageUpgrade:(id)sender
{
    if(_gold >= (200*_damageUpgradeLevel))
    {
        _gold = _gold - (200*_damageUpgradeLevel);
        _damageUpgradeLevel++;
        NSString *temp = [NSString stringWithFormat:@"%d", _gold];
        _goldValue.text = temp;
        
        int temp2 = 200*_damageUpgradeLevel;
        temp = [NSString stringWithFormat:@"%d", temp2];
        _damageUpgradeCost.text = temp;
    }
}
@end
