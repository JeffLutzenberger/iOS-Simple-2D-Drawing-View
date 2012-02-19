//
//  DrawingView2DAppDelegate.h
//  DrawingView2D
//
//  Created by Jeff Lutzenberger on 2/12/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DrawingView2DViewController;

@interface DrawingView2DAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet DrawingView2DViewController *viewController;

@end
