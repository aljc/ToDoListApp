//
//  ToDoListTableViewController.m
//  ToDoList
//
//  Created by ajchang on 1/25/15.
//  Copyright (c) 2015 ajchang. All rights reserved.
//

#import "ToDoListTableViewController.h"
#import "ToDoItem.h"
#import "AddToDoItemViewController.h"

@interface ToDoListTableViewController ()

//note: declare in .m to make this property private
@property NSMutableArray *toDoItems;

@end

@implementation ToDoListTableViewController

- (void)loadInitialData {
    ToDoItem *item1 = [[ToDoItem alloc] init];
    item1.itemName = @"Buy milk";
    [self.toDoItems addObject:item1];
    ToDoItem *item2 = [[ToDoItem alloc] init];
    item2.itemName = @"Buy eggs";
    [self.toDoItems addObject:item2];
    ToDoItem *item3 = [[ToDoItem alloc] init];
    item3.itemName = @"Read a book";
    [self.toDoItems addObject:item3];
}

//Takes a segue as a parameter, which unwinds from AddToDoItemViewController back to ToDoListTableViewController.
//Access data stored in the source view controller via the segue object.
//If toDoItem == nil, then item was never created.  Else, if toDoItem has a value, retrieve the item, add it to
//toDoItems array, and display it in the to-do list.
- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    //retrieve source view controller
    AddToDoItemViewController *source = [segue sourceViewController];
    
    //retrieve value of source's toDoItem property
    ToDoItem *item = source.toDoItem;
    
    //check whether itme exists
    if (item != nil) {
        [self.toDoItems addObject:item];
        
        //reload the data in the table view
        [self.tableView reloadData];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.toDoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    ToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    
    //display a checkmark if completed
    if (toDoItem.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

//respond to user tap on cell by toggling that item accordingly (completed/uncompleted).
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //respond to a tap but not actually select the cell
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    //corresponds to the cell that was tapped
    ToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    
    //toggle completio state of the tapped item
    tappedItem.completed = !tappedItem.completed;
    
    //tell table view to reload the updated row
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
