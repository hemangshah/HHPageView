//
//  ViewController.h
//  TestExample
//
//  Created by Hemang Shah  on 21/08/13.
//  Copyright (c) 2013 Hemang Shah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHPageController.h"

@interface ViewController : UIViewController<HHPageControllerDelegate>
{
    IBOutlet HHPageController *pageController;
    IBOutlet HHPageController *pageControllerVertical;
    
    IBOutlet UIScrollView *scrollView;
    IBOutlet UIScrollView *scrollViewVertical;
}
@end