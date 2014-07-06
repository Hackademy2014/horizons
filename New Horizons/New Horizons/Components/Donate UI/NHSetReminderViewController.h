//
//  NHSetReminderViewController.h
//  New Horizons
//
//  Created by Joseph Morrill on 5/23/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHSetReminderViewController : UIViewController{
	NSString *items;
}
@property (nonatomic, strong) NSString *items;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *setReminderButton;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextView *itemList;
- (IBAction)saveReminder:(id)sender;
@end
