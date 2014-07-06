//
//  NHHoursViewController.h
//  New Horizons
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHHoursViewController : UIViewController <UIScrollViewDelegate>{
	NSArray *json;
}
@property (nonatomic, strong) NSArray *json;
@property (strong, nonatomic) IBOutlet UIScrollView *content;
@end
