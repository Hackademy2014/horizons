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


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.navigationController.navigationBar.translucent = NO;
	self.navigationController.navigationBar.hidden = NO;
    
    NSArray *buttons = [NSArray arrayWithObjects: self.btnWishList, self.btnMoney, nil];
    styleButtonsWithGradient(buttons, kOrangeGradient, 5.0f, 0.0f, kBlack, kWhite, kBlack, @"HelveticaNeue-Bold", 16.0f);


}

- (IBAction)openDonatePage:(id)sender
{
    [[UIApplication sharedApplication] openURL:kDonateUrl];
}

@end
