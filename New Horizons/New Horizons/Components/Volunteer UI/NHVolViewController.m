//
//  NHVolViewController.m
//  New Horizons
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

#import "NHCommon.h"
#import "NHVolViewController.h"

@interface NHVolViewController ()

@end

@implementation NHVolViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    
    NSArray *buttons = [NSArray arrayWithObjects: self.btnVolNow, nil];
    styleButtonsWithGradient(buttons, kOrangeGradient, 5.0f, 0.0f, kBlack, kWhite, kBlack, @"HelveticaNeue-Bold", 16.0f);

}

- (IBAction)openVolunteerLink:(id)sender
{
    [[UIApplication sharedApplication] openURL:kVolunteerUrl];
}

@end
