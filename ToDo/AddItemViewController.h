//
//  AddItemViewController.h
//  ToDo
//
//  Created by Isha Gupta on 22/05/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class AddItemViewController;

@protocol AddItemViewControllerDelegate <NSObject, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

- (void)sendItemToAdd: (AddItemViewController *) controller title: (NSString*) itemTitle priority: (NSString*) itemPriority time: (NSString*) timeToComplete;

@end

@interface AddItemViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *ItemTitle;
@property (strong, nonatomic) IBOutlet UITextField *ItemTimeToComplete;
@property (strong, nonatomic) IBOutlet UIButton *AddItem;
@property (strong, nonatomic) IBOutlet UIPickerView *ItemPriorityPicker;
@property (weak, nonatomic) id <AddItemViewControllerDelegate> delegate;
- (IBAction)addIteamToList:(id)sender;

@end

NS_ASSUME_NONNULL_END
