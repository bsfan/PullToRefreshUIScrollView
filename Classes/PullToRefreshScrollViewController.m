//
//  PullToRefreshScrollViewController.m
//  PullToRefreshScroll
//
//  Created by Joshua Grenon on 2/21/11.
//  Copyright 2011 MotionMobs. All rights reserved.
//

#define NUM_OF_SLIDES 8
#import "PullToRefreshScrollViewController.h"

@implementation PullToRefreshScrollViewController

@synthesize scrollView;
@synthesize ScreenIsLoaded;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	  	
	self.scrollView.delegate1 = self;
	
	NSInteger numberOfRows;
	
	if([UIDevice currentDevice].orientation == UIDeviceOrientationPortrait)
		numberOfRows = 3;
	else 
		numberOfRows = 4;
	
	for (int row = 0; row < NUM_OF_SLIDES - 1; row++)
    {		
        for (int col = 0; col < numberOfRows; col++)
        {
            int index = (row * numberOfRows) + col;
			
			if (!(index > NUM_OF_SLIDES - 1)) 
			{				
				CGRect frame = CGRectMake(23 + col * (45 + 205),
                                          23 + row * (20 + 190),
                                          230, 190);
				
				
				UIView *slide = [[UIView alloc] initWithFrame:frame];				
				slide.backgroundColor = [UIColor blackColor];
				[self.scrollView addSubview:slide];
			}
        }
    }
	
	[scrollView setContentSize:CGSizeMake((4 + 23) * 3, 215 * 5)];	
	ScreenIsLoaded = YES;
}

-(void)rearrangeSubviews:(NSInteger)numberOfRows
{		
	for (int row = 0; row < [self.scrollView.subviews count] - 2; row++)
    {		
        for (int col = 0; col < numberOfRows; col++)
        {
            int index = (row * numberOfRows) + col + 1;
			
			if (index < 9) 
			{
				CGRect frame = CGRectMake(23 + col * (45 + 205),
										  23 + row * (20 + 190),
										  230, 190);
				if (index != 0) 
				{
					UIView *subView = [self.scrollView.subviews objectAtIndex:index];
					subView.frame = frame;	
				}
			}
		}
	} 
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	UIDeviceOrientation orientation = toInterfaceOrientation;
	
	if (ScreenIsLoaded) 
	{
		if (orientation == UIDeviceOrientationPortrait) { 
			[self rearrangeSubviews:3];
		}
		else if(orientation == UIDeviceOrientationLandscapeLeft 
				|| orientation == UIDeviceOrientationLandscapeRight)
		{ 
			[self rearrangeSubviews:4];
		}	
	}
}

-(void)refreshScrollView
{
	[self performSelector:@selector(stopLoading) withObject:nil afterDelay:2.0];	
}

-(void)stopLoading
{
	[self.scrollView stopLoading];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
