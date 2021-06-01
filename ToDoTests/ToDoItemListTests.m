//
//  ToDoItemListTests.m
//  ToDoTests
//
//  Created by Isha Gupta on 30/05/21.
//

#import <XCTest/XCTest.h>
#import "../ToDo/ToDoItemList.h"
#import "../ToDo/ToDoItem.h"

@interface ToDoItemListTests : XCTestCase

@end

@implementation ToDoItemListTests
- (void) testAddItemToList {
    ToDoItemList *mockList = [ToDoItemList new];
    ToDoItem *mockItem = [ToDoItem new];
    mockItem.title = @"Mock Item Title";
    [mockList addItemToList:mockItem];
    XCTAssertEqual(mockList.getLengthOfList, 1);
}

- (void) testDeleteItemToList {
    ToDoItemList *mockList = [ToDoItemList new];
    ToDoItem *mockItem = [ToDoItem new];
    mockItem.title = @"Mock Item Title";
    [mockList addItemToList:mockItem];
    [mockList deleteItemToList:0];
    XCTAssertEqual(mockList.getLengthOfList, 0);
}

- (void) testGetItemAtIndex {
    ToDoItemList *mockList = [ToDoItemList new];
    ToDoItem *mockItem = [ToDoItem new];
    mockItem.title = @"Mock Item Title";
    [mockList addItemToList:mockItem];
    ToDoItem *returnedItem = [mockList getItemAtIndex:0];
    XCTAssertEqual(returnedItem, mockItem);
}

- (void) testSortItemListWithDescriptor{
    ToDoItemList *mockList = [ToDoItemList new];
    ToDoItem *mockItem1 = [ToDoItem new];
    mockItem1.title = @"Mock Item 1 Title";
    mockItem1.timeToComplete = 3;
    ToDoItem *mockItem2 = [ToDoItem new];
    mockItem2.title = @"Mock Item 2 Title";
    mockItem2.timeToComplete = 2;
    [mockList addItemToList:mockItem1];
    [mockList addItemToList:mockItem2];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey: @"timeToComplete" ascending:YES];
    NSArray* sortedArray = [mockList sortItemListWithDescriptor:sortDescriptor];
    BOOL isSorted = (sortedArray[0] == mockItem2) && (sortedArray[1] == mockItem1);
    XCTAssertTrue(isSorted);
}

@end
