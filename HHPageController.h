//
//  HHPageControl.h
//  
//
//  Created by Hemang Shah  on 05/07/13.
//  Copyright (c) 2013 Hemang Shah. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HHPageControl;

@protocol HHPageControllerDelegate<NSObject>
- (void) HHPageController:(HHPageControl *)pageController currentIndex:(int)currentIndex;
@end

@interface HHPageControl : UIView
{
    @private
    UIImage *activeImage, *inactiveImage;
    int noOfPages;
    int currentPage;
}
@property (nonatomic, retain) id<HHPageControllerDelegate> delegate;

+ (HHPageControl *)sharedPageController;
- (void) setImageActiveState:(UIImage *)active InActiveState:(UIImage *)inactive;
- (void) setNumberOfPages:(int)pages;
- (void) setCurrentPage:(int)current;
- (void) load;
- (void) updateStateForPageNumber:(int)page;
@end
