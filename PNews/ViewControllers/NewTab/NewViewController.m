//
//  NewViewController.m
//  PNews
//
//  Created by Karthik on 15/12/15.
//  Copyright © 2015 JRKKarthik. All rights reserved.
//

#import "NewViewController.h"



@interface NewViewController ()

@end

@implementation NewViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enteredForeground:) name:@"EnteredForeground" object:nil];
    [super parseMyUrl:@"https://www.reddit.com/r/programming/new/.rss"];
}


- (void)enteredForeground:(id)object {
    // Reload the tableview
    [super parseMyUrl:@"https://www.reddit.com/r/programming/new/.rss"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
