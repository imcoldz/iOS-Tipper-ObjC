//
//  ViewController.m
//  TipperOC
//
//  Created by Xiangyu Zhang on 1/19/15.
//  Copyright (c) 2015 Yahoo!. All rights reserved.
//

#import "ViewController.h"
#import "SettingsViewController.h"

@interface ViewController ()
- (IBAction)onEditChanged:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *billField;
- (IBAction)onTap:(id)sender;
- (void) updateValues;
@property (weak, nonatomic) IBOutlet UILabel *tipPercentageLabel;

- (IBAction)slideChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *tipSlider;

@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *billAmountLabel;

- (IBAction)touchDownAction:(id)sender;

-(void) onSettingsButton;
-(void) updateSliderValue;
-(void) showAnimation;

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil];
    if (self){
        self.title = @"Tipper";
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [self updateSliderValue];
    [self updateValues];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    
    if([self.billField canBecomeFirstResponder]){
        [self.billField becomeFirstResponder];
    }
    
    [self updateSliderValue];
    [self updateValues];
    //[self showAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [[self view ] endEditing:YES];
    [self updateValues];
}

- (void) updateValues{
    float billAmount = [self.billField.text floatValue];
    float tipPercentage = self.tipSlider.value;
    float tipAmount = billAmount*tipPercentage/100;
    float totalAmount = billAmount + tipAmount;
    self.tipPercentageLabel.text = [NSString stringWithFormat:@"%%%.2f", tipPercentage];
    self.tipAmountLabel.text = [NSString stringWithFormat:@"$%.2f", tipAmount];
    self.totalAmountLabel.text = [NSString stringWithFormat:@"$%.2f", totalAmount];
}
- (IBAction)slideChanged:(id)sender {
    [self updateValues];
}
- (IBAction)onEditChanged:(id)sender {
    [self updateValues];
}

- (IBAction)touchDownAction:(id)sender {
    [self showAnimation];
}

- (void) onSettingsButton{
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}
- (void) updateSliderValue{
    // reading setting record to set the initial value of tipSlider:
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int startValue = (int)[defaults integerForKey:@"rangeStartValue"];
    NSLog(@"%i", startValue);
    if (startValue !=0){
        self.tipSlider.value = (startValue);
    }
}

- (void) showAnimation{
    // Optionally initialize the property to a desired starting value
    self.billAmountLabel.alpha = 1;
    [UIView animateWithDuration:4 animations:^{
        // This causes first view to fade in and second view to fade out
        self.billAmountLabel.alpha = 0;
    } completion:^(BOOL finished) {
        // Do something here when the animation finishes.
    }];
}

@end
