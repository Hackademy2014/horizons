//
//  NHMain.m
//  New Horizons
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//
#import "NHCommon.h"
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
    
    NSArray *buttons = [NSArray arrayWithObjects: self.btnDonations, self.btnVolunteer, self.btnHours,self.btnEvents,self.btnNews, self.btnContact, nil];
    styleButtonsWithGradient(buttons, 120, 181, 246, 1.0f, 48, 102, 174, 1.0f, 5.0f, 0.0f, [UIColor blackColor], [UIColor whiteColor], [UIColor blackColor], @"HelveticaNeue-Bold", 16.0f);

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
