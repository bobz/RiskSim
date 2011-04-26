//
//  RiskSimViewController.m
//  RiskSim
//
//  Created by bobz on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RiskSimViewController.h"

@implementation RiskSimViewController
@synthesize oUnits, dUnits, results, oLimit;


- (void) calculate :(id) sender 
{
    int o = [oUnits.text intValue];
    int d = [dUnits.text intValue];
    int oLim = [oLimit.text intValue];
    
    if(oLim < 1) 
    {
        oLim = 1;
    }
    
    int wins = [self runMonteCarlo:o:d:oLim];

    results.text = [NSString stringWithFormat:@"%d", wins];
}

- (int) runMonteCarlo:(int) o:(int) d:(int) oLim
{
    int NUM_SIMS = 10000;
    
    int numWins = 0;
    
    for (int i = 0; i < NUM_SIMS ; i++)
    {
        
        if ([self doSim:o:d:oLim])
        {
            numWins++;
        }
        
    }
    int percent = (numWins * 100) / NUM_SIMS; 
    printf("%i O beats %i D %i times out of 100\n\n\n", o, d, percent);
    return percent;
}

- (bool)doSim :(int) o :(int) d :(int) oLim
{
    while (o > 1)
    {
        NSSortDescriptor* sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"self" ascending: NO];
        
        NSMutableArray *oRolls, *dRolls;
        
        oRolls = [NSMutableArray arrayWithCapacity:3];
        for(int j = 0; j < 3 && j < o-1; j++)
        {
            NSNumber *numResult = [NSNumber numberWithInt: (arc4random() % 6)+1 ];
            [oRolls addObject: numResult];
        }
        NSArray *oRollsSorted = [oRolls sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortOrder]];
        
        dRolls = [NSMutableArray arrayWithCapacity:2];
        for(int j = 0; j < 2 && j < d; j++)
        {
            NSNumber *numResult = [NSNumber numberWithInt: (arc4random() % 6)+1 ];
            [dRolls addObject: numResult];
        }
        NSArray *dRollsSorted = [dRolls sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortOrder]];
        
//        printf("\n\nOffensive rolls:\n");
//        for (int j = 0; j < [oRollsSorted count]; j++)
//        {
//            NSNumber *number = [oRollsSorted objectAtIndex:j];
//            printf("%i\n", [number intValue]);
//        }
//        
//        printf("Defensive rolls:\n");
//        for (int j = 0; j < [dRollsSorted count]; j++)
//        {
//            NSNumber *number = [dRollsSorted objectAtIndex:j];
//            printf("%i\n", [number intValue]);
//        }
        
        for (int run = 0; run < [oRollsSorted count] && run < [dRollsSorted count]; run++)
        {
            NSNumber *oRun = [oRollsSorted objectAtIndex:run];
            NSNumber *dRun = [dRollsSorted objectAtIndex:run];
            if ([oRun compare: dRun] == NSOrderedDescending)
            {
                d--;
            }
            else
            {
                o--;
            }
        }
        
//        printf("%i Offensive Units left.\n", o);
//        printf("%i Deffensive Units left.\n\n", d);
        
        
        if (o <=oLim) return false;
        if (d <=0) return true;
    }
    
    return false;

}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
