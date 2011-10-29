//
//  Game.h
//  CodeBreaker
//
//  Created by Pedro Santos on 10/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameMessagesProtocol.h"

@interface Game : NSObject 
{
    NSString* secretCode;
    
    id<GameMessagesProtocol> messagesDelegate;
}

@property (copy, nonatomic) NSString* secretCode;

-(id) initWith:(id<GameMessagesProtocol>)delegate;

-(void) start:(NSString*)secret;
-(void) guess:(NSString*)guess;

@end
