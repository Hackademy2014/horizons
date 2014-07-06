//
//  NHConstants.h
//  New Horizons
//
//  Created by Joseph Morrill on 7/5/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

//Constants
#define kYellow irgba(249, 243, 219, 1.0)
#define kOrange irgba(251, 181, 70, 1.0)
#define kBlue irgba(120, 181, 246, 1.0)
#define kOrangeGradient 251, 181, 70, 1.0, 247, 146, 68, 1.0
#define kBlueGradient 120, 181, 246, 1.0, 48, 102, 174, 1.0
#define kClear [UIColor clearColor]
#define kWhite [UIColor whiteColor]
#define kBlack [UIColor blackColor]

//Donate
#define kLocalPathWishList [[NSBundle mainBundle] pathForResource:@"WishList" ofType:@"json"]
#define kDonateUrl [NSURL URLWithString:@"http://htmlpreview.github.io/?https://github.com/Hackademy2014/horizons/master/New%20Horizons/New%20Horizons/Data/Donate.html"]
#define kDonateWishListUrl [NSURL URLWithString:@"https://raw.githubusercontent.com/Hackademy2014/horizons/master/New%20Horizons/New%20Horizons/Data/WishList.json"]
#define kDonateWishListHeaderHeight 22
#define kDonateWishListHeaderLabelHeight 18

//Volunteer
#define kVolunteerUrl [NSURL URLWithString:@"https://newhorizonsfornh.orgaction.com/org2/"]

//Hours
#define kHoursUrl [NSURL URLWithString:@"https://raw.githubusercontent.com/Hackademy2014/horizons/master/New%20Horizons/New%20Horizons/Data/Hours.json"]
#define kHoursHeaderHeight 30.0
#define kHoursHeaderFont [UIFont fontWithName:@"Papyrus" size:24.0]
#define kHoursHeaderColor irgba(48, 48, 145, 1.0)
#define kHoursTextHeight 20.0
#define kHoursTextFont [UIFont fontWithName:@"Papyrus" size:15.0]
#define kHoursTextColor [UIColor blackColor]

//News
#define kNewsBaseUrl [NSURL URLWithString:@"http://newhorizonsfornh.org/news-and-events/news"]
#define kNewsFeedUrl [NSURL URLWithString:@"http://www.newhorizonsfornh.org/news-and-events/news?format=feed&type=rss"]

//Events
#define kEventsBaseUrl [NSURL URLWithString:@"http://newhorizonsfornh.org/news-and-events/events"]
#define kEventsFeedUrl [NSURL URLWithString:@"http://www.newhorizonsfornh.org/news-and-events/events?format=feed&type=rss"]

//Contacts
#define kContactsUrl [NSURL URLWithString:@"https://raw.githubusercontent.com/Hackademy2014/horizons/master/New%20Horizons/New%20Horizons/Data/Contacts.json"]
#define kContactsCardHeight 100

//Common: News, Events
#define kWebContentStyle @"<style>body{ background-color:#f9f3d9; font-family:Papyrus,'Papyrus',sans-serif; font-size:14px; }</style>"