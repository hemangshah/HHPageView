//
//  ViewController.m
//  TestExample
//
//  Created by Hemang Shah  on 21/08/13.
//  Copyright (c) 2013 Hemang Shah. All rights reserved.
//

#import "ViewController.h"
#import "HHPageView.h"

#define HORIZONTAL_SCROLLVIEW_TAG 1
#define VERTICAL_SCROLLVIEW_TAG 2

@interface ViewController ()<HHPageViewDelegate> {
    
    IBOutlet HHPageView *pageController;
    IBOutlet HHPageView *pageControllerVertical;
    
    IBOutlet UIScrollView *scrollView;
    IBOutlet UIScrollView *scrollViewVertical;
}
@end

@implementation ViewController

#pragma mark - Generate Random Color (RGB)
- (float)getRandomInt
{
    return (arc4random()%255)/255.f;
}

#pragma mark - Add Pages To ScrollView (Testing)
- (void) addNoOfPagesHorizontally:(NSInteger)pages {
    
    NSInteger numberOfPages = pages;
    
    NSInteger x = 0; //start X position inside scrollview
    NSInteger y = 0; //start Y position inside scrollview
    NSInteger w = scrollView.frame.size.width; //width of page
    NSInteger h = scrollView.frame.size.height; //height of page
    
    //For testing we're adding UILabels.
    for(NSInteger i = 1; i<= numberOfPages; i++) {
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
        lbl.textColor = [UIColor whiteColor];
        [lbl setBackgroundColor:[UIColor colorWithRed:[self getRandomInt] green:[self getRandomInt] blue:[self getRandomInt] alpha:1.0]];
        [lbl setText:[NSString stringWithFormat:@"Page #%ld",(long)i]];
        [lbl setTextAlignment:NSTextAlignmentCenter];
        lbl.font = [UIFont boldSystemFontOfSize:17.f];
        [scrollView addSubview:lbl];
        x+=scrollView.frame.size.width;
    }
    
    //set content size of the scrollview
    [scrollView setContentSize:CGSizeMake(x, scrollView.frame.size.height)];
    
    //set scrollview properties (needed for better work)
    [scrollView setPagingEnabled:YES];
    [scrollView setShowsHorizontalScrollIndicator:NO];
    [scrollView setShowsVerticalScrollIndicator:NO];
}

- (void) addNoOfPagesVertically:(NSInteger)pages {
    
    NSInteger numberOfPages = pages;
    
    NSInteger x = 0; //start X position inside scrollview
    NSInteger y = 0; //start Y position inside scrollview
    NSInteger w = scrollViewVertical.frame.size.width; //width of page
    NSInteger h = scrollViewVertical.frame.size.height; //height of page
    
    //For testing we're adding UILabels.
    
    for(NSInteger i = 1; i<= numberOfPages; i++) {
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
        lbl.textColor = [UIColor whiteColor];
        [lbl setBackgroundColor:[UIColor colorWithRed:[self getRandomInt] green:[self getRandomInt] blue:[self getRandomInt] alpha:1.0]];
        [lbl setText:[NSString stringWithFormat:@"Page #%ld",(long)i]];
        [lbl setTextAlignment:NSTextAlignmentCenter];
        lbl.font = [UIFont boldSystemFontOfSize:17.f];
        [scrollViewVertical addSubview:lbl];
        y+=scrollViewVertical.frame.size.height;
    }
    
    //set content size of the scrollview
    [scrollViewVertical setContentSize:CGSizeMake(scrollView.frame.size.width, y)];
    
    //set scrollview properties (needed for better work)
    [scrollViewVertical setPagingEnabled:YES];
    [scrollViewVertical setShowsHorizontalScrollIndicator:NO];
    [scrollViewVertical setShowsVerticalScrollIndicator:NO];
}

- (void) configureHorizontalControllerWithTotalPages:(NSInteger)totalPages {
    
    //Set delegate to the page controller object. To handle page change event.
    [pageController setDelegate:self];

    //Set Base View
    //Note: You don't need to set baseScrollView if there's only one HHPageView per view controller.
    [pageController setBaseScrollView:scrollView];

    //Set Images for Active and Inactive state.
    [pageController setImageActiveState:[UIImage  imageNamed:@"selected.png"] InActiveState:[UIImage  imageNamed:@"unselected.png"]];

    //Tell PageController, the number of pages you want to show.
    [pageController setNumberOfPages:totalPages];

    //Tell PageController to show page from this page index.
    [pageController setCurrentPage:3];

    //Show when you ready!
    [pageController load];
}

- (void) configureVerticalControllerWithTotalPages:(NSInteger)totalPages {
    
    //Set delegate to the HHPageView object. To handle page change event.
    [pageControllerVertical setDelegate:self];
    
    //Note: You don't need to set baseScrollView if there's only one HHPageView per view controller.
    [pageControllerVertical setBaseScrollView:scrollViewVertical];
    
    //Set HHPageView Type: Horizontal or Vertical
    [pageControllerVertical setHHPageViewType:HHPageViewVerticalType];
    
    //Set Images for Active and Inactive state.
    [pageControllerVertical setImageActiveState:[UIImage  imageNamed:@"selected.png"] InActiveState:[UIImage  imageNamed:@"unselected.png"]];
    
    //Tell HHPageView, the number of pages you want to show.
    [pageControllerVertical setNumberOfPages:totalPages];
    
    //Tell HHPageView to show page from this page index.
    [pageControllerVertical setCurrentPage:3];
    
    //Show when you ready!
    [pageControllerVertical load];
}

#pragma mark - View Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
     
     IMPORTANT NOTES:
     
     1. Never set tag for HHPageView object.
     
     2. If you've more than one scrollview in the same view, then have you set set tag for each of it. See scrollview and HHPageView delegates for example.
     
     3. If you're adding HHPageView vertically from IB then you've to set it manually until you want get exact output.
     
     4. These are the properties you always have to set, however you can add HHPageView, either in IB or dynamically.
     
        setDelegate:
        setBaseScrollView:
        setImageActiveState: InActiveState:
        setNumberOfPages:
        setCurrentPage:
     
     5. You can also add HHPageView dynamically (see the example below)
     
        HHPageView *pageView = [[HHPageView alloc] initWithFrame:CGRectMake(0, 120, 160, 32)];
        [self.view addSubview:pageView];
        [pageView setDelegate:self];
        [pageView setHHPageControlType:HHPageViewVerticalType];
        [pageView setImageActiveState:[UIImage  imageNamed:@"selected.png"] InActiveState:[UIImage  imageNamed:@"unselected.png"]];
        [pageView setNumberOfPages:numberOfPages];
        [pageView setCurrentPage:3];
        [pageView load];
    */
}
    
- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSInteger numberOfPages = 10;
    
    //Horizontal Controller ScrollView
    [self addNoOfPagesHorizontally:numberOfPages];
    [self configureHorizontalControllerWithTotalPages:numberOfPages];
    
    //Vertical Controller ScrollView
    [self addNoOfPagesVertically:numberOfPages];
    [self configureVerticalControllerWithTotalPages:numberOfPages];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    //right now only supprots for portrait orientation
    return UIInterfaceOrientationPortrait;
}

- (BOOL) shouldAutorotate {
    //right now only supprots for portrait orientation
    return NO;
}

#pragma mark - ScrollView Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scroll {
    //If its not dragging
    if(!scroll.isDragging) {
        if(scroll.tag == HORIZONTAL_SCROLLVIEW_TAG) {
            //horizontal
            NSInteger pageWidth = scroll.frame.size.width;
            NSInteger page = (floor((scroll.contentOffset.x - pageWidth / 2) / pageWidth) + 1) + 1;
            [pageController updateStateForPageNumber:page];
        } else {
            //vertical
            NSInteger pageHeight = scroll.frame.size.height;
            NSInteger page = (floor((scroll.contentOffset.y - pageHeight / 2) / pageHeight) + 1) + 1;
            [pageControllerVertical updateStateForPageNumber:page];
        }
    }
}

#pragma mark - HHPageController Delegate
- (void) HHPageView:(HHPageView *)pageView currentIndex:(NSInteger)currentIndex {
    UIScrollView *baseScrollView = (UIScrollView *) [pageView baseScrollView];
    if(baseScrollView) {
        if(baseScrollView.tag == HORIZONTAL_SCROLLVIEW_TAG) {
            //horizontal
            [baseScrollView setContentOffset:CGPointMake(currentIndex * scrollView.frame.size.width, 0) animated:YES];
        } else {
            //vertical
            [baseScrollView setContentOffset:CGPointMake(0, currentIndex * scrollViewVertical.frame.size.height) animated:YES];
        }
    } else {
        //If you've only single HHPageController for any of the view then no need to set baseScrollView.
        NSLog(@"You forgot to set baseScrollView for the HHPageView object!");
    }
}
@end
