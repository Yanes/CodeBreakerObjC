//
//  CodeBreakerViewController.h
//  CodeBreaker
//
//  Created by Pedro Santos on 10/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameMessagesProtocol.h"
#import "Game.h"

@interface CodeBreakerViewController : UIViewController <GameMessagesProtocol>
{
    Game* game;
    
    IBOutlet UILabel *lblWelcomeMessage;
    IBOutlet UILabel *lblActionMessage;
    IBOutlet UITextField  *txtGuess;
    IBOutlet UITextField  *txtStartGuess;
}

- (IBAction) PressedGuess:(id)sender;

@end
