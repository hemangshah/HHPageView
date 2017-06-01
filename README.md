## HHPageView

![Build Status](https://travis-ci.org/hemangshah/HHPageView.svg?branch=master)
![License](https://img.shields.io/badge/License-MIT-lightgrey.svg)
![Platform](https://img.shields.io/badge/Platforms-iOS-red.svg)
![MadeWithLove](https://img.shields.io/badge/Made%20with%20%E2%9D%A4-India-green.svg)

## Installation

**Manually** 

- Add `HHPageView.h` and  `HHPageView.m` to your Project. 
- You need to provide images for active and inactive state. You can use [these](https://github.com/hemangshah/HHPageView/tree/master/TestExample/TestExample/appImages) inside the sample project.
- **All set**.

## Usage

<b>Common steps:</b>

-  Import `HHPageView` in your class where you want to use.

- Bind your ViewController with this delegate: `HHPageViewDelegate`.

`@interface ViewController () <HHPageViewDelegate>`

`@end`

**1. Add in Storyboard or XIB.** 

- Define IBOutlet `HHPageView *pageView`.
- You can add a `UIView` of the size you want.
- Change the view type to `HHPageView` from the Identity Inspector > Custom Class.
- Add below code to customzie `HHPageView`.
- Done!

**2. You can also add `HHPageView` programmatically.** 

    HHPageView *pageView = [[HHPageView alloc] initWithFrame:CGRectMake(0, 0, 160, 32)];
    [self.view addSubview:pageView];

    //Set delegate to the pageView object. To handle page changes event.
    [pageView setDelegate:self];

    //Set Base View
    //Note: You don't need to set baseScrollView if there's only one HHPageView per view controller.
    [pageView setBaseScrollView:scrollView];

    //Set Images for Active and Inactive state.
    [pageView setImageActiveState:[UIImage  imageNamed:@"selected.png"] InActiveState:[UIImage  imageNamed:@"unselected.png"]];

    //Tell PageController, the number of pages you want to show.
    [pageView setNumberOfPages:totalPages];

    //Set HHPageView Type: Horizontal or Vertical
    [pageControllerVertical setHHPageViewType:HHPageViewVerticalType];

    //Tell PageController to show page from this page index.
    [pageView setCurrentPage:3];

    //Show when you ready!
    [pageView load];
    
**3. Handling Page Change Event**

    - (void) HHPageView:(HHPageView *)pageView currentIndex:(NSInteger)currentIndex {
        [scrollView setContentOffset:CGPointMake(currentIndex * scrollView.frame.size.width, 0) animated:YES];
    }

**4. You should also implement UIScrollView Delegate**

    - (void)scrollViewDidEndDecelerating:(UIScrollView *)scroll {
        //If its not dragging
        if(!scroll.isDragging) {
            if(scroll.tag == HORIZONTAL_SCROLLVIEW_TAG) {
                //for HHPageView horizontal
                NSInteger pageWidth = scroll.frame.size.width;
                NSInteger page = (floor((scroll.contentOffset.x - pageWidth / 2) / pageWidth) + 1) + 1;
                [pageController updateStateForPageNumber:page];
            } else {
                //for HHPageView vertical
                NSInteger pageHeight = scroll.frame.size.height;
                NSInteger page = (floor((scroll.contentOffset.y - pageHeight / 2) / pageHeight) + 1) + 1;
                [pageControllerVertical updateStateForPageNumber:page];
            }
        }
    }

## Features

1. A replacement of UIPageControl in iOS.
2. Add either Horizontally or Vertically.
3. Customization & Dynamic.
4. Easy to setup and use.

## Screenshot
<table>
<tr>
<td><img src = "https://github.com/hemangshah/HHPageView/blob/master/TestExample/Screenshots/1.png" alt = "Usage example"></td>
</tr>
</table>

## ToDo[s]

<b><i>[New Features]</i></b>

- [ ] Customization options
- [ ] Swift Support
- [ ] Examples

<b>Have an idea for improvements of this class?
Please open an [issue](https://github.com/hemangshah/printer/issues/new).</b>

## Credits

<b>[Hemang Shah](www.ikiwitech.com)</b>

**You can shoot me an [email](http://www.google.com/recaptcha/mailhide/d?k=01IzGihUsyfigse2G9z80rBw==&c=vU7vyAaau8BctOAIJFwHVbKfgtIqQ4QLJaL73yhnB3k=) to contact.**

## License

The MIT License (MIT)

> Read the [LICENSE](https://github.com/hemangshah/HHPageView/blob/master/LICENSE) file for details.
