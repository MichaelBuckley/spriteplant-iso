//
//  SpritePlantIsoDocumentController.m
//  Spriteplant Iso
//
//  Created by Buckley on 11/4/13.
//  Copyright (c) 2013 Michael Buckley. All rights reserved.
//

#import "SpritePlantIsoDocumentController.h"

@interface SpritePlantIsoDocumentController ()

@property (nonatomic, readwrite, assign) BOOL closedAllDocuments;

@end

@implementation SpritePlantIsoDocumentController

- (void) document: (NSDocument*) document shouldClose: (BOOL) shouldClose contextInfo: (void*) contextInfo
{
    if (!shouldClose)
    {
        [self setClosedAllDocuments: NO];
    }
}

- (void) closeAllDocumentsWithDelegate: (id)    delegate
                   didCloseAllSelector: (SEL)   didCloseAllSelector
                           contextInfo: (void*) contextInfo
{
    [self setClosedAllDocuments: YES];
    
    for (NSDocument* document in [self documents])
    {
        [document canCloseDocumentWithDelegate: self
                           shouldCloseSelector: @selector(document:shouldClose:contextInfo:)
                                   contextInfo: NULL];
    }
    
    BOOL closedAllDocuments = [self closedAllDocuments];
    
    NSMethodSignature* signature = [[self class] methodSignatureForSelector: didCloseAllSelector];
    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature: signature];
    [invocation setTarget: self];
    [invocation setSelector: didCloseAllSelector];
    [invocation setArgument: &closedAllDocuments atIndex: 2];
    [invocation setArgument: &contextInfo atIndex: 3];
    
    [invocation invoke];
}


@end
