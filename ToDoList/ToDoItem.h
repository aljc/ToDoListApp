//
//  ToDoItem.h
//  ToDoList
//
//  Created by ajchang on 1/25/15.
//  Copyright (c) 2015 ajchang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
