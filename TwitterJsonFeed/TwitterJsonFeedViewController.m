//
//  TwitterJsonFeedViewController.m
//  TwitterJsonFeed
//
//  Created by Nazar Rizvi on 6/23/11.
//  Copyright 2011 narizvi.com. All rights reserved.
//

#import "TwitterJsonFeedViewController.h"
static NSString *postURL = @"http://twitter.com/statuses/user_timeline/";

@implementation TwitterJsonFeedViewController

- (void)dealloc
{
    [super dealloc];
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// Parse the Jason for the top most tweet
- (void)parseJson:(NSString *)result
{
    SBJsonParser *parser = [SBJsonParser new];
    
    NSArray *statuses = [parser objectWithString:result error:nil];
    
    bool isFirst = YES;
    
    for (NSDictionary *status in statuses)
    {
        if(isFirst)
        {
            lblTweet.text = [status objectForKey:@"text"];
            isFirst = NO;
        }
        else
        {
            return;
        }
    }
}

// Submit button clicked
- (IBAction)submitClick
{
    if([txtUsername.text length] == 0)
    {
        UIAlertView *myAlert = [[UIAlertView alloc]
                                initWithTitle:nil message:@"Please enter a Twitter Username." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [myAlert show];
        [myAlert release];
    }
    else
    {
        NSString *urlString = [[NSString alloc] initWithFormat:@"%@%@.json",postURL, txtUsername.text];
        NSURL *url = [[NSURL alloc] initWithString:urlString];
        NSString *result = [[NSString alloc] initWithContentsOfURL:url];
        
        if([result length] == 0)
        {
            UIAlertView *myAlert = [[UIAlertView alloc]
                                    initWithTitle:nil message:@"Network Error." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [myAlert show];
            [myAlert release];
        }
        else
        {
            [self parseJson:result];
        }
    }
}

-(NSString *)ObjectGetter:(NSDictionary *)dict: (NSString *) key
{
    if([dict objectForKey:key] != [NSNull null])
    {
        return [dict objectForKey:key];
    }
    else
    {
        return [NSString stringWithString:@""];
    }
}

- (IBAction)doneSubmit:(id)sender
{
    [sender resignFirstResponder];
}

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
@end
