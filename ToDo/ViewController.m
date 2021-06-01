//
//  ViewController.m
//  ToDo
//
//  Created by Isha Gupta on 22/05/21.
//

#import "ViewController.h"
#import "ToDoItem.h"
#import "ToDoItemCell.h"
#import "ToDoItemList.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray<ToDoItem*> *todos;
@property ToDoItemList* toDoItemList;
@property NSArray<NSString*> *sortValues;
@property NSString* sortValue;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // todoList: main TableView where the todos are added and deleted.
    self.todoList.dataSource = self;
    self.todoList.delegate = self;
    
    // todos: list to manage the current todos
    self.todos = [[NSMutableArray alloc] init];
    self.toDoItemList = [ToDoItemList new];
    
    // sortByPicker: UIViewPicker to select a sort filter
    self.sortByPicker.dataSource = self;
    self.sortByPicker.delegate = self;
    
    self.sortValues = @[@"None", @"Priority", @"Inc Time to complete", @"Dec Time to complete"];
    self.sortValue = @"None";
    
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.toDoItemList getLengthOfList];
//    return self.todos.count;
}

/*
 return a ToDoCell containing the ToDo Title, Priority and Estimated time of completion and add that cell to the TableView.
 */
- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoItemCell *cell = (ToDoItemCell*) [tableView dequeueReusableCellWithIdentifier:@"todo" forIndexPath: indexPath];
//    ToDoItem *item = [self.todos objectAtIndex: (NSInteger) indexPath.item];
    ToDoItem *item = [self.toDoItemList getItemAtIndex: (NSInteger) indexPath.item];
    cell.itemTitle.text = item.title;
    cell.priority.text = item.priority;
    cell.timeToComplete.text = [NSString stringWithFormat:@"%li Hours", (long)item.timeToComplete];
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   return 250;
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.sortValues.count;
}

- (NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.sortValues[row];
}

/*
 When a picker value is selected: (1) sort the todo list according to the selected type. (2) reload the TableView with the newly sorted list.
 */
- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.sortValue = [self.sortValues objectAtIndex:row];
    dispatch_async(dispatch_get_main_queue(), ^(void){
        NSArray* sortedArray = [self sortAccordingToType];
//        self.todos = [NSMutableArray arrayWithArray:sortedArray];
        [self.toDoItemList setItemListNewValue:sortedArray];
        [self.todoList reloadData];
    });
    NSLog(@"Selected Value %@", self.sortValue);
}

/*
 return a NSSortDescriptor with the given key (of ToDoItem object) and make it ascending or descending.
 */
-(NSSortDescriptor *) getSortDescriptorWithKey: (NSString *) sortingKey isAscending: (BOOL) order {
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey: sortingKey ascending:order];
    return sortDescriptor;
}

/*
 Assign ToDo item's priority value (numeric to enable sorting) based on the selection.
 */
- (NSInteger) getPriorityValue: (NSString *) itemPriority {
    if ([itemPriority  isEqual: @"High"]) {
        return 3;
    }
    else if ([itemPriority  isEqual: @"Medium"]) {
        return 2;
    }
    else if ([itemPriority  isEqual: @"Low"]) {
        return 1;
    }
    return 0;
}

/*
 return the sorted toDoList according to the selected sortValue
 */
- (NSArray*) sortAccordingToType {
    NSSortDescriptor *ds = [NSSortDescriptor new];
    if ([self.sortValue isEqual:@"None"]){
        return [self.toDoItemList getItemList];
//        return self.todos;
    }
    if ([self.sortValue isEqual:@"Priority"]){
        ds = [self getSortDescriptorWithKey:@"priorityValue" isAscending:NO];
    }
    else if ([self.sortValue isEqual:@"Inc Time to complete"]) {
        ds = [self getSortDescriptorWithKey:@"timeToComplete" isAscending:YES];
    }
    else if ([self.sortValue isEqual:@"Dec Time to complete"]) {
        ds = [self getSortDescriptorWithKey:@"timeToComplete" isAscending:NO];
    }
//    NSArray* sortedArray = [self.todos sortedArrayUsingDescriptors:@[ds]];
    NSArray* sortedArray = [self.toDoItemList sortItemListWithDescriptor:ds];
    return  sortedArray;
}

/*
 Delegate function to receive the input values from AddItemViewController ie ToDo Item Title, Priority and Est. Time to complete
 Create a new ToDo Item object and add it to the list, sort the list according to sortValue and reload the TableView.
 */
- (void)sendItemToAdd: (AddItemViewController *) controller title: (NSString*) itemTitle priority: (NSString*) itemPriority time: (NSString*) timeToComplete {
    if ([itemTitle isEqual:@""]) {
        return;
    }
    ToDoItem *newItem = [ToDoItem new];
    newItem.title = itemTitle;
    newItem.priority = itemPriority;
    newItem.timeToComplete = timeToComplete.intValue;
    NSInteger priorityValue = [self getPriorityValue:itemPriority];
    newItem.priorityValue = priorityValue;
    dispatch_async(dispatch_get_main_queue(), ^(void){
        [self.toDoItemList addItemToList:newItem];
//        [self.todos addObject:newItem];
        NSArray* sortedArray = [self sortAccordingToType];
//        self.todos = [NSMutableArray arrayWithArray:sortedArray];
        [self.toDoItemList setItemListNewValue:sortedArray];
        [self.todoList reloadData];
    });
    
    NSLog(@"Title %@, Priority %@", itemTitle, itemPriority);
}

/*
 On touch of Add button, go to the AddItemViewController for taking user's input.
 */
- (IBAction)takeToAddItem:(id)sender {
    AddItemViewController *itemController = [self.storyboard instantiateViewControllerWithIdentifier:@"hello"];
    itemController.delegate = self;
    [self presentViewController:itemController animated:YES completion:nil];
}

/*
 On touch of Delete button, get the ToDo item to be deleted, remove the item from the toDoList, sort the list according to sortValue and update the TableView.
 */
- (IBAction)deleteToDo:(id)sender {
    CGPoint pointOfDeletion = [sender convertPoint:CGPointZero toView:self.todoList];
    NSIndexPath *indexOfItemToBeDeleted = [self.todoList indexPathForRowAtPoint:pointOfDeletion];
    dispatch_async(dispatch_get_main_queue(), ^(void){
        [self.toDoItemList deleteItemToList:indexOfItemToBeDeleted.item];
//        [self.todos removeObjectAtIndex:indexOfItemToBeDeleted.item];
        NSArray* sortedArray = [self sortAccordingToType];
//        self.todos = [NSMutableArray arrayWithArray:sortedArray];
        [self.toDoItemList setItemListNewValue:sortedArray];
        [self.todoList reloadData];
    });
}
@end
