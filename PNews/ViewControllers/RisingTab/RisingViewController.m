//
//  RisingViewController.m
//  PNews
//
//  Created by Karthik on 15/12/15.
//  Copyright © 2015 JRKKarthik. All rights reserved.
//

#import "RisingViewController.h"

#import "AppDelegate.h"


@interface RisingViewController ()


@end

@implementation RisingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enteredForeground:) name:@"EnteredForeground" object:nil];
    [super parseMyUrl:@"https://www.reddit.com/r/programming/rising/.rss"];
}


- (void)enteredForeground:(id)object {
    // Reload the tableview
    [super parseMyUrl:@"https://www.reddit.com/r/programming/rising/.rss"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
