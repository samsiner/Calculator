//
//  ArithmeticLogic.h
//  Calculator
//
//  Created by Sam Siner on 10/4/20.
//  Copyright © 2020 Digital Factory. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArithmeticLogic : NSObject{
}
- (NSString*)doTrigOperator:(NSMutableString*)key;
- (NSString*)doOperator:(NSMutableString*)key;
- (NSString*)addDigitorDot:(NSMutableString*)key;
- (NSString*)completeOperation;
- (void)clear;

@end

