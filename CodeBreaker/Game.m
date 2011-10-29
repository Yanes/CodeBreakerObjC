//
//  Game.m
//  CodeBreaker
//
//  Created by Pedro Santos on 10/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Game.h"

@implementation Game

@synthesize secretCode;

-(void) dealloc
{
    [secretCode release];
    [super dealloc];
}

-(id) initWith:(id<GameMessagesProtocol>)delegate
{
    if ((self = [super init])!= nil) 
    {
        messagesDelegate = delegate;
        return self;
    }
    
    return nil;
}

-(void) start:(NSString*)secret
{
    self.secretCode = secret;
    
    if(messagesDelegate != nil)
    {
        [messagesDelegate putsGameMessage:@"Welcome to Codebreaker!"];
        [messagesDelegate putsActionMessage:@"Enter guess:"];
    }
}

-(BOOL) exactMatch:(NSString*)guess at:(NSUInteger)index
{
    return [self.secretCode characterAtIndex:index] == [guess characterAtIndex:index];
}

-(BOOL) numberMatch:(NSString*)guess at:(int)index
{
    NSString* character = [NSString stringWithFormat:@"%c", [guess characterAtIndex:index]];
    
    return [self.secretCode rangeOfString:character].location != NSNotFound && !([self exactMatch:guess at:index]);
}

-(void) guess:(NSString*)guess
{
    NSMutableString* mark = [[NSMutableString alloc] initWithString:@""];
    
    for (int i = 0; i < 4; i++) 
    {
        if([self exactMatch:guess at:i])
        {
            [mark appendString:@"+"];
        }
    }
    for (int i = 0; i < 4; i++) 
    {
        if([self numberMatch:guess at:i])
        {
            [mark appendString:@"-"];
        }
    }
    
    [messagesDelegate putsResponseMessage:mark];
}


@end
