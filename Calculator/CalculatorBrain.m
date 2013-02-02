//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Inderbir Singh on 02/02/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray * operandStack;
@end

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;

- (NSMutableArray*)operandStack {
    if (_operandStack == nil) 
        _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}

- (void) pushOperand: (double)operand {
    [self.operandStack addObject: [NSNumber numberWithDouble:operand]];
    
}

- (double) popOperand {
    NSNumber* number = [self.operandStack lastObject];
    if (number != nil) 
        [self.operandStack removeLastObject];
    return number.doubleValue;
}

- (double) performOperation: (NSString*)operation {
    double result=0;
    if ([operation isEqualToString: @"+"]) {
        result = [self popOperand] + [self popOperand];
        
    } else if ([operation isEqualToString:@"-"]) {
        result = [self popOperand] - [self popOperand];
        
    } else if ([operation isEqualToString:@"*"]) {
        result = [self popOperand] * [self popOperand];
        
    } else if ([operation isEqualToString:@"/"]) {
        result = [self popOperand] / [self popOperand];
    }
    //push result to operandStack so that you work with it
    [self.operandStack addObject:[NSNumber numberWithDouble:result]];
    return result;
    
}

@end
