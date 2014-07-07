//
//  NHEventsItemViewController.m
//  New Horizons
//
//  Created by Joseph Morrill on 7/5/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//
#import "NHCommon.h"
#import "NHEventsItemViewController.h"

@interface NHEventsItemViewController ()

@end

@implementation NHEventsItemViewController
@synthesize item, contentView;


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.navigationController.navigationBar.translucent = NO;
	self.navigationController.navigationBar.hidden = NO;
	
	NSString *content = [kWebContentStyle stringByAppendingString:[item summary]];
	[contentView loadHTMLString:content baseURL:kEventsBaseUrl];
}

@end
