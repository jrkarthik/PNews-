//
//  SuperTableViewController.m
//  PNews
//
//  Created by Karthik on 17/12/15.
//  Copyright © 2015 JRKKarthik. All rights reserved.
//

#import "SuperTableViewController.h"

#import <UIKit/UIKit.h>

#import "MWFeedInfo.h"

#import "AppDelegate.h"

@interface SuperTableViewController ()

@end

@implementation SuperTableViewController
{
    AppDelegate *appDelegateObj;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
}


-(void)parseMyUrl:(NSString*)urlString
{
    
    NSURL *feedURL = [NSURL URLWithString:urlString];
    [appDelegateObj showHUDWithMessage:@"Loading.."];
    self.feedParser = [[MWFeedParser alloc] initWithFeedURL:feedURL];
    [self.feedParser setDelegate:self];
    self.feedParser.feedParseType = ParseTypeItemsOnly;
    [self.feedParser parse];

}



- (void)feedParserDidStart:(MWFeedParser *)parser
{
    self.feedsArray = [[NSMutableArray alloc]init];
}

- (void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item
{
    self.stories = [[ModelClass alloc]init];
    NSArray *data = [[NSArray alloc]init];
    data = [item.summary componentsSeparatedByString:@" "];
    self. requiredLink = [[NSMutableString alloc]init];
    self.requiredLink = [data objectAtIndex:8];
    self.requiredLink = (NSMutableString *)[self.requiredLink stringByReplacingOccurrencesOfString:@"href=\"" withString:@""];
    self.requiredLink = (NSMutableString *)[self.requiredLink stringByReplacingOccurrencesOfString:@"\">[link]</a>" withString:@""];
    [self.stories setTitle:item.title];
    [self.stories setLink:self.requiredLink];
    if([self.feedsArray count]<100)
    {
        [self.feedsArray addObject:self.stories];
    }
}

- (void)feedParserDidFinish:(MWFeedParser *)parser
{
    [appDelegateObj hideHUD];
    [self.tableView reloadData];
    self.tableView.contentOffset = CGPointMake(0, 0 - self.tableView.contentInset.top);
}

- (void)feedParser:(MWFeedParser *)parser didFailWithError:(NSError *)error
{
    [appDelegateObj hideHUD];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if(![self.feedsArray count]==0)
    {
        return [self.feedsArray count];
    }
    else
    {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.feedsArray count]==0)
    {
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.textLabel.text= @"Feeds not found.";
        return cell;
    }
    else
    {
        static NSString *CellIdentifier = @"Cell";
        ModelClass * model = [self.feedsArray objectAtIndex:indexPath.row];
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.textLabel.text= model.title;
        return cell;
    }
    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ModelClass * model = [self.feedsArray objectAtIndex:indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"dVCIdentifier"];
    self.dvc.selectedLink = model.link;
    self.dvc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:self.dvc animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
