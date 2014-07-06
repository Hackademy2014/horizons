//
//  NHContactViewController.h
//  New Horizons
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollapseClick.h"
@interface NHContactViewController : UIViewController <CollapseClickDelegate>{
	__weak IBOutlet CollapseClick *contactList;
}
@property (weak, nonatomic) IBOutlet UINavigationItem *ContactNavigationBar;
@end
