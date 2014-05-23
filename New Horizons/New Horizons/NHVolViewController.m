//
//  NHVolViewController.m
//  New Horizons
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

#import "NHCommon.h"
#import "NHVolViewController.h"

@interface NHVolViewController ()

@end

@implementation NHVolViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = NO;
    
    NSArray *buttons = [NSArray arrayWithObjects: self.btnVolNow, nil];
    styleButtonsWithGradient(buttons, 251, 186, 84, 1.0f, 249, 139, 60, 1.0f, 5.0f, 0.0f, [UIColor blackColor], [UIColor whiteColor], [UIColor blackColor], @"HelveticaNeue-Bold", 16.0f);

}

- (IBAction)openVolunteerLink:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://newhorizonsfornh.orgaction.com/org2/"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
