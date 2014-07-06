//
//  NHEventsItemViewController.h
//  New Horizons
//
//  Created by Joseph Morrill on 7/5/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWFeedItem.h"

@interface NHEventsItemViewController : UIViewController<UIWebViewDelegate>{
	MWFeedItem *item;
	IBOutlet UIWebView *contentView;
}
@property (nonatomic, strong) MWFeedItem *item;
@property (nonatomic, retain) UIWebView *contentView;
@end
