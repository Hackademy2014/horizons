//
//  NHNewsViewController.h
//  New Horizons
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWFeedParser.h"

@interface NHNewsViewController : UIViewController <MWFeedParserDelegate>{
    //Parsing
	MWFeedParser *newsParser;
	NSMutableArray *parsedItems;
	
	//Displaying
	NSArray *itemsToDisplay;
	NSDateFormatter *formatter;
}
@property (nonatomic, strong) NSArray *itemsToDisplay;
@property (weak, nonatomic) IBOutlet UITableView *newsList;
@end
