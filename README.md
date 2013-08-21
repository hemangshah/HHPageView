HHPageController
================

If you ever have the thought of setting images as a place holder then "HHPageController" is the one you can use.

<h3>How To Get Started</h3>

 1. Add HHPageController.h and HHPageController.m files to your project.
 2. #import "HHPageController.h" where you want to use HHPageController.
 3. If you want you can use it either way, set the HHPageController in Interface Builder (IB) or create it dynamically.
 4. Check the "Example" below to get start - its easy!
 

Note: If you wish to add HHPageController through IB then just drag and drop a UIView on XIB or StoryBoard, change its type from UIView to HHPageController, and that's it! Now you need to create IBOutlet for HHPageController and bind the object to the IB.

<h3>Example Usage</h3>

    //Set delegate to the page controller object. To handle page change event.
    [pageController setDelegate:self];
    
    //Set Images for Active and Inactive state.
    [pageController setImageActiveState:[UIImage  imageNamed:@"page_selected.png"] InActiveState:[UIImage  imageNamed:@"page_unselected.png"]];
    
    //Tell PageController, the number of pages you want to show.
    [pageController setNumberOfPages:5];
    
    //Tell PageController to show page from this page index.
    [pageController setCurrentPage:3];
    
    //Show when you ready!
    [pageController load];
    
<h3>Delegate</h3>

    //To track of page change HHPageController is coming with a delegate.
    - (void) HHPageController:(HHPageControl *)pageController currentIndex:(int)currentIndex
    {
        NSLog(@"Current Page Index %d",currentIndex);
    }
    
    
<h3>Support ARC</h3>
