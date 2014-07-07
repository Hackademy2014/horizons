//
//  NHHoursViewController.m
//  New Horizons
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Dyn. All rights reserved.
//
#import "NHCommon.h"
#import "NHHoursViewController.h"

@interface NHHoursViewController ()

@end

@implementation NHHoursViewController
@synthesize json;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.navigationController.navigationBar.translucent = NO;
	self.navigationController.navigationBar.hidden = NO;
	
    //Get hours
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSError *internetError;
		NSData *data = [NSData dataWithContentsOfURL:kHoursUrl options:kNilOptions error:&internetError];
		if( internetError ){
			data = nil;
			data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource: @"Hours" ofType: @"json"]];
		}
        [self performSelectorOnMainThread:@selector(fetchedData:)
							   withObject:data waitUntilDone:YES];
    });
}

//Data has been downloaded
- (void)fetchedData:(NSData *)responseData {
    NSError* error;
    NSDictionary* data = [NSJSONSerialization
						  JSONObjectWithData:responseData
						  options:kNilOptions
						  error:&error];
	
    json = [data objectForKey:@"hours"];
	
	//Reload list
	float nextY = 0.0;
	for( NSDictionary *group in json ){
		if( nextY != 0.0 ) nextY += ( kHoursHeaderHeight / 2 );
		//Creater header label
		UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, nextY, self.content.frame.size.width, kHoursHeaderHeight)];
		nextY += kHoursHeaderHeight;
		headerLabel.backgroundColor = kClear;
		headerLabel.textColor = kHoursHeaderColor;
		headerLabel.font = kHoursHeaderFont;
		headerLabel.text = [group objectForKey:@"name"];
		headerLabel.textAlignment = NSTextAlignmentCenter;
		[self.content addSubview:headerLabel];
		
		for( NSString *line in [group objectForKey:@"content"] ){
			UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, nextY, self.content.frame.size.width, kHoursTextHeight)];
			nextY += kHoursTextHeight;
			lineLabel.backgroundColor = kClear;
			lineLabel.textColor = kHoursTextColor;
			lineLabel.font = kHoursTextFont;
			lineLabel.text = line;
			lineLabel.textAlignment = NSTextAlignmentCenter;
			[self.content addSubview:lineLabel];
		}
	}
	self.content.delegate = self;
	self.content.scrollEnabled = YES;
	self.content.contentSize = CGSizeMake(self.content.frame.size.width, ( ( nextY * 2 ) + 50 ));
}

@end
