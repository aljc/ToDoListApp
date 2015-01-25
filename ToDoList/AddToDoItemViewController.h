//
//  AddToDoItemViewController.h
//  ToDoList
//
//  Created by ajchang on 1/25/15.
//  Copyright (c) 2015 ajchang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"

@interface AddToDoItemViewController : UIViewController

//note: need to access the to-do item from table view controller later, so make this property public (.h)
@property ToDoItem *toDoItem;

@end
