//
//  BTLDocumentWindowController.m
//  Spriteplant Iso
//
//  Created by Buckley on 11/3/13.
//  Copyright (c) 2013 Michael Buckley. All rights reserved.
//

#import "BTLSceneDelegate.h"
#import "SpritePlantIsoDocumentWindow.h"
#import "SpritePlantIsoDocumentWindowController.h"

@interface SpritePlantIsoDocumentWindowController ()

@property (nonatomic, readonly, strong) NSMutableSet* documents;

@end

@implementation SpritePlantIsoDocumentWindowController

- (id) initWithWindow:(NSWindow*)window
{
    self = [super initWithWindow:window];
    if (self) {
        _documents = [NSMutableSet new];
        _sceneDelegate = [BTLSceneDelegate new];
    }
    return self;
}

- (void) windowDidLoad
{
    [super windowDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(windowWillClose:)
                                                 name: NSWindowWillCloseNotification
                                               object: [self window]];
    
    SpritePlantIsoDocumentWindow* window = (SpritePlantIsoDocumentWindow*) [self window];
    
    [[window sceneView] setDelegate: [self sceneDelegate]];
}

- (void) windowWillClose: (NSNotification*) notification
{
    NSWindow* window = [self window];
    
    if ([notification object] == window)
    {
        [self removeDocuments: [self documents]];
        
        [[NSNotificationCenter defaultCenter] removeObserver: self];
    }
}

- (void) setDocument: (NSDocument*) document
{
    // This method intentionally left empty
}

- (NSDocument*) document
{
    return nil;
}

- (void) addDocument: (NSDocument*) document
{
    if (![[self documents] containsObject: document])
    {
        [[self documents] addObject: document];
        [document addWindowController: self];
    }
}

- (void) addDocuments: (NSSet*) documentsToAdd
{
    for (NSDocument* document in documentsToAdd)
    {
        [self addDocument: document];
    }
}

- (void) removeDocument: (NSDocument*) document
{
    if (![[self documents] containsObject: document])
    {
        [document removeWindowController: self];
        [[self documents] removeObject: document];
    }
}

- (void) removeDocuments: (NSSet*) documentsToRemove
{
    for (NSDocument* document in documentsToRemove)
    {
        [self removeDocument: document];
    }
}

@end
