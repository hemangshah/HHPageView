//
//  HHPageControl.h
//  
//
//  Created by Hemang Shah  on 05/07/13.
//  Copyright (c) 2013 Hemang Shah. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum HHPageControlType
{
    HHPageControlHorizontalType = 0,HHPageControlVerticalType = 1
}HHPageControlType;

@class HHPageControl;

@protocol HHPageControllerDelegate;

@interface HHPageControl : UIView
{
    @private
    UIImage *activeImage, *inactiveImage;
    int noOfPages;
    int currentPage;
    HHPageControlType pageControllerType;
}
@property (nonatomic, retain) id<HHPageControllerDelegate> delegate;

- (void) setImageActiveState:(UIImage *)active InActiveState:(UIImage *)inactive;
- (void) setNumberOfPages:(int)pages;
- (void) setCurrentPage:(int)current;
- (void) load;
- (void) updateStateForPageNumber:(int)page;
- (void) setHHPageControlType:(HHPageControlType)pageControllertype;
@end

@protocol HHPageControllerDelegate<NSObject>
- (void) HHPageController:(HHPageControl *)pageController currentIndex:(int)currentIndex;
@end