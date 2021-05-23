//
//  ViewController.h
//  ToDo
//
//  Created by Isha Gupta on 22/05/21.
//

#import <UIKit/UIKit.h>
#import "AddItemViewController.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, AddItemViewControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

- (IBAction)takeToAddItem:(id)sender;
@property (nonatomic, strong) IBOutlet UITableView *todoList;
- (IBAction)deleteToDo:(id)sender;
@property (strong, nonatomic) IBOutlet UIPickerView *sortByPicker;

@end
