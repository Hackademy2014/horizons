//
//  NHWishListViewController.h
//  New Horizons
//
//  Created by Hackademy on 5/18/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHWishListViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITableView *lstWishList;
@property NSMutableDictionary *wishListGroups;
@end
