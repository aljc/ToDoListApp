//
//  AddToDoItemViewController.m
//  ToDoList
//
//  Created by ajchang on 1/25/15.
//  Copyright (c) 2015 ajchang. All rights reserved.
//

#import "AddToDoItemViewController.h"

@interface AddToDoItemViewController ()

//access contents of text field user enters name of
//new to-do item by setting this view controller as an outlet
@property (weak, nonatomic) IBOutlet UITextField *textField;

//BUT only create a new to-do item if Save is tapped
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation AddToDoItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
// Check which one of the buttons got tapped.  If it was the Save button, create a new to-do item.
// Else (if it was Cancel), do nothing.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    //if Save button wasn't tapped
    if (sender != self.saveButton) return;
    
    //check whether the user entered any text in the text field
    if (self.textField.text.length > 0) {
        
        self.toDoItem = [[ToDoItem alloc] init];
        self.toDoItem.itemName = self.textField.text;
        self.toDoItem.completed = NO;
    }
}

@end
