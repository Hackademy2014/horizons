//
//  NHDonate.m
//  New Horizons
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

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
    
    //-------------------------------------------------------------------------------------------
    //
    //making the buttons awesome - gradient buttons
    //
    //-------------------------------------------------------------------------------------------
    
    NSArray *buttons = [NSArray arrayWithObjects: self.btnWishList, self.btnMoney, nil];
    
    
    for(UIButton *btn in buttons)
    {
        
        // BEGIN WORKING FROM TUTORIAL HERE
        
        // Set the button Text Color
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        
        // Set default backgrond color
        [btn setBackgroundColor:[UIColor blackColor]];
        
        // Add Custom Font
        [[btn titleLabel] setFont:[UIFont fontWithName:@"Knewave" size:18.0f]];
        
        // Draw a custom gradient
        CAGradientLayer *btnGradient = [CAGradientLayer layer];
        btnGradient.frame = btn.bounds;
        btnGradient.colors = [NSArray arrayWithObjects:
                              (id)[[UIColor colorWithRed:248.0f / 255.0f green:154.0f / 255.0f blue:65.0f / 255.0f alpha:1.0f] CGColor],
                              (id)[[UIColor colorWithRed:254.0f / 255.0f green:213.0f / 255.0f blue:41.0f / 255.0f alpha:1.0f] CGColor],
                              nil];
        [btn.layer insertSublayer:btnGradient atIndex:0];
        
        // Round button corners
        CALayer *btnLayer = [btn layer];
        [btnLayer setMasksToBounds:YES];
        [btnLayer setCornerRadius:5.0f];
        
        // Apply a 1 pixel, black border around Buy Button
        [btnLayer setBorderWidth:1.0f];
        [btnLayer setBorderColor:[[UIColor orangeColor] CGColor]];
    }  //end for
    
    //---------------------------end of awesome button making-----------------------------------------
    
    
    
    // display directions to user
    self.lblDonateMessage.numberOfLines = 0;
            self.lblDonateMessage.text = @"If you would like to donate items and don’t know what we need, click on Wish List. If you just want to donate money now, click on Money.";


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
