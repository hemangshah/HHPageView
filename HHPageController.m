//
//  HHPageControl.m
//  
//
//  Created by Hemang Shah  on 05/07/13.
//  Copyright (c) 2013 Hemang Shah. All rights reserved.
//

#import "HHPageControl.h"

#define MAX_WIDTH 320.f
#define MAX_HEIGHT 20.f
#define margin_space 5.f

@implementation HHPageControl
@synthesize delegate;

#pragma mark - Shared Instance
+ (HHPageControl *)sharedPageController
{
    static HHPageControl *sharedInstance = nil;
	if (sharedInstance == nil)
	{
		sharedInstance = [[HHPageControl alloc] init];
	}
	return sharedInstance;
}

#pragma mark - Controller Life Cycle
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - Setters
- (void) setImageActiveState:(UIImage *)active InActiveState:(UIImage *)inactive {
    activeImage = active;
    inactiveImage = inactive;
}

- (void) setNumberOfPages:(int)pages {
    noOfPages = pages;
}

- (void) setCurrentPage:(int)current {
    currentPage = current;
}

#pragma mark - Run time calculation / States Frame
- (CGSize)activeSize {
    return activeImage.size;
}

- (CGSize)inactiveSize {
    return inactiveImage.size;
}

- (CGRect) stateFrameWithX:(int)x Y:(int)y {
    return CGRectMake(x, y, [self activeSize].width + margin_space, [self activeSize].height);
}

#pragma mark - User tap / Delegate Call
- (void) callDelegateForPageChange:(int)page {
    
    [self updateStateForPageNumber:page];

    if([self.delegate respondsToSelector:@selector(HHPageController:currentIndex:)])
    {
        int jumpToIndex = currentPage;
        if(jumpToIndex>0)
        [self.delegate HHPageController:self currentIndex:jumpToIndex-1];
    }
}

- (void) userTap:(UIButton *)btnState {
    [self callDelegateForPageChange:btnState.tag];
}

#pragma mark - Add States
- (void) addStates {
    int x = 0;
    for(int index = 1; index <= noOfPages; index++) {
        UIButton *btnState = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnState addTarget:self action:@selector(userTap:) forControlEvents:UIControlEventTouchUpInside];
        [btnState setTag:index];
        [btnState setImage:inactiveImage forState:UIControlStateNormal];
        [btnState setImage:activeImage forState:UIControlStateSelected];
        if(index == currentPage) {
            [btnState setSelected:YES];
        }
        [btnState setFrame:[self stateFrameWithX:x Y:0]];
        [self addSubview:btnState];
        x+=btnState.frame.size.width;
    }
}

#pragma mark - Update Self 
- (void) updateContainerViewFrame {
    self.frame = CGRectMake(margin_space, self.frame.origin.y, noOfPages * [self activeSize].width + (margin_space * noOfPages), [self activeSize].height);
    self.center = CGPointMake([self superview].center.x, self.frame.origin.y);
}

#pragma mark - Remove Self 
- (void) removeInErrorCase {
    [self setBackgroundColor:[UIColor clearColor]];
    [self removeFromSuperview];
}

#pragma mark - Load Controller
- (void) load {
    if(noOfPages!=0 && noOfPages > 0 && currentPage<=noOfPages) {
        if(activeImage && inactiveImage) {
            [self updateContainerViewFrame];
            [self addStates];
            [self updateStateForPageNumber:currentPage];
            if(currentPage>1) {
                [self callDelegateForPageChange:currentPage];
            }
            [self setBackgroundColor:[UIColor clearColor]];
        }else{
            NSLog(@"Need to add active and inactive state images.");
            [self removeInErrorCase];
        }
    }else{
        NSLog(@"Number of pages should be atleast one, and current page should lessthan or equal to number of pages.");
        [self removeInErrorCase];
    }
}

#pragma mark - Update States For State Change Event
- (void) changeButtonStateForTag:(int)tag {
    for(int index = 1; index <= noOfPages; index++) {
        UIButton *btnState = (UIButton *)[self viewWithTag:index];
        [btnState setImage:inactiveImage forState:UIControlStateNormal];
        [btnState setImage:activeImage forState:UIControlStateSelected];
        [btnState setSelected:NO];
        if(index == tag) {
            currentPage = index;
            [btnState setSelected:YES];
        }
    }
}

- (void) updateStateForPageNumber:(int)page {
    if(page<=noOfPages && noOfPages!=0 && page!=currentPage) {
        if(page == 0) page = 1;
        [self changeButtonStateForTag:page];
    }
}
@end
