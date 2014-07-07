//
//  NHContactViewController.m
//  New Horizons
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//
#import "NHCommon.h"
#import "NHContactViewController.h"
#import "TaggedTap.h"

@interface NHContactViewController ()

@end

@implementation NHContactViewController{
	NSArray *organizations;
	NSArray *people;
}

//Button handlers
-(void)scrollToTop:(UIButton *)sender{
	[contactList setContentOffset:CGPointMake(0, -120)];
}

//New Horizons FB button handler
- (IBAction)openFacebookPage:(id)sender{
    NSURL *pageUrl = [NSURL URLWithString:@"fb://profile/110158789013645"];
    if (![[UIApplication sharedApplication] canOpenURL:pageUrl]){
        pageUrl =   [ NSURL URLWithString:@"https://www.facebook.com/NewHorizonsNH"];
    }
    [[UIApplication sharedApplication] openURL:pageUrl];
}

//Call contact handler
- (IBAction)callContact:(id)sender{
	NSString *number = [sender tapData];
    NSURL *callUrl = [NSURL URLWithString:[@"tel:" stringByAppendingString:number]];
    if ([[UIApplication sharedApplication] canOpenURL:callUrl]){
		[[UIApplication sharedApplication] openURL:callUrl];
    }
}

//Email contact handler
- (IBAction)emailContact:(id)sender{
	NSString *email = [sender tapData];
    NSURL *emailUrl = [NSURL URLWithString:[@"mailto:" stringByAppendingString:email]];
    if ([[UIApplication sharedApplication] canOpenURL:emailUrl]){
		[[UIApplication sharedApplication] openURL:emailUrl];
    }
}

//View has loaded, so download contact data and draw it
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.navigationController.navigationBar.translucent = NO;
	self.navigationController.navigationBar.hidden = NO;
	
    //Get contact information
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSError *internetError;
		NSData *data = [NSData dataWithContentsOfURL:kContactsUrl options:kNilOptions error:&internetError];
		if( internetError ){
			data = nil;
			data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource: @"Contacts" ofType: @"json"]];
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
	
    organizations = [data objectForKey:@"organizations"];
	people = [data objectForKey:@"people"];
	
	//Reload list
	contactList.CollapseClickDelegate = self;
	[contactList reloadCollapseClick];
	contactList.contentSize = CGSizeMake(contactList.frame.size.width, ( contactList.frame.size.height + 100 ));
}

-(int)numberOfCellsForCollapseClick{
	return (int)[organizations count] + (int)[people count];
}

-(NSString *)titleForCollapseClickAtIndex:(int)index{
	NSInteger selected = 0;
	NSUInteger organizationCount = [organizations count];
	NSString *title = @"";
	
	if( index > ((int)organizationCount - 1) ){
		//Is Person
		selected = index - organizationCount;
		title = [[people objectAtIndex:selected] objectForKey:@"position"];
	}else{
		//Is Organization
		selected = index;
		title = [[organizations objectAtIndex:selected] objectForKey:@"name"];
	}
	
	return title;
}

-(UIView *)viewForCollapseClickContentViewAtIndex:(int)index{
	NSInteger selected = 0;
	NSUInteger organizationCount = [organizations count];
	NSString *type = @"";
	NSDictionary *data;
	
	if( index > ((int)organizationCount - 1) ){
		//Is Person
		type = @"Person";
		selected = index - organizationCount;
		data = [people objectAtIndex:selected];
	}else{
		//Is Organization
		type = @"Organization";
		selected = index;
		data = [organizations objectAtIndex:selected];
	}
	UIView *newCard = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, kContactsCardHeight)];
	newCard.backgroundColor=[UIColor clearColor];
	
	float nextY = 0.0;
	bool hasAddress = [data valueForKey:@"address"];
	bool hasFax = [data valueForKey:@"fax"];
	bool hasEmail = [data valueForKey:@"email"];
	
	UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5.0, nextY, newCard.frame.size.width, 20.0)];
	nextY += 20.0;
	nameLabel.backgroundColor = [UIColor clearColor];
	nameLabel.textColor = [UIColor blackColor];
	nameLabel.font = [UIFont boldSystemFontOfSize:15];
	nameLabel.text = [data objectForKey:@"name"];
	[newCard addSubview:nameLabel];
	
	if( hasAddress ){
		NSArray *addressLines = [data objectForKey:@"address"];
		for( int i = 0; i < [addressLines count]; i++ ){
			UILabel *addressLine = [[UILabel alloc] initWithFrame:CGRectMake(5.0, nextY, newCard.frame.size.width, 20.0)];
			nextY += 15.0;
			addressLine.backgroundColor = [UIColor clearColor];
			addressLine.textColor = [UIColor blackColor];
			addressLine.font = [UIFont systemFontOfSize:15];
			addressLine.text = [addressLines objectAtIndex:i];
			[newCard addSubview:addressLine];
		}
		nextY += 5.0;
	}
	
	UILabel *phoneNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(5.0, nextY, ( newCard.frame.size.width - 60.0 ), 20.0)];
	NSString *phoneDisplay = [[data objectForKey:@"phone"] objectForKey:@"display"];
	phoneNumberLabel.backgroundColor = [UIColor clearColor];
	phoneNumberLabel.textColor = [UIColor blackColor];
	phoneNumberLabel.font = [UIFont systemFontOfSize:15];
	phoneNumberLabel.text = ( hasFax ) ? [@"Phone: " stringByAppendingString:phoneDisplay] : phoneDisplay;
	[newCard addSubview:phoneNumberLabel];
	
	UIImageView *phoneNumberButton = [[UIImageView alloc] initWithFrame:CGRectMake(( newCard.frame.size.width - 40.0 ), 10.0, 30.0, 30.0)];
	nextY += 20.0;
	phoneNumberButton.image = [UIImage imageNamed:@"phone.png"];
	phoneNumberButton.contentMode = UIViewContentModeScaleAspectFit;
    phoneNumberButton.clipsToBounds = YES;
	//Action for button
	TaggedTap *phoneTap = [[TaggedTap alloc] initWithTarget:self action:@selector(callContact:)];
    phoneTap.numberOfTapsRequired = 1;
	phoneTap.tapData = [[data objectForKey:@"phone"] objectForKey:@"numeric"];
    phoneNumberButton.userInteractionEnabled = YES;
    [phoneNumberButton addGestureRecognizer:phoneTap];
	[newCard addSubview:phoneNumberButton];
	
	if( hasFax ){
		UILabel *faxNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(5.0, nextY, newCard.frame.size.width, 20.0)];
		nextY += 20.0;
		faxNumberLabel.backgroundColor = [UIColor clearColor];
		faxNumberLabel.textColor = [UIColor blackColor];
		faxNumberLabel.font = [UIFont systemFontOfSize:15];
		faxNumberLabel.text = ( hasFax ) ? [@"Fax: " stringByAppendingString:[data objectForKey:@"fax"]] : [data objectForKey:@"fax"];
		[newCard addSubview:faxNumberLabel];
	}
	
	if( hasEmail ){
		UILabel *emailLabel = [[UILabel alloc] initWithFrame:CGRectMake(5.0, nextY, newCard.frame.size.width, 20.0)];
		emailLabel.backgroundColor = [UIColor clearColor];
		emailLabel.textColor = [UIColor blackColor];
		emailLabel.font = [UIFont systemFontOfSize:15];
		emailLabel.text = [data objectForKey:@"email"];
		[newCard addSubview:emailLabel];
		
		UIImageView *emailButton = [[UIImageView alloc] initWithFrame:CGRectMake(( newCard.frame.size.width - 40.0 ), 60.0, 30.0, 30.0)];
		emailButton.image = [UIImage imageNamed:@"email.png"];
		emailButton.contentMode = UIViewContentModeScaleAspectFit;
		emailButton.clipsToBounds = YES;
		//Action for button
		TaggedTap *emailTap = [[TaggedTap alloc] initWithTarget:self action:@selector(emailContact:)];
		emailTap.numberOfTapsRequired = 1;
		emailTap.tapData = [data objectForKey:@"email"];
		emailButton.userInteractionEnabled = YES;
		[emailButton addGestureRecognizer:emailTap];
		[newCard addSubview:emailButton];
	}
	
	//If New Horizons card, add the facebook button
	if( [type isEqualToString:@"Organization"] && [[data objectForKey:@"name"] isEqualToString:@"New Horizons"] ){
		UIImageView *fbButton = [[UIImageView alloc] initWithFrame:CGRectMake(( newCard.frame.size.width - 40.0 ), 60.0, 30.0, 30.0)];
		fbButton.image = [UIImage imageNamed:@"facebook.png"];
		fbButton.contentMode = UIViewContentModeScaleAspectFit;
		fbButton.clipsToBounds = YES;
		//Action for button
		UITapGestureRecognizer *fbTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openFacebookPage:)];
		fbTap.numberOfTapsRequired = 1;
		fbButton.userInteractionEnabled = YES;
		[fbButton addGestureRecognizer:fbTap];
		[newCard addSubview:fbButton];
	}
	
	//Last
	[self.view addSubview:newCard];
	return newCard;
}
@end
