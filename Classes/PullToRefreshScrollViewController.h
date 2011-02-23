//
//  PullToRefreshScrollViewController.h
//  PullToRefreshScroll
//
//  Created by Joshua Grenon on 2/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullToRefreshScrollView.h"

@interface PullToRefreshScrollViewController : UIViewController<UIScrollViewDelegate, PullToRefreshScrollViewDelegate> {
	
	IBOutlet PullToRefreshScrollView *scrollView;
	BOOL ScreenIsLoaded;
}

@property(nonatomic, retain) IBOutlet PullToRefreshScrollView *scrollView;
@property(nonatomic, assign) BOOL ScreenIsLoaded;

-(void)stopLoading;

@end

