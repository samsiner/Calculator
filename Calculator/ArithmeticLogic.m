//
//  ArithmeticLogic.m
//  Calculator
//
//  Created by Sam Siner on 10/4/20.
//  Copyright © 2020 Digital Factory. All rights reserved.
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
    NSLog(@"Initializing");
    
    firstOperand = [NSMutableString stringWithString:@""];
    secondOperand = [NSMutableString stringWithString:@""];
    isFirstOperand = true;
    theOperator = [NSMutableString stringWithString:@""];
    total = 0.0;
    
    formatter = [[NSNumberFormatter alloc]init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setUsesGroupingSeparator:NO];
    [formatter setUsesSignificantDigits:YES];
    [formatter setMaximumSignificantDigits: 6];
    
    NSLog(@"%@", firstOperand);
    NSLog(@"%@", secondOperand);
    NSLog(isFirstOperand ? @"True" : @"False");
    NSLog(@"%@", theOperator);
    NSLog(@"%.21g", total);
}
    
- (NSString*)doTrigOperator:(NSMutableString*)key{
    
    double result = 0.0;
       
    if (isFirstOperand) {
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
    } else {
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

- (void)clear{
    [firstOperand setString:@""];
    [secondOperand setString:@""];
    [theOperator setString:@""];
    isFirstOperand = true;
    total = 0;
}

@end
