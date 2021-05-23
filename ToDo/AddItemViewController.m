//
//  AddItemViewController.m
//  ToDo
//
//  Created by Isha Gupta on 22/05/21.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()
@property NSArray<NSString*> *priorityValues;
@property NSString* priorityValue;
@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ItemTitle.delegate = self;
    self.ItemPriorityPicker.delegate = self;
    self.ItemPriorityPicker.dataSource = self;
    self.priorityValues = @[@"None", @"High", @"Medium", @"Low"];
    self.priorityValue = @"None";
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

/*
 On touch of Done button, transfer the data to the ViewController and dismiss the current scene.
 */
- (IBAction)addIteamToList:(id)sender {
    [self.delegate sendItemToAdd:self title:self.ItemTitle.text priority:self.priorityValue time: self.ItemTimeToComplete.text];
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.priorityValues.count;
}

- (NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.priorityValues[row];
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.priorityValue = [self.priorityValues objectAtIndex:row];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end
