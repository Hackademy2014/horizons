//
//  NHVolViewController.h
//  New Horizons
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHVolViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btnVolNow;
@property (weak, nonatomic) IBOutlet UILabel *lblVol;
- (IBAction)openVolunteerLink:(id)sender;
@end
