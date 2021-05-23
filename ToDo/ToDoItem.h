//
//  ToDoItem.h
//  ToDo
//
//  Created by Isha Gupta on 22/05/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ToDoItem : NSObject
@property (nonatomic, strong) NSString *title;
//@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *priority;
@property  NSInteger priorityValue;
@property NSInteger timeToComplete;
@end

NS_ASSUME_NONNULL_END
