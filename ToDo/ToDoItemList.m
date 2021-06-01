//
//  ToDoItemList.m
//  ToDo
//
//  Created by Isha Gupta on 29/05/21.
//

#import "ToDoItemList.h"

@interface ToDoItemList()
@property (nonatomic) NSMutableArray<ToDoItem*> *itemList;
@end

@implementation ToDoItemList
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.itemList = [NSMutableArray new];
    }
    return self;
}

- (NSMutableArray*) addItemToList: (ToDoItem*) newItem {
    [self.itemList addObject:newItem];
    return  self.itemList;
}

- (NSMutableArray*) deleteItemToList: (NSInteger) index {
    if (self.itemList.count == 0){
        return self.itemList;
    }
    [self.itemList removeObjectAtIndex:index];
    return self.itemList;
}

- (ToDoItem*) getItemAtIndex: (NSInteger) index{
    return  [self.itemList objectAtIndex: index];
}

- (NSInteger) getLengthOfList {
    return self.itemList.count;
}

- (NSMutableArray*) getItemList {
    return self.itemList;
}

- (NSArray*) sortItemListWithDescriptor: (NSSortDescriptor*) ds {
    return [self.itemList sortedArrayUsingDescriptors:@[ds]];
}

- (void) setItemListNewValue: (NSArray<ToDoItem*>*) newList{
    self.itemList = [NSMutableArray arrayWithArray: newList];
}

@end
