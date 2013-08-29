HHPageController
================

If you ever have the thought of setting images for a page control then "HHPageController" is the one you can use.

<h3>How To Get Started</h3>

 1. Add HHPageController.h and HHPageController.m files to your project.
 2. #import "HHPageController.h" where you want to use HHPageController.
 3. You can use it in two ways, set the HHPageController in Interface Builder (IB) or create it dynamically.
 4. Check the "Example" below to get start - its easy!
 
Note: If you planning to add HHPageController through IB then just drag and drop a UIView on XIB or StoryBoard, change its type from UIView to HHPageController, and that's it! Now you need to create IBOutlet for HHPageController and bind the object with the IB.

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

<h3>Features</h3>
1. Supports Horizontal or Vertical types
2. Change its UI based on image size.
3. Easy to implement
4. Test example added for reference
5. Support ARC

<h3>Screenshots</h3>
![alt tag](http://i41.tinypic.com/2lkegj9.png)
![alt tag](http://i43.tinypic.com/2wqbwgz.png)


<h3>Licence<h3>
The MIT License (MIT)

Copyright (c) 2013 Hemang Shah

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
