//
//  SpritePlantIsoApplicationDelegate.m
//  Spriteplant Iso
//
//  Created by Buckley on 11/3/13.
//  Copyright (c) 2013 Michael Buckley. All rights reserved.
//

#import "SpritePlantIsoApplicationDelegate.h"
#import "SpritePlantIsoNotifications.h"
#import "SpritePlantIsoDocumentWindowController.h"

@interface SpritePlantIsoApplicationDelegate ()

@property (nonatomic, readonly, strong) SpritePlantIsoDocumentWindowController* windowController;

@end

@implementation SpritePlantIsoApplicationDelegate

- (void) applicationWillFinishLaunching:(NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(handleNewDocumentWindowRequestedNotification:)
                                                 name: SpritePlantIsoNewDocumentWindowNotification
                                               object: nil];
    
    _windowController = [[SpritePlantIsoDocumentWindowController alloc]
                         initWithWindowNibName: @"SpritePlantIsoDocument"];
}

- (void) handleNewDocumentWindowRequestedNotification: (NSNotification*) notification
{
    [[self windowController] addDocument: [notification object]];
}

@end
