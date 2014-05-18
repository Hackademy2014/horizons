//
//  NHContactViewController.h
//  New Horizons
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHContactViewController : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btnFacebook;
@property (weak, nonatomic) IBOutlet UIScrollView *sclView;
@property (weak, nonatomic) IBOutlet UIWebView *wvContacts;
- (IBAction)openFacebookPage:(id)sender;
@end
