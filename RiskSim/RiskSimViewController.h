//
//  RiskSimViewController.h
//  RiskSim
//
//  Created by bobz on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RiskSimViewController : UIViewController {
    UITextField     *oUnits;
    UITextField     *dUnits;
    UITextField     *results;
    
}

@property (nonatomic, retain) IBOutlet UITextField *oUnits;
@property (nonatomic, retain) IBOutlet UITextField *dUnits;
@property (nonatomic, retain) IBOutlet UITextField *results;

- (IBAction)calculate:(id)sender;
- (bool)doSim:(int) o :(int) d;	
- (int) runMonteCarlo:(int) o:(int) d;
@end
