//
//  SettingsViewController.m
//  TipperOC
//
//  Created by Xiangyu Zhang on 1/19/15.
//  Copyright (c) 2015 Yahoo!. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
@property (weak, nonatomic) IBOutlet UISegmentedControl *startControl;

-(void) updateSettingRecord;
- (IBAction)onSelectionChanged:(id)sender;
- (IBAction)onValueChanged:(id)sender;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil];
    if (self){
        self.title = @"Settings";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) updateSettingRecord{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *startValues = @[@(0), @(10), @(15), @(20)];
    int startValue = [startValues[self.startControl.selectedSegmentIndex] intValue];
    NSLog(@"check startValue before we store it: the int value will be stored is %i", startValue);
    [defaults setInteger:startValue forKey:@"rangeStartValue"];
    [defaults synchronize];
    startValue = (int)[defaults integerForKey:@"rangeStartValue"];
    NSLog(@"check if setting has stored: the int value stored was %i", startValue);
}

- (IBAction)onSelectionChanged:(id)sender {
    [self updateSettingRecord];
}

- (IBAction)onValueChanged:(id)sender {
    [self updateSettingRecord];
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
