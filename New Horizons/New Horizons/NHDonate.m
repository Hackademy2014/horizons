//
//  NHDonate.m
//  New Horizons
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//
#import "NHCommon.h"
#import "NHDonate.h"

@interface NHDonate ()

@end

@implementation NHDonate

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     //makes sure the navigation bar is showing on this page
       self.navigationController.navigationBar.hidden = NO;
    
    NSArray *buttons = [NSArray arrayWithObjects: self.btnWishList, self.btnMoney, nil];
    styleButtonsWithGradient(buttons, 251, 186, 84, 1.0f, 249, 139, 60, 1.0f, 5.0f, 0.0f, [UIColor blackColor], [UIColor whiteColor], [UIColor blackColor], @"HelveticaNeue-Bold", 16.0f);


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openDonatePage:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://htmlpreview.github.io/?https://github.com/Hackademy2014/horizons/blob/master/New%20Horizons/paypal.html"]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
