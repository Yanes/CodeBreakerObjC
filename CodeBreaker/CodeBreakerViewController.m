//
//  CodeBreakerViewController.m
//  CodeBreaker
//
//  Created by Pedro Santos on 10/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CodeBreakerViewController.h"

@implementation CodeBreakerViewController

- (void)dealloc
{
    [lblWelcomeMessage release];
    [game release];
    [lblActionMessage release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void) putsGameMessage:(NSString*)output
{
    lblWelcomeMessage.text = output;
}

-(void) putsActionMessage:(NSString*)output
{
    lblActionMessage.text = output;
}

-(void) putsResponseMessage:(NSString*)output
{
    lblActionMessage.text = output;
}

- (IBAction) PressedGuess:(id)sender
{
    [game guess:txtGuess.text];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    game = [[Game alloc] initWith:self];
    
    [game start:txtStartGuess.text];
    
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [lblWelcomeMessage release];
    lblWelcomeMessage = nil;
    [lblActionMessage release];
    lblActionMessage = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
