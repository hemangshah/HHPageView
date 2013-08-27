//
//  ViewController.m
//  TestExample
//
//  Created by Hemang Shah  on 21/08/13.
//  Copyright (c) 2013 Hemang Shah. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Generate Random Color (RGB)
- (float)getRandomInt {
    return (arc4random()%255)/255.f;
}

#pragma mark - Add Pages To ScrollView (Testing)
- (void) addNoOfPages:(int)pages{
    
    int numberOfPages = pages;
    
    int x = 0; //start X position inside scrollview
    int y = 0; //start Y position inside scrollview
    int w = scrollView.frame.size.width; //width of page
    int h = scrollView.frame.size.height; //height of page
    
    //For testing we're adding UILabels.
    
    for(int i = 1; i<= numberOfPages; i++) {
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [lbl setBackgroundColor:[UIColor colorWithRed:[self getRandomInt] green:[self getRandomInt] blue:[self getRandomInt] alpha:1.0]];
        [lbl setText:[NSString stringWithFormat:@"Page No. %d",i]];
        [lbl setTextAlignment:NSTextAlignmentCenter];
        lbl.font = [UIFont boldSystemFontOfSize:17.f];
        [scrollView addSubview:lbl];
        x+=scrollView.frame.size.width;
    }
    
    //set content size of the scrollview
    [scrollView setContentSize:CGSizeMake(x, scrollView.frame.size.height)];
    
    //set scrollview properties (not needed)
    [scrollView setPagingEnabled:YES];
    [scrollView setShowsHorizontalScrollIndicator:NO];
}

- (void) addNoOfPagesVertically:(int)pages{
    
    int numberOfPages = pages;
    
    int x = 0; //start X position inside scrollview
    int y = 0; //start Y position inside scrollview
    int w = scrollViewVertical.frame.size.width; //width of page
    int h = scrollViewVertical.frame.size.height; //height of page
    
    //For testing we're adding UILabels.
    
    for(int i = 1; i<= numberOfPages; i++) {
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [lbl setBackgroundColor:[UIColor colorWithRed:[self getRandomInt] green:[self getRandomInt] blue:[self getRandomInt] alpha:1.0]];
        [lbl setText:[NSString stringWithFormat:@"Page No. %d",i]];
        [lbl setTextAlignment:NSTextAlignmentCenter];
        lbl.font = [UIFont boldSystemFontOfSize:17.f];
        [scrollViewVertical addSubview:lbl];
        y+=scrollViewVertical.frame.size.height;
    }
    
    //set content size of the scrollview
    [scrollViewVertical setContentSize:CGSizeMake(scrollView.frame.size.width, y)];
    
    //set scrollview properties (not needed)
    [scrollViewVertical setPagingEnabled:YES];
    [scrollViewVertical setShowsHorizontalScrollIndicator:NO];
}

#pragma mark - View Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    int numberOfPages = 10;
    
    [self addNoOfPages:numberOfPages];
    
    //Here's the configuration for HHPageController
    
    //Set delegate to the page controller object. To handle page change event.
    [pageController setDelegate:self];
    
    //Set Images for Active and Inactive state.
    [pageController setImageActiveState:[UIImage  imageNamed:@"selected.png"] InActiveState:[UIImage  imageNamed:@"unselected.png"]];
    
    //Tell PageController, the number of pages you want to show.
    [pageController setNumberOfPages:numberOfPages];
    
    //Tell PageController to show page from this page index.
    [pageController setCurrentPage:3];
    
    //Show when you ready!
    [pageController load];
    
    // Vertical
    
    [self addNoOfPagesVertically:numberOfPages];
    
    //Set delegate to the page controller object. To handle page change event.
    [pageControllerVertical setDelegate:self];
    
    [pageControllerVertical setHHPageControlType:HHPageControlVerticalType];
    
    //Set Images for Active and Inactive state.
    [pageControllerVertical setImageActiveState:[UIImage  imageNamed:@"selected.png"] InActiveState:[UIImage  imageNamed:@"unselected.png"]];
    
    //Tell PageController, the number of pages you want to show.
    [pageControllerVertical setNumberOfPages:numberOfPages];
    
    //Tell PageController to show page from this page index.
    [pageControllerVertical setCurrentPage:3];
    
    //Show when you ready!
    [pageControllerVertical load];
    
    
    //------Add HHPageController dynamically---------------------------------------------------------------------

//    HHPageControl *pageController1 = [[HHPageControl alloc] initWithFrame:CGRectMake(0, 120, 160, 32)];
//    [self.view addSubview:pageController1];
//    [pageController1 setDelegate:self];
//    [pageController1 setHHPageControlType:HHPageControlVerticalType];
//    [pageController1 setImageActiveState:[UIImage  imageNamed:@"selected.png"] InActiveState:[UIImage  imageNamed:@"unselected.png"]];
//    [pageController1 setNumberOfPages:numberOfPages];
//    [pageController1 setCurrentPage:3];
//    [pageController1 load];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL) shouldAutorotate {
    return NO;
}

#pragma mark - ScrollView Delegate
/*
 IMPORTANT -- Its required to implement any of the scrollview delegate
 If paging is not enabled on UIScrollView then use - (void)scrollViewDidScroll:(UIScrollView *)scrollView instead
*/

//- (void)scrollViewDidScroll:(UIScrollView *)scroll
//{
//    if([scroll isEqual:scrollView])
//    {
//        int pageWidth = scroll.frame.size.width;
//        int page = (floor((scroll.contentOffset.x - pageWidth / 2) / pageWidth) + 1) + 1;
//        [pageController updateStateForPageNumber:page];
//    }
//}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scroll
{
    //If its not dragging
    if(!scroll.isDragging)
    {
        //get page number to update HHPageController
//        int pageWidth = scroll.frame.size.width;
//        int page = (floor((scroll.contentOffset.x - pageWidth / 2) / pageWidth) + 1) + 1;
//        [pageController updateStateForPageNumber:page];
        
        int pageHeight = scroll.frame.size.height;
        int page = (floor((scroll.contentOffset.y - pageHeight / 2) / pageHeight) + 1) + 1;
        [pageControllerVertical updateStateForPageNumber:page];
    }
}

#pragma mark - HHPageController Delegate
- (void) HHPageController:(HHPageControl *)pController currentIndex:(int)currentIndex
{
    NSLog(@"Current Page Index %d",currentIndex);
    
//    [scrollView setContentOffset:CGPointMake(currentIndex * scrollView.frame.size.width, 0) animated:YES];    
    
    [scrollViewVertical setContentOffset:CGPointMake(0, currentIndex * scrollView.frame.size.height) animated:YES];
}
@end