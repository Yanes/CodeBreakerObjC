//
//  CodeBreakerAppDelegate.h
//  CodeBreaker
//
//  Created by Pedro Santos on 10/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CodeBreakerViewController;

@interface CodeBreakerAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet CodeBreakerViewController *viewController;

@end
