//
//  NHSetReminderViewController.m
//  New Horizons
//
//  Created by Joseph Morrill on 5/23/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

#import "NHCommon.h"
#import "NHSetReminderViewController.h"

@interface NHSetReminderViewController ()

@end

@implementation NHSetReminderViewController
@synthesize items;

- (IBAction)saveReminder:(id)sender{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
	
	notification.fireDate = [self.datePicker date];
	notification.alertBody = [@"Please drop off these items at New Horizons:\n" stringByAppendingString:items];
    notification.soundName = UILocalNotificationDefaultSoundName;
	notification.timeZone = [NSTimeZone defaultTimeZone];
	
	[[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.itemList.text = items;
    self.itemList.textColor = [UIColor orangeColor];
    self.itemList.font = [UIFont fontWithName:@"Papyrus" size:16.0];
    self.itemList.scrollEnabled = YES;
    self.itemList.userInteractionEnabled = YES;
    self.itemList.editable = NO;
}

@end
