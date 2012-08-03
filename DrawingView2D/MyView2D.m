//
//  MyView2D.m
//  DrawingView2D
//
//  Created by Jeff Lutzenberger on 2/12/12.
//  Copyright 2012 Hellroaring Micromachines, LLC. All rights reserved.
//

#import "MyView2D.h"


@implementation MyView2D

- (id)initWithCoder:(NSCoder *)aDecoder 
{
    self = [super initWithCoder:aDecoder];
    if(self){
        //
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [super  drawRect:rect];
    [super DrawCircle];
}

@end
