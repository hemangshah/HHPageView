HHPageController
================

If you ever have the thought of setting images as a place holder then "HHPageController" is the one you can use.

A sample is added at the end!

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
    
<h3>HHPageController Delegate</h3>

    //To track of page change HHPageController is coming with a delegate.
    - (void) HHPageController:(HHPageControl *)pageController currentIndex:(int)currentIndex
    {
        NSLog(@"Current Page Index %d",currentIndex);
    }
    
<h3>UIScrollView Delegate</h3>    
    
    - (void)scrollViewDidEndDecelerating:(UIScrollView *)scroll
    {
        //If its our scrollview
        if([scroll isEqual:scrollView])
        {
            //If its not dragging
            if(!scroll.isDragging)
            {
                //get page number to update HHPageController
                int pageWidth = scroll.frame.size.width;
                int page = (floor((scroll.contentOffset.x - pageWidth / 2) / pageWidth) + 1) + 1;
                [pageController updateStateForPageNumber:page];
            }
        }
    }
    
<h3>Support ARC</h3>

<h3>Screenshots</h3>
![alt tag](http://i41.tinypic.com/2lkegj9.png)
![alt tag](http://i43.tinypic.com/2wqbwgz.png)


<h3>Test Example</h3>
https://www.dropbox.com/s/9002ka5pbs5ii6a/TestExample.zip
