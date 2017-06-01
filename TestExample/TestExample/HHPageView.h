//
//  HHPageControl.h
//  
//
//  Created by Hemang Shah  on 05/07/13.
//  Copyright (c) 2013 Hemang Shah. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum HHPageViewType {
    HHPageViewHorizontalType = 0,
    HHPageViewVerticalType = 1
}HHPageViewType;

@class HHPageView;

@protocol HHPageViewDelegate;

@interface HHPageView : UIView {
    @private
    UIImage *activeImage, *inactiveImage;
    NSInteger noOfPages;
    NSInteger currentPage;
    HHPageViewType pageControllerType;
}
@property (nonatomic, retain) id<HHPageViewDelegate> delegate;
@property (nonatomic, retain) UIScrollView *baseScrollView;

- (void) setImageActiveState:(UIImage *)active InActiveState:(UIImage *)inactive;
- (void) setNumberOfPages:(NSInteger)pages;
- (void) setCurrentPage:(NSInteger)current;
- (void) load;
- (void) updateStateForPageNumber:(NSInteger)page;
- (void) setHHPageViewType:(HHPageViewType)pageControllertype;
@end

@protocol HHPageViewDelegate<NSObject>
- (void) HHPageView:(HHPageView *)pageView currentIndex:(NSInteger)currentIndex;
@end
