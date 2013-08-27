//
//  ViewController.h
//  TestExample
//
//  Created by Hemang Shah  on 21/08/13.
//  Copyright (c) 2013 Hemang Shah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHPageControl.h"

@interface ViewController : UIViewController<HHPageControllerDelegate>
{
    IBOutlet HHPageControl *pageController;
    IBOutlet HHPageControl *pageControllerVertical;
    
    IBOutlet UIScrollView *scrollView;
    IBOutlet UIScrollView *scrollViewVertical;
}
@end