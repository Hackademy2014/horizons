//
//  NHEventsViewController.m
//  New Horizons
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

#import "NHEventsViewController.h"

@interface NHEventsViewController ()

@end

@implementation NHEventsViewController

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
    self.navigationController.navigationBar.hidden = NO;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = NO;
    
    
    //Getting data from rss
    NSString *googleString = @"http://www.newhorizonsfornh.org/news-and-events/events?format=feed&type=rss";
    NSURL *googleURL = [NSURL URLWithString:googleString];
    NSError *error;
    googlePage = [NSString stringWithContentsOfURL:googleURL
                                          encoding:NSASCIIStringEncoding
                                             error:&error];
    
    //cutout page title
    NSString *startSearch = @"<title>";
    NSRange rangeInit = [googlePage  rangeOfString: startSearch options: NSCaseInsensitiveSearch];
    if (rangeInit.location != NSNotFound) {
        NSLog(@"is in init check");
        googlePage =[googlePage substringFromIndex:rangeInit.location+startSearch.length];
    }
    
    //getting data
    //NSString *startSearch = @"<title>";
    NSString *googlePageINIT = googlePage;
    
    //NSString *endSearch = @"</title>";
    BOOL foundAll = false;
    NSUInteger count = 0;
    NSUInteger spaceCount = 0;
    //NSString *target = @"" ;
    
    NSString *outputData = @"";
    //NSString *outputDataDescription = @"";
    NSArray *checkArray = @[@"<title>", @"<description>"];
    NSArray *endArray = @[@"</title>", @"</description>"];
    
    NSMutableArray *allTitleData = [[NSMutableArray alloc]init];//evens = titles, odds = descriptions
    NSMutableArray *allDescriptionData = [[NSMutableArray alloc]init];
    
    //getting the data and storing in array
    while (count < checkArray.count)
    {
        while (foundAll == false)
        {
            
            outputData = [self getData:checkArray[count] second:endArray[count]];
            //outputDataDescription = [self getDataInside:@"<description>" second:@"</description>" checkString:outputData];
            //NSLog(@"%@ ||| %@", outputData, outputDataDescription);
            if (outputData == NULL)
            {
                foundAll = true;
                count++;
            }else{
                /*UILabel *yourLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 20+spaceCount*13, 300, 20)];
                 
                 [yourLabel setTextColor:[UIColor blackColor]];
                 [yourLabel setBackgroundColor:[UIColor clearColor]];
                 [yourLabel setFont:[UIFont fontWithName: @"Trebuchet MS" size: 14.0f]];*/
                //stringTemp = [googlePage substringWithRange:range];
                outputData = [self stringByStrippingHTML:outputData];
                //_dataTextView.text = [NSString stringWithFormat:@"%@\n\n\n%@", _dataTextView.text, outputData];
                //outputData = _dataTextView.text;
                if (count%2 == 1){
                    [allDescriptionData insertObject:outputData atIndex:spaceCount];
                    spaceCount++;//only adding every other, since it is used as an index for both arrays
                }else{
                    [allTitleData insertObject:outputData atIndex:spaceCount];
                }
                //[self.view addSubview:yourLabel];
                
                //spaceCount++;
            }
            
        }
        googlePage = googlePageINIT;
        foundAll = false;
    }
    
    //getting rid of space at top
    [_dataTextView setContentInset:UIEdgeInsetsMake(-60, 0, 0,0)];
    
    //getting rid of form check
    //if (allDescriptionData[(allDescriptionData.count - 1 - i)] )
    
    NSRange range3 = [allDescriptionData[(allDescriptionData.count - 1 - (allTitleData.count-1))]  rangeOfString: @"Walk Registration" options: NSCaseInsensitiveSearch];
    
    //NSLog(@"found: %@", (range.location != NSNotFound) ? @"Yes" : @"No");
    if (range3.location != NSNotFound) {
        allDescriptionData[(allDescriptionData.count - 1 - (allTitleData.count-1))] =  [allDescriptionData[(allDescriptionData.count - 1 - (allTitleData.count-1))] substringToIndex:range3.location];
    }
    
    //adding text to view
    BOOL isFirstPass = true;
    for (int i = allTitleData.count-1; i > 0; i--)
    {
        //first pass check with less new lines
        if (isFirstPass == true)
        {
            _dataTextView.text = [NSString stringWithFormat:@"%@-----------------------------------------------\n%@\n\n%@\n\n\n", @"", allTitleData[i], allDescriptionData[(allDescriptionData.count - 1 - i)]];
            isFirstPass = false;
        }
        else
        {
            _dataTextView.text = [NSString stringWithFormat:@"%@\n-----------------------------------------------\n%@\n\n%@\n\n\n", _dataTextView.text, allTitleData[i], allDescriptionData[(allDescriptionData.count - 1 - i)]];
        }
        
    }
    
    _dataTextView.text = [NSString stringWithFormat:@"%@\n\n\n", _dataTextView.text];
    
    //NSLog(@"ALLDATA: %@/n/n%@", allTitleData, allDescriptionData);
}

- (NSString *) getData:(NSString *)searchParam second:(NSString *)searchEnd;
{
    NSRange range = [googlePage  rangeOfString: searchParam options: NSCaseInsensitiveSearch];
    NSRange range2;
    //NSLog(@"found: %@", (range.location != NSNotFound) ? @"Yes" : @"No");
    if (range.location != NSNotFound) {
        // your code
        NSString *stringTemp =[googlePage substringFromIndex:range.location+searchParam.length];
        range2 = [stringTemp rangeOfString: searchEnd options: NSCaseInsensitiveSearch];
        //NSLog(@"stringTemp1: %@", stringTemp);
        if (range2.location != NSNotFound) {
            googlePage = [stringTemp substringFromIndex:range2.location];
            stringTemp = [stringTemp substringToIndex:range2.location];
            //[googlePage substringWithRange:range];
            //NSLog(@"stringTemp: %@", stringTemp);
            return stringTemp;
        }
        
        
    }
    return NULL;
}

-(NSString *) stringByStrippingHTML:(NSString *)myData {
    NSRange r;
    //NSString *s = [self copy];
    NSString *s = myData;
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    
    while ((r = [s rangeOfString:@"&nbsp;"]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    
    while ((r = [s rangeOfString:@"]]>"]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    
    while ((r = [s rangeOfString:@"{emailcloak=off}"]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    
    while ((r = [s rangeOfString:@"&amp;"]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    
    //[s stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
    return s;
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
