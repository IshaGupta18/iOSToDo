//
//  ToDoItemCell.h
//  ToDo
//
//  Created by Isha Gupta on 22/05/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ToDoItemCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *itemTitle;
@property (strong, nonatomic) IBOutlet UILabel *priority;
@property (strong, nonatomic) IBOutlet UILabel *timeToComplete;
//@property (strong, nonatomic) IBOutlet UILabel *itemDescription;

@end

NS_ASSUME_NONNULL_END
