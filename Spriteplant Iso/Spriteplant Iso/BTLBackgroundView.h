//
//  BTLBackgroundView.h
//  Spriteplant Iso
//
//  Created by Buckley on 11/7/13.
//  Copyright (c) 2013 Michael Buckley. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BTLBackgroundView : NSView

@property (nonatomic, readwrite, assign) CGFloat checkerSize;
@property (nonatomic, readwrite, strong) NSColor* backgroundColor;
@property (nonatomic, readwrite, strong) NSColor* alternateColor;

@end
