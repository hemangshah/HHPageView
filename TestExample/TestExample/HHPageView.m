//
//  HHPageControl.m
//  
//
//  Created by Hemang Shah  on 05/07/13.
//  Copyright (c) 2013 Hemang Shah. All rights reserved.
//

#import "HHPageView.h"

#define MAX_WIDTH 320.f
#define MAX_HEIGHT 20.f
#define margin_space 5.f

@implementation HHPageView
@synthesize delegate;
@synthesize baseScrollView;
    
- (void) awakeFromNib {
    [super awakeFromNib];
}

#pragma mark - Setters
- (void) setImageActiveState:(UIImage *)active InActiveState:(UIImage *)inactive {
    activeImage = active;
    inactiveImage = inactive;
}

- (void) setNumberOfPages:(NSInteger)pages {
    noOfPages = pages;
}

- (void) setCurrentPage:(NSInteger)current {
    currentPage = current;
}

- (void) setHHPageViewType:(HHPageViewType)pageControllertype {
    pageControllerType = pageControllertype;
}

#pragma mark - Run time calculation / States Frame
- (CGSize)activeSize {
    return activeImage.size;
}

- (CGSize)inactiveSize {
    return inactiveImage.size;
}

- (CGRect) stateHorizontalFrameWithX:(CGFloat)x Y:(CGFloat)y {
    return CGRectMake(x, y, [self activeSize].width + margin_space, [self activeSize].height);
}

- (CGRect) stateVerticalFrameWithX:(CGFloat)x Y:(CGFloat)y {
    return CGRectMake(x, y, [self activeSize].width, [self activeSize].height + margin_space);
}

- (CGFloat) getXforHorizontalHHPage {
    CGFloat widthOfState = [self activeSize].width + margin_space;
    CGFloat widthOfHHPageView = CGRectGetWidth(self.frame);
    return (widthOfHHPageView - (noOfPages * widthOfState))/2.0;
}
    
- (CGFloat) getYforVerticalHHPage {
    CGFloat heightOfState = [self activeSize].height + margin_space;
    CGFloat heightOfHHPageView = CGRectGetHeight(self.frame);
    return (heightOfHHPageView - (noOfPages * heightOfState))/2.0;
}

#pragma mark - User tap / Delegate Call
- (void) callDelegateForPageChange:(NSInteger)page {
    
    [self updateStateForPageNumber:page];

    if([self.delegate respondsToSelector:@selector(HHPageView:currentIndex:)]) {
        NSInteger jumpToIndex = currentPage;
        if(jumpToIndex>0) {
            [self.delegate HHPageView:self currentIndex:jumpToIndex-1];
        }
    }
}

- (void) userTap:(UIButton *)btnState {
    [self callDelegateForPageChange:btnState.tag];
}

#pragma mark - Add States
- (void) addStatesHorizontally {
    CGFloat x = [self getXforHorizontalHHPage];
    for(NSInteger index = 1; index <= noOfPages; index++) {
        UIButton *btnState = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnState addTarget:self action:@selector(userTap:) forControlEvents:UIControlEventTouchUpInside];
        [btnState setTag:index];
        [btnState setImage:inactiveImage forState:UIControlStateNormal];
        [btnState setImage:activeImage forState:UIControlStateSelected];
        if(index == currentPage) {
            [btnState setSelected:YES];
        }
        [btnState setFrame:[self stateHorizontalFrameWithX:x Y:0.0]];
        [self addSubview:btnState];
        btnState.center = CGPointMake(btnState.center.x, CGRectGetHeight(self.frame)/2.0);
        x+=btnState.frame.size.width;
    }
}

- (void) addStatesVertically {
    CGFloat y = [self getYforVerticalHHPage];
    for(NSInteger index = 1; index <= noOfPages; index++) {
        UIButton *btnState = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnState addTarget:self action:@selector(userTap:) forControlEvents:UIControlEventTouchUpInside];
        [btnState setTag:index];
        [btnState setImage:inactiveImage forState:UIControlStateNormal];
        [btnState setImage:activeImage forState:UIControlStateSelected];
        if(index == currentPage) {
            [btnState setSelected:YES];
        }
        [btnState setFrame:[self stateVerticalFrameWithX:0.0 Y:y]];
        [self addSubview:btnState];
        btnState.center = CGPointMake(CGRectGetWidth(self.frame)/2.0, btnState.center.y);
        y+=btnState.frame.size.height;
    }
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
            if(pageControllerType == HHPageViewHorizontalType){
                [self addStatesHorizontally];
            }else{
                [self addStatesVertically];
            }

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
- (void) changeButtonStateForTag:(NSInteger)tag {
    for(NSInteger index = 1; index <= noOfPages; index++) {
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

- (void) updateStateForPageNumber:(NSInteger)page {
    if(page<=noOfPages && noOfPages!=0 && page!=currentPage) {
        if(page == 0) page = 1;
        [self changeButtonStateForTag:page];
    }
}
@end
