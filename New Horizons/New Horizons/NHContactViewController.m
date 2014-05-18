//
//  NHContactViewController.m
//  New Horizons
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

#import "NHContactViewController.h"

@interface NHContactViewController ()

@end

@implementation NHContactViewController

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
    // Do any additional setup after loading the view.
    [self.sclView setScrollEnabled:true];
    [self.sclView setContentSize:CGSizeMake(320,712)];
     self.navigationController.navigationBar.hidden = NO;
    self.wvContacts.delegate = self;
    
    //Set contact information
    NSString *content = @"";
    
    //Style
    content = [content stringByAppendingString:@"<style>"];
    content = [content stringByAppendingString:@"body{"];
    content = [content stringByAppendingString:@"background-color:#f9f3d9;"];
    content = [content stringByAppendingString:@"font-family:Papyrus,Times,Times New Roman,sans-serif;"];
    content = [content stringByAppendingString:@"font-size:17px;"];
    content = [content stringByAppendingString:@"text-align:center;"];
    content = [content stringByAppendingString:@"}"];
    content = [content stringByAppendingString:@".contact{"];
    content = [content stringByAppendingString:@"margin-bottom:40px;"];
    content = [content stringByAppendingString:@"}"];
    content = [content stringByAppendingString:@"p{"];
    content = [content stringByAppendingString:@"margin:0;"];
    content = [content stringByAppendingString:@"}"];
    content = [content stringByAppendingString:@".heading{"];
    content = [content stringByAppendingString:@"font-family:Times,Times New Roman,sans-serif;"];
    content = [content stringByAppendingString:@"font-weight:bold;"];
    content = [content stringByAppendingString:@"color:#EA8847;"];
    content = [content stringByAppendingString:@"}"];
    content = [content stringByAppendingString:@"</style>"];
    
    //Main contact
    content = [content stringByAppendingString:@"<div class='contact' id='main'>"];
        content = [content stringByAppendingString:@"<p class='heading'>New Horizons for New Hampshire</p>"];
        content = [content stringByAppendingString:@"<p class='address'>199 Manchester Street<br>Manchester, NH 03103</p>"];
        content = [content stringByAppendingString:@"<p class='phone'>Phone: 603-668-1877</p>"];
        content = [content stringByAppendingString:@"<p class='fax'>Fax: 603-668-2578</p>"];
    content = [content stringByAppendingString:@"</div><!-- div#main.contact -->"];
    
    //Angie's
    content = [content stringByAppendingString:@"<div class='contact' id='angies'>"];
    content = [content stringByAppendingString:@"<p class='heading'>Angie's</p>"];
    content = [content stringByAppendingString:@"<p class='address'>434 Union Street<br>Manchester, NH 03103</p>"];
    content = [content stringByAppendingString:@"<p class='phone'>Phone: 603-668-8698</p>"];
    content = [content stringByAppendingString:@"</div><!-- div#angies.contact -->"];
    
    //Executive Director
    content = [content stringByAppendingString:@"<div class='contact' id='execdir'>"];
    content = [content stringByAppendingString:@"<p class='heading'>Executive Director</p>"];
    content = [content stringByAppendingString:@"<p class='name'>Charlie Sherman</p>"];
    content = [content stringByAppendingString:@"<p class='phone'>Phone: <a href='telprompt://6036681877P114'>x114</a></p>"];
    content = [content stringByAppendingString:@"<p class='email'>Email: <a href='mailto:Charlie.Sherman@newhorizonsfornh.org'>Charlie.Sherman@newhorizonsfornh.org</a></p>"];
    content = [content stringByAppendingString:@"</div><!-- div#execdir.contact -->"];
    
    //Finance Manager
    content = [content stringByAppendingString:@"<div class='contact' id='finmgr'>"];
    content = [content stringByAppendingString:@"<p class='heading'>Financial Manager</p>"];
    content = [content stringByAppendingString:@"<p class='name'>Gail Yorkell</p>"];
    content = [content stringByAppendingString:@"<p class='phone'>Phone: <a href='telprompt://6036681877P119'>x119</a></p>"];
    content = [content stringByAppendingString:@"<p class='email'>Email: <a href='mailto:Finance01@newhorizonsfornh.org'>Finance01@newhorizonsfornh.org</a></p>"];
    content = [content stringByAppendingString:@"</div><!-- div#finmgr.contact -->"];
    
    //Program Director
    content = [content stringByAppendingString:@"<div class='contact' id='prgmdir'>"];
    content = [content stringByAppendingString:@"<p class='heading'>Program Director</p>"];
    content = [content stringByAppendingString:@"<p class='name'>Kevin Kintner</p>"];
    content = [content stringByAppendingString:@"<p class='phone'>Phone: <a href='telprompt://6036681877P115'>x115</a></p>"];
    content = [content stringByAppendingString:@"<p class='email'>Email: <a href='mailto:Kevin.Kintner@newhorizonsfornh.org'>Kevin.Kintner@newhorizonsfornh.org</a></p>"];
    content = [content stringByAppendingString:@"</div><!-- div#prgrmdir.contact -->"];
    
    //Food Service
    content = [content stringByAppendingString:@"<div class='contact' id='fdsrvc'>"];
    content = [content stringByAppendingString:@"<p class='heading'>Food Service &amp; Volunteer Manager</p>"];
    content = [content stringByAppendingString:@"<p class='name'>Mary K. Silva</p>"];
    content = [content stringByAppendingString:@"<p class='phone'>Phone: <a href='telprompt://6036681877P122'>x122</a></p>"];
    content = [content stringByAppendingString:@"<p class='email'>Email: <a href='mailto:Mary.Silva@newhorizonsfornh.org'>Mary.Silva@newhorizonsfornh.org</a></p>"];
    content = [content stringByAppendingString:@"</div><!-- div#fdsrvc.contact -->"];
    
    //Development Director
    content = [content stringByAppendingString:@"<div class='contact' id='devdir'>"];
    content = [content stringByAppendingString:@"<p class='heading'>Development Director</p>"];
    content = [content stringByAppendingString:@"<p class='name'>Michelle Casale</p>"];
    content = [content stringByAppendingString:@"<p class='phone'>Phone: <a href='telprompt://6036681877P125'>x125</a></p>"];
    content = [content stringByAppendingString:@"<p class='email'>Email: <a href='mailto:Michelle.Casale@newhorizonsfornh.org'>Michelle.Casale@newhorizonsfornh.org</a></p>"];
    content = [content stringByAppendingString:@"</div><!-- div#devdir.contact -->"];
    
    //Angie's Program Manager
    content = [content stringByAppendingString:@"<div class='contact' id='angprgmmng'>"];
    content = [content stringByAppendingString:@"<p class='heading'>Angie's Program Manager</p>"];
    content = [content stringByAppendingString:@"<p class='name'>Cheryl Hunt</p>"];
    content = [content stringByAppendingString:@"<p class='phone'>Phone: 603-668-8698</p>"];
    content = [content stringByAppendingString:@"<p class='email'>Email: <a href='mailto:angies@newhorizonsfornh.org'>angies@newhorizonsfornh.org</a></p>"];
    content = [content stringByAppendingString:@"</div><!-- div#angprgmmng.contact -->"];
    
    [self.wvContacts loadHTMLString:content baseURL:nil];
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

- (IBAction)openFacebookPage:(id)sender{
    NSURL *fanPageURL = [NSURL URLWithString:@"fb://profile/110158789013645"];
    if (![[UIApplication sharedApplication] canOpenURL:fanPageURL]){
        fanPageURL =   [ NSURL URLWithString:@"https://www.facebook.com/NewHorizonsNH"];
    }
    [[UIApplication sharedApplication] openURL:fanPageURL];
}

@end
