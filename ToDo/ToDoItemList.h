//
//  ToDoItemList.h
//  ToDo
//
//  Created by Isha Gupta on 29/05/21.
//

#import <Foundation/Foundation.h>
#import "ToDoItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ToDoItemList : NSObject

- (NSMutableArray*) addItemToList: (ToDoItem*) newItem;
- (NSMutableArray*) deleteItemToList: (NSInteger) index;
- (NSInteger) getLengthOfList;
- (ToDoItem*) getItemAtIndex: (NSInteger) index;
- (NSMutableArray *) getItemList;
- (NSArray*) sortItemListWithDescriptor: (NSSortDescriptor*) ds;
- (void) setItemListNewValue: (NSArray<ToDoItem*>*) newList;

@end

NS_ASSUME_NONNULL_END
