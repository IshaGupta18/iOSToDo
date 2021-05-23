## To Do App with iOS (Objective-C)

### Features
- Add a ToDo item (title, priority and estimated time of completion
- Delete a ToDo item
- Sort ToDo list by priority and inc/dec of time of completion

### Demo 
- [ToDo App Demo](https://drive.google.com/file/d/1RfsvuUoqCcmSTAFY0dS_lhtFBMVc_79y/view?usp=sharing)

### Main Concepts Learnt
## iOS Dev Concepts (related to To-Do App)

1. Rendering a list of objects: **UITableView:**

  1. A ViewController inherits from **UITableViewController.**
  2. **numberOfRowsInSection** gives us the number of cells currently being displayed.
  3. There is **cellForRowAtIndexPath** which returns the cell which is at the current index. Here we set the properties and contents of a cell.
  4. By keeping the number of **Prototype cells = 1** we can customize every cell i.e. add buttons, labels, fields etc. and this will be the template for all the cells.

2. Adding a new cell to UITableView:

  1. We can have a new ViewController, where we can add a new object for a new cell at the UITableView.
  2. Once the user saves (the object), the 2nd ViewController returns the object to the 1st ViewController, which adds it to the list. This is done via **delegates and protocols.**

3. Understanding **Delegates &amp; Protocols** :
  1. We have two controllers: ViewControllerA and ViewControllerB.
  2. We go (on a user trigger) from ViewControllerA to ViewControllerB.
  3. Aim is to pass data from ViewControllerB to ViewControllerA and return back to ViewControllerA.
  4. ViewControllerA has to be made a **delegate** of ViewControllerB, in order to pass the data back.

4. Switching between different ViewControllers:
  1. Adding a **Storyboard ID** to every view controller and then present and dismiss to switch between the ViewControllers.
  2. Note: pushViewController doesn&#39;t work, and ViewController object should be initiated with Storyboard.

5. Deleting a cell:
  1. Delete the required element from the current list.
  2. Reload the TableView to display the updated list.

6. Sorting a list by different filters:
  1. Upon selection of a filter or change (add/delete) to the list, sort it by using **NSSortDescriptor** to sort by a particular object value.
  2. Reload the TableView to display the updated list.
