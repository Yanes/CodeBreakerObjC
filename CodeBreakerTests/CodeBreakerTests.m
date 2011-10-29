#import <SenTestingKit/SenTestingKit.h>
#import "Kiwi.h"

#import "GameMessagesProtocol.h"
#import "Game.h"

SPEC_BEGIN(CodeBreakerSpec)

describe(@"Game", ^{
    
    __block Game* game = nil;
    __block id output = nil;
    
    beforeEach(^{
        output = [KWMock nullMockForProtocol:@protocol(GameMessagesProtocol)];
        game = [[Game alloc] initWith:output];
    });
    
    afterEach(^{
        [game release];
        game = nil;
    });
    
    describe(@"#Start", ^{
        it(@"sends a welcome message", ^{
            
            [[[output should] receive] putsGameMessage:@"Welcome to Codebreaker!"];
            
            [game start:@"1234"];
        });
        
        it(@"propts for the first guess", ^{
            
            [[[output should] receive] putsActionMessage:@"Enter guess:"];
            
            [game start:@"1234"];
        });
    });
    
    describe(@"#Guess", ^{
        
        context(@"with no matches", ^{
            it(@"sends a mark with ''", ^{
                
                [game start:@"1234"];
                [[[output should] receive] putsResponseMessage:@""];
                [game guess:@"5555"];
            });
        });
        
        context(@"with 1 number match", ^{
            it(@"sends a mark with '-'", ^{
                
                [game start:@"1234"];
                [[[output should] receive] putsResponseMessage:@"-"];
                [game guess:@"2555"];
            });
        });
        
        context(@"with 1 exact match", ^{
            it(@"sends a mark with '+'", ^{
                
                [game start:@"1234"];
                [[[output should] receive] putsResponseMessage:@"+"];
                [game guess:@"1555"];
            });
        });
        
        context(@"with 2 number matches", ^{
            it(@"sends a mark with '--'", ^{
                
                [game start:@"1234"];
                [[[output should] receive] putsResponseMessage:@"--"];
                [game guess:@"2355"];
            });
        });
        
        context(@"with 1 number match and 1 exact match (in that order)", ^{
            it(@"sends a mark with '+-'", ^{
                
                [game start:@"1234"];
                [[[output should] receive] putsResponseMessage:@"+-"];
                [game guess:@"2535"];
            });
        });
    });
});

SPEC_END
