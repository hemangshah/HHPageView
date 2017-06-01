//
//  HHPageControl.h
//  
//
//  Created by Hemang Shah  on 05/07/13.
//  Copyright (c) 2013 Hemang Shah. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum HHPageControlType {
    HHPageControlHorizontalType = 0,
    HHPageControlVerticalType = 1
}HHPageControlType;

@class HHPageController;

@protocol HHPageControllerDelegate;

@interface HHPageController : UIView {
    @private
    UIImage *activeImage, *inactiveImage;
    NSInteger noOfPages;
    NSInteger currentPage;
    HHPageControlType pageControllerType;
}
@property (nonatomic, retain) id<HHPageControllerDelegate> delegate;
@property (nonatomic, retain) UIScrollView *baseScrollView;

- (void) setImageActiveState:(UIImage *)active InActiveState:(UIImage *)inactive;
- (void) setNumberOfPages:(NSInteger)pages;
- (void) setCurrentPage:(NSInteger)current;
- (void) load;
- (void) updateStateForPageNumber:(NSInteger)page;
- (void) setHHPageControlType:(HHPageControlType)pageControllertype;
@end

@protocol HHPageControllerDelegate<NSObject>
- (void) HHPageController:(HHPageController *)pageController currentIndex:(NSInteger)currentIndex;
@end
