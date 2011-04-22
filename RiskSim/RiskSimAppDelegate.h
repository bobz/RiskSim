//
//  RiskSimAppDelegate.h
//  RiskSim
//
//  Created by bobz on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RiskSimViewController;

@interface RiskSimAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet RiskSimViewController *viewController;

@end
