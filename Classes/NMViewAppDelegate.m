//
//  NMViewAppDelegate.m
//  NMView
//
//  Created by Benjamin Broll on 27.03.11.
//  Copyright 2011 NEXT Munich GmbH. The App Agency. All rights reserved.
//

/*
 * The BSD License
 * http://www.opensource.org/licenses/bsd-license.php
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * - Neither the name of NEXT Munich GmbH nor the names of its contributors may
 *   be used to endorse or promote products derived from this software without
 *   specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

#import "NMViewAppDelegate.h"


@implementation NMViewAppDelegate

#pragma mark Properties

@synthesize window;
@synthesize loadFromCodeController;
@synthesize loadFromNIBController;
@synthesize layoutSupportController;
@synthesize automaticLayoutChangesController;
@synthesize gridLayoutController;
@synthesize viewTemplatesController;



#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	// These defines are set in the different targets.
	
#ifdef LOAD_FROM_CODE
	[window addSubview:loadFromCodeController.view];
#elif LOAD_FROM_NIB
	[window addSubview:loadFromNIBController.view];
#elif LAYOUT_SUPPORT
	[window addSubview:layoutSupportController.view];
#elif AUTOMATIC_LAYOUT_CHANGES
	[window addSubview:automaticLayoutChangesController.view];
#elif GRID_LAYOUT
	[window addSubview:gridLayoutController.view];
#elif VIEW_TEMPLATES
	[window addSubview:viewTemplatesController.view];
#endif
	
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [loadFromCodeController release];
    [loadFromNIBController release];
    [layoutSupportController release];
    [automaticLayoutChangesController release];
	[gridLayoutController release];
    [viewTemplatesController release];
    [window release];
	
    [super dealloc];
}

@end
