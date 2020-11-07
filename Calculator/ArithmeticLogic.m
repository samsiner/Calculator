//
//  ArithmeticLogic.m
//  Calculator
//
//  Created by Sam Siner on 10/4/20.
//  Copyright © 2020 Sam Siner. All rights reserved.
//

#import "ArithmeticLogic.h"

@implementation ArithmeticLogic

NSMutableString *firstOperand;
NSMutableString *secondOperand;
BOOL isFirstOperand;
NSMutableString *theOperator;
double total;
NSNumberFormatter *formatter;

+ (void)initialize{
    firstOperand = [NSMutableString stringWithString:@""];
    secondOperand = [NSMutableString stringWithString:@""];
    isFirstOperand = true;
    theOperator = [NSMutableString stringWithString:@""];
    total = 0.0;
    
    // Attempt to keep most characters on the screen without truncating
    formatter = [[NSNumberFormatter alloc]init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setUsesGroupingSeparator:NO];
    [formatter setMaximumFractionDigits: 3];
}

// Handle trig operator (sin, cos, tan)
- (NSString*)doTrigOperator:(NSMutableString*)key{
    double result = 0.0;
       
    if (isFirstOperand && ![firstOperand isEqualToString:@""]) {
        double firstNumber = [firstOperand doubleValue];
        if ([key isEqualToString:@"sin"]){
            result = __sinpi(firstNumber / 180.0);
        } else if ([key isEqualToString:@"cos"]){
            result = __cospi(firstNumber / 180.0);
        } else if ([key isEqualToString:@"tan"]){
            result = __tanpi(firstNumber / 180.0);
        }

        firstOperand = [NSMutableString stringWithFormat:@"%.20f", result];
        return [formatter stringFromNumber:[NSNumber numberWithDouble:result]];
    } else if (!isFirstOperand && ![secondOperand isEqualToString:@""]){
        double secondNumber = [secondOperand doubleValue];
        if ([key isEqualToString:@"sin"]){
            result = __sinpi(secondNumber / 180.0);
        } else if ([key isEqualToString:@"cos"]){
            result = __cospi(secondNumber / 180.0);
        } else if ([key isEqualToString:@"tan"]){
            result = __tanpi(secondNumber / 180.0);
        }
        
        secondOperand = [NSMutableString stringWithFormat:@"%.20f", result];
        return [formatter stringFromNumber:[NSNumber numberWithDouble:result]];
    }
    return nil;
}

// Handle operator (+, -, /, *)
- (NSString*)doOperator:(NSMutableString*)key{
    if ([firstOperand isEqualToString:@""] && [secondOperand isEqualToString: @""]){
        return nil;
    }
    if (isFirstOperand) {
        theOperator = key;
        isFirstOperand = false;
    } else {
        NSString* returnValue = [self completeOperation];
        isFirstOperand = false;
        theOperator = key;
        return returnValue;
    }
    return nil;
}

// Handle digits 0-9 or dot
- (NSString*)addDigitorDot:(NSMutableString*)key{
    if (!(([key isEqualToString:@"."]) && ((isFirstOperand && [firstOperand containsString:@"."]) || (!isFirstOperand && [secondOperand containsString:@"."]))) && !(([key isEqualToString:@"0"]) && ((isFirstOperand && [firstOperand isEqualToString:@""]) || (!isFirstOperand && [secondOperand isEqualToString:@""])))){

        if (isFirstOperand){
            [firstOperand appendString:key];
            return firstOperand;
        } else {
            [secondOperand appendString:key];
            return secondOperand;
        }
    }
    return nil;
}

// Handle completion of operation, whether due to multiple operators in a row or due to equals sign
- (NSString*)completeOperation{
    if (isFirstOperand || [theOperator isEqualToString:@""]){
        return nil;
    }
    
    if (![firstOperand isEqualToString:@""] && ![secondOperand isEqualToString:@""]){
        double firstNumber = [firstOperand doubleValue];
        double secondNumber = [secondOperand doubleValue];
        
        if ([theOperator isEqualToString:@"+"]){
            total = firstNumber + secondNumber;
        } else if ([theOperator isEqualToString:@"-"]){
            total = firstNumber - secondNumber;
        } else if ([theOperator isEqualToString:@"*"]){
            total = firstNumber * secondNumber;
        } else if ([theOperator isEqualToString:@"/"]){
            total = firstNumber / secondNumber;
        }
        
        firstOperand = [NSMutableString stringWithFormat:@"%.3f", total];
        [secondOperand setString:@""];
        [theOperator setString:@""];
        isFirstOperand = true;
        NSLog(@"%@", [formatter stringFromNumber:[NSNumber numberWithDouble:total]]);
        return [formatter stringFromNumber:[NSNumber numberWithDouble:total]];
    }
    return nil;
}

// Clears all variables
- (void)clear{
    [firstOperand setString:@""];
    [secondOperand setString:@""];
    [theOperator setString:@""];
    isFirstOperand = true;
    total = 0;
}

@end
