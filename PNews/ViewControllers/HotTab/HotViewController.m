//
//  HotViewController.m
//  PNews
//
//  Created by Karthik on 15/12/15.
//  Copyright © 2015 JRKKarthik. All rights reserved.
//

#import "HotViewController.h"


@interface HotViewController ()

@end

@implementation HotViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enteredForeground:) name:@"EnteredForeground" object:nil];
    [super parseMyUrl:@"https://www.reddit.com/r/programming/hot/.rss"];
}


- (void)enteredForeground:(id)object {
    // Reload the tableview
    [super parseMyUrl:@"https://www.reddit.com/r/programming/hot/.rss"];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
