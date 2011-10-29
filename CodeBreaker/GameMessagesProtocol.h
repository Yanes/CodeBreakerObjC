//
//  GameMessagesDelegate.h
//  CodeBreaker
//
//  Created by Pedro Santos on 10/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol GameMessagesProtocol <NSObject>

-(void) putsGameMessage:(NSString*)output;
-(void) putsActionMessage:(NSString*)output;
-(void) putsResponseMessage:(NSString*)output;

@end