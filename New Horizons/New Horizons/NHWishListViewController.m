//
//  NHWishListViewController.m
//  New Horizons
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

#import "NHWishListViewController.h"

@interface NHWishListViewController ()

@end

@implementation NHWishListViewController

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
    self.wvWishList.delegate = self;
    
    //Set contact information
    NSString *content = @"";
    
    //Style
    content = [content stringByAppendingString:@"<style>"];
    content = [content stringByAppendingString:@"body{"];
    content = [content stringByAppendingString:@"background-color:#f9f3d9;"];
    content = [content stringByAppendingString:@"font-family:Papyrus,Times,Times New Roman,sans-serif;"];
    content = [content stringByAppendingString:@"font-size:17px;"];
    content = [content stringByAppendingString:@"}"];
    content = [content stringByAppendingString:@".group{"];
    content = [content stringByAppendingString:@"margin-bottom:40px;"];
    content = [content stringByAppendingString:@"}"];
    content = [content stringByAppendingString:@".group li{"];
    content = [content stringByAppendingString:@"color:black;"];
    content = [content stringByAppendingString:@"}"];
    content = [content stringByAppendingString:@"p{"];
    content = [content stringByAppendingString:@"margin:0;"];
    content = [content stringByAppendingString:@"text-align:center;"];
    content = [content stringByAppendingString:@"font-family:Times,Times New Roman,sans-serif;"];
    content = [content stringByAppendingString:@"font-weight:bold;"];
    content = [content stringByAppendingString:@"color:#EA8847;"];
    content = [content stringByAppendingString:@"}"];
    content = [content stringByAppendingString:@"</style>"];
    
    content = [content stringByAppendingString:@"<div class='group'>"];
    content = [content stringByAppendingString:@"<p class=‘header'>Soup Kitchen:</p>"];
    content = [content stringByAppendingString:@"<ul>"];
    content = [content stringByAppendingString:@"<li>Coffee</li>"];
    content = [content stringByAppendingString:@"<li>Cereal</li>"];
    content = [content stringByAppendingString:@"<li>Sugar</li>"];
    content = [content stringByAppendingString:@"<li>Creamer</li>"];
    content = [content stringByAppendingString:@"<li>Salt</li>"];
    content = [content stringByAppendingString:@"</ul>"];
    content = [content stringByAppendingString:@"</div>"];
    
    content = [content stringByAppendingString:@"<div class='group'>"];
    content = [content stringByAppendingString:@"<p class=‘header'>Food Pantry:</p>"];
    content = [content stringByAppendingString:@"<ul>"];
    content = [content stringByAppendingString:@"<li>Peanut Butter</li>"];
    content = [content stringByAppendingString:@"<li>Jelly</li>"];
    content = [content stringByAppendingString:@"<li>Cereal</li>"];
    content = [content stringByAppendingString:@"<li>Baked Beans</li>"];
    content = [content stringByAppendingString:@"<li>Macaroni &amp; Cheese</li>"];
    content = [content stringByAppendingString:@"<li>Canned Vegetables</li>"];
    content = [content stringByAppendingString:@"<li>Canned Tomatoes</li>"];
    content = [content stringByAppendingString:@"<li>Canned Fruit</li>"];
    content = [content stringByAppendingString:@"<li>Sauce</li>"];
    content = [content stringByAppendingString:@"<li>Tuna Fish</li>"];
    content = [content stringByAppendingString:@"<li>Pasta</li>"];
    content = [content stringByAppendingString:@"</ul>"];
    content = [content stringByAppendingString:@"</div>"];
    
    content = [content stringByAppendingString:@"<div class='group'>"];
    content = [content stringByAppendingString:@"<p class=‘header'>Shelter:</p>"];
    content = [content stringByAppendingString:@"<ul>"];
    content = [content stringByAppendingString:@"<li>Personal-Size Toiletries</li>"];
    content = [content stringByAppendingString:@"<li>Shampoo</li>"];
    content = [content stringByAppendingString:@"<li>Underwear</li>"];
    content = [content stringByAppendingString:@"<li>Plastic Shower Curtain Liners</li>"];
    content = [content stringByAppendingString:@"<li>Laundry Detergent</li>"];
    content = [content stringByAppendingString:@"<li>Disposable Razors</li>"];
    content = [content stringByAppendingString:@"<li>Shoes</li>"];
    content = [content stringByAppendingString:@"<li>Sneakers</li>"];
    content = [content stringByAppendingString:@"<li>Bath Towels</li>"];
    content = [content stringByAppendingString:@"<li>Gas Gift Cards</li>"];
    content = [content stringByAppendingString:@"<li>Deodorant</li>"];
    content = [content stringByAppendingString:@"</ul>"];
    content = [content stringByAppendingString:@"</div>"];
    
    content = [content stringByAppendingString:@"<div class='group'>"];
    content = [content stringByAppendingString:@"<p class=‘header'>Day Program:</p>"];
    content = [content stringByAppendingString:@"<ul>"];
    content = [content stringByAppendingString:@"<li>City Bus Passes</li>"];
    content = [content stringByAppendingString:@"<li>Stamps</li>"];
    content = [content stringByAppendingString:@"<li>Date Books</li>"];
    content = [content stringByAppendingString:@"</ul>"];
    content = [content stringByAppendingString:@"</div>"];
    
    [self.wvWishList loadHTMLString:content baseURL:nil];
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
