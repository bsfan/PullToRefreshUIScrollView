//
//  PullToRefreshScrollAppDelegate.h
//  PullToRefreshScroll
//
//  Created by Joshua Grenon on 2/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PullToRefreshScrollViewController;

@interface PullToRefreshScrollAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PullToRefreshScrollViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PullToRefreshScrollViewController *viewController;

@end

