//
//  NHMain.m
//  New Horizons
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

#import "NHMain.h"
#import "NHDonate.h"

@interface NHMain ()

@end

@implementation NHMain

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
    
    //hide nav bar
    self.navigationController.navigationBar.hidden = YES;
    
    //-------------------------------------------------------------------------------------------
    //
    //making the buttons awesome - gradient buttons
    //
    //-------------------------------------------------------------------------------------------
    
        NSArray *buttons = [NSArray arrayWithObjects: self.btnDonations, self.btnVolunteer, self.btnHours,self.btnEvents,self.btnNews, self.btnContact, nil];
    

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
         (id)[[UIColor colorWithRed:29.0f / 255.0f green:88.0f / 255.0f blue:164.0f / 255.0f alpha:1.0f] CGColor],
         (id)[[UIColor colorWithRed:51.0f / 255.0f green:51.0f / 255.0f blue:51.0f / 255.0f alpha:1.0f] CGColor],
         nil];
         [btn.layer insertSublayer:btnGradient atIndex:0];
         
         // Round button corners
         CALayer *btnLayer = [btn layer];
         [btnLayer setMasksToBounds:YES];
         [btnLayer setCornerRadius:5.0f];
         
         // Apply a 1 pixel, black border around Buy Button
         [btnLayer setBorderWidth:1.0f];
         [btnLayer setBorderColor:[[UIColor blackColor] CGColor]];
         }  //end for
    
    //---------------------------end of awesome button making-----------------------------------------
    
    
}//end of viewDidLoad

//to have it hide the nav bar on the main page,
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
 
}


@end
