//
//  NHWishListViewController.m
//  New Horizons
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

#import "NHWishListViewController.h"
#import "NHCommon.h"
#import "NHSetReminderViewController.h"
@interface NHWishListViewController ()

@end

@implementation NHWishListViewController
@synthesize json;

//Initiate JSON fetch from GitHub
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.navigationController.navigationBar.translucent = NO;
	self.navigationController.navigationBar.hidden = NO;
	
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSError *internetError;
		NSData *data = [NSData dataWithContentsOfURL:kDonateWishListUrl options:kNilOptions error:&internetError];
		if( internetError ){
			data = nil;
			data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource: @"WishList" ofType: @"json"]];
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
	
    json = [data objectForKey:@"wishList"];
	[self.wishList reloadData];
}

//Number of sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return [json count];
}

//Number of rows for a specific section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return [[[json objectAtIndex:section] objectForKey:@"items"] count];
}

//Name of specific section
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
	return [[json objectAtIndex:section] objectForKey:@"name"];
}

//Style section with view
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
	//Create header cell
	UIView *newHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, kDonateWishListHeaderHeight)];
	styleViewWithGradient(newHeader, kBlueGradient);
	
	//Create header label
	UILabel *newLabel = [[UILabel alloc] init];
	newLabel.frame = CGRectMake(5, 2, tableView.frame.size.width - 5, kDonateWishListHeaderLabelHeight);
	newLabel.backgroundColor = kClear;
	newLabel.textColor = kWhite;
	newLabel.font = [UIFont boldSystemFontOfSize:14.0];
	newLabel.text = [[json objectAtIndex:section] objectForKey:@"name"];
	newLabel.textAlignment = NSTextAlignmentLeft;
	[newHeader addSubview:newLabel];
	
	return newHeader;
}

//Get cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WishListCell"];
	cell.textLabel.text = [[[json objectAtIndex:indexPath.section] objectForKey:@"items"] objectAtIndex:indexPath.item];
    return cell;
}

//Check if cells are selected. If not, don't show set reminder view
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
	BOOL allow = YES;
	if( [identifier isEqualToString:@"SetWishListReminder"] ){
		if( [[[self wishList] indexPathsForSelectedRows] count] == 0 ){
			allow = NO;
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No items selected"
															message:@"Tap some items to select them to be reminded about"
														   delegate:nil
												  cancelButtonTitle:@"Dismiss"
												  otherButtonTitles:nil];
			[alert show];
		}
	}
	return allow;
}

//Send selected cells to set reminder page
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([[segue identifier] isEqualToString:@"SetWishListReminder"]) {
		
        // Get destination view
        NHSetReminderViewController *vc = [segue destinationViewController];
		NSMutableArray *selectedItems = [[NSMutableArray alloc]init];
		NSString *itemPrefix = @"-";
		
		NSArray *cells = [[self wishList] indexPathsForSelectedRows];
		for( int i = 0; i < [cells count]; i++ ){
			NSIndexPath *cell = [cells objectAtIndex:i];
			NSString *cellText =[[[json objectAtIndex:cell.section] objectForKey:@"items"] objectAtIndex:cell.item];
			[selectedItems addObject:[itemPrefix stringByAppendingString:cellText]];
		}
		
		vc.items = [selectedItems componentsJoinedByString:@"\n"];
    }
}
@end
