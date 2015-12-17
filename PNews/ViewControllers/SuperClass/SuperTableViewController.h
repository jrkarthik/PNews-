//
//  SuperTableViewController.h
//  PNews
//
//  Created by Karthik on 17/12/15.
//  Copyright © 2015 JRKKarthik. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MWFeedParser.h"

#import "DescriptionViewController.h"

#import "ModelClass.h"

@interface SuperTableViewController : UITableViewController<MWFeedParserDelegate>

@property (nonatomic, strong) DescriptionViewController * dvc;
@property (nonatomic, strong) NSMutableArray *feedsArray;
@property (nonatomic, strong) ModelClass *stories;
@property (nonatomic, strong) NSMutableString  *requiredLink;
@property (nonatomic, strong) MWFeedParser *feedParser;

-(void)parseMyUrl:(NSString*)urlString;
@end
