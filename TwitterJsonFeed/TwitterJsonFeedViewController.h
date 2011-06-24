//
//  TwitterJsonFeedViewController.h
//  TwitterJsonFeed
//
//  Created by Nazar Rizvi on 6/23/11.
//  Copyright 2011 narizvi.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSON.h"

@interface TwitterJsonFeedViewController : UIViewController {
    IBOutlet UILabel *lblTweet;
    IBOutlet UITextField *txtUsername;    
}
- (IBAction)submitClick;
- (IBAction)doneSubmit:(id)sender;
- (void)parseJson:(NSString *)result;
- (NSString *)ObjectGetter:(NSDictionary *)dict: (NSString *) key;
@end
