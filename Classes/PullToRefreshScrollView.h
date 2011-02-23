//
//  PullToRefreshScrollView.h
//  PullToRefreshScroll
//
//  Created by Joshua Grenon on 2/21/11.
//  Copyright 2011 MotionMobs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PullToRefreshScrollViewDelegate;

@interface PullToRefreshScrollView : UIScrollView<UIScrollViewDelegate> {

	UIView *refreshHeaderView;
    UILabel *refreshLabel;
    UIImageView *refreshArrow;
    UIActivityIndicatorView *refreshSpinner;
    BOOL isDragging;
    BOOL isLoading;
    NSString *textPull;
    NSString *textRelease;
    NSString *textLoading;
	id <PullToRefreshScrollViewDelegate> delegate1;
}

@property (nonatomic, retain) UIView *refreshHeaderView;
@property (nonatomic, retain) UILabel *refreshLabel;
@property (nonatomic, retain) UIImageView *refreshArrow;
@property (nonatomic, retain) UIActivityIndicatorView *refreshSpinner;
@property (nonatomic, copy) NSString *textPull;
@property (nonatomic, copy) NSString *textRelease;
@property (nonatomic, copy) NSString *textLoading;
@property (nonatomic, assign) id <PullToRefreshScrollViewDelegate> delegate1; 
 
-(void)startLoading;
-(void)stopLoading;
-(void)refresh; 

@end

@protocol PullToRefreshScrollViewDelegate

-(void)refreshScrollView;

@end
