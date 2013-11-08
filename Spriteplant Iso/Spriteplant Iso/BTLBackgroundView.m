//
//  BTLBackgroundView.m
//  Spriteplant Iso
//
//  Created by Buckley on 11/7/13.
//  Copyright (c) 2013 Michael Buckley. All rights reserved.
//

#import "BTLBackgroundView.h"

@implementation BTLBackgroundView

- (id) initWithFrame: (NSRect) frameRect
{
    if (self = [super initWithFrame: frameRect])
    {
        _checkerSize = 20.0f;
        _backgroundColor = [NSColor colorWithDeviceWhite: 0.7 alpha: 1.0];
        _alternateColor  = [NSColor whiteColor];
    }
    
    return self;
}

- (BOOL) isFlipped
{
    return YES;
}

- (void) drawRect: (NSRect) dirtyRect
{
    NSRect bounds = [self bounds];
    
    CGFloat  checkerSize     = [self checkerSize];
    NSColor* backgroundColor = [self backgroundColor];
    NSColor* alternateColor  = [self alternateColor];
    
    uint32_t horizontalTiles = ceil(bounds.size.width  / checkerSize);
    uint32_t verticalTiles   = ceil(bounds.size.height / checkerSize);
    
    for (uint32_t x = 0; x < horizontalTiles; ++x)
    {
        for (uint32_t y = 0; y < verticalTiles; ++y)
        {
            if ((x + y) % 2 == 0)
            {
                [backgroundColor set];
            }
            else
            {
                [alternateColor set];
            }
            
            NSRectFill(NSMakeRect(x * checkerSize, y * checkerSize, (x + 1) * checkerSize,  (y + 1) * checkerSize));
        }
    }
}

@end
