//
//  TwitterJsonFeedAppDelegate.h
//  TwitterJsonFeed
//
//  Created by Nazar Rizvi on 6/23/11.
//  Copyright 2011 narizvi.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TwitterJsonFeedViewController;

@interface TwitterJsonFeedAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet TwitterJsonFeedViewController *viewController;

@end
