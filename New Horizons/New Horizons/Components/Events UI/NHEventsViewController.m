//
//  NHEventsViewController.m
//  New Horizons
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

#import "NHEventsViewController.h"
#import "NHEventsItemViewController.h"
#import "NHCommon.h"
#import "NSString+HTML.h"
#import "MWFeedParser.h"

@interface NHEventsViewController ()

@end

@implementation NHEventsViewController
@synthesize itemsToDisplay;

- (void)viewDidLoad
{
	[super viewDidLoad];
    // Do any additional setup after loading the view.
	self.navigationController.navigationBar.translucent = NO;
	self.navigationController.navigationBar.hidden = NO;
	
	//Setup
	self.title = @"Loading...";
	formatter = [[NSDateFormatter alloc] init];
	[formatter setDateStyle:NSDateFormatterShortStyle];
	[formatter setTimeStyle:NSDateFormatterShortStyle];
	parsedItems = [[NSMutableArray alloc] init];
	self.itemsToDisplay = [NSArray array];
	
	//Create refresh button
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
																						   target:self
																						   action:@selector(refresh)];
	
	//Parse
	newsParser = [[MWFeedParser alloc] initWithFeedURL:kEventsFeedUrl];
	newsParser.delegate = self;
	newsParser.feedParseType = ParseTypeFull;
	newsParser.connectionType = ConnectionTypeAsynchronously;
	[newsParser parse];
}

//Refresh the feed
- (void)refresh{
	self.title = @"Refreshing...";
	[parsedItems removeAllObjects];
	[newsParser stopParsing];
	[newsParser parse];
	self.newsList.userInteractionEnabled = NO;
	self.newsList.alpha = 0.3;
}

//Redraw table using feed data
- (void)updateTableWithParsedItems{
	self.itemsToDisplay = [parsedItems sortedArrayUsingDescriptors:[NSArray arrayWithObject:[[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO]]];
	self.newsList.userInteractionEnabled = YES;
	self.newsList.alpha = 1;
	[self.newsList reloadData];
}

//Set the title of the navigation bar
- (void)feedParser:(MWFeedParser *)parser didParseFeedInfo:(MWFeedInfo *)info{
	self.title = @"Events";
}

//Add parsed item to data array
- (void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item{
	if( item) [parsedItems addObject:item];
}

//Parser has finished, so redraw table
- (void)feedParserDidFinish:(MWFeedParser *)parser{
	[self updateTableWithParsedItems];
}

//Show an error message if an error occurs
- (void)feedParser:(MWFeedParser *)parser didFailWithError:(NSError *)error{
	NSLog(@"Finished Parsing With Error: %@", error);
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed to load"
													message:@"No Internet connection"
												   delegate:nil
										  cancelButtonTitle:@"Dismiss"
										  otherButtonTitles:nil];
	[alert show];
	[self updateTableWithParsedItems];
}

//Table setup
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return itemsToDisplay.count;
}

//Create cells for each item
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
	// Configure the cell.
	MWFeedItem *item = [itemsToDisplay objectAtIndex:indexPath.row];
	if (item) {
		
		// Process
		NSString *itemTitle = item.title ? [item.title stringByConvertingHTMLToPlainText] : @"[No Title]";
		NSString *itemSummary = item.summary ? [item.summary stringByConvertingHTMLToPlainText] : @"[No Summary]";
		
		// Set
		cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
		cell.textLabel.text = itemTitle;
		NSMutableString *subtitle = [NSMutableString string];
		if (item.date) [subtitle appendFormat:@"%@: ", [formatter stringFromDate:item.date]];
		[subtitle appendString:itemSummary];
		cell.detailTextLabel.text = subtitle;
		
	}
	
	//Color cell
	styleTableCell(cell);
    return cell;
}

//Handle clicks on cells
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	// Show detail
	NHEventsItemViewController *detailView = [self.storyboard instantiateViewControllerWithIdentifier:@"EventsItemController"];
	detailView.item = (MWFeedItem *)[itemsToDisplay objectAtIndex:indexPath.row];
	[self.navigationController pushViewController:detailView animated:YES];
	
	// Deselect
	[self.newsList deselectRowAtIndexPath:indexPath animated:YES];
	
}

@end
