//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Inderbir Singh on 02/02/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController() 
@property (nonatomic) BOOL userIsInMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;

@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize brain = _brain;
@synthesize userIsInMiddleOfEnteringANumber = _userIsInMiddleOfEnteringANumber;

//lazy init in getter of getBrain
- (CalculatorBrain *)brain {
    if (_brain == nil) 
        _brain = [[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton*)sender {
    
    NSString *digit = [sender currentTitle];
    NSLog(@"digit pressed = %@", digit);
    
    if (self.userIsInMiddleOfEnteringANumber) {
    UILabel *myDisplay = self.display;//[self display]
    NSString *currentText = [myDisplay text]; //self.display.text
    NSString *newText = [currentText stringByAppendingString:digit];
    [myDisplay setText:newText];
    } else {
        self.display.text = digit;
        self.userIsInMiddleOfEnteringANumber = YES;
    }
        
    
    //one line to do above
   //self.display.text = [self.display.text stringByAppendingString:digit];
    
        
    
}
- (IBAction)operationPressed:(UIButton*)sender {
    NSLog(@"Operation Pressed = %@", sender.currentTitle);
    double result = [self.brain performOperation:sender.currentTitle];
    NSString *res = [NSString stringWithFormat:@"%g", result];
    self.display.text = res;
}

- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInMiddleOfEnteringANumber = NO;
}

@end
