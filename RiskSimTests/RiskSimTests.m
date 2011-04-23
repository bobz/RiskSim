//
//  RiskSimTests.m
//  RiskSimTests
//
//  Created by bobz on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RiskSimTests.h"
#import "RiskSimViewController.h"


@implementation RiskSimTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testDoSim
{
    RiskSimViewController *controller = [RiskSimViewController new];
    ////    controller = [controller init];
    [controller doSim: 50 : 50 ];
}

- (void)testRunMonteCarlo
{
    RiskSimViewController *controller = [RiskSimViewController new];
    ////    controller = [controller init];
    [controller runMonteCarlo: 50 : 50 ];
}

@end
