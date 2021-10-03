# The DRY KISS Coding Convention

QML Coding Guidelines for Günsel DIC Team

## Introduction

The DRY and KISS are two of the most important software design principles. The DRY principle in full stands for “Don’t Repeat Yourself” whereby this is a basic principle used in software engineering. This principle aims at decreasing the repetition of information, instructions, logic or code during the development process. The principle itself states that for every piece of logic there must be a single, unambiguous and straightforward representation within the system.

The DRY principle has several benefits attached to it. One of the benefits of the DRY principle is that less code is good. The KISS principle stands for “Keep It Simple, Stupid.” This principle aims at keeping the code simple and clear thus making it easy for anyone to understand. Therefore, one should keep the code simple and straightforward. A programmer should keep the methods small and a single method, function or procedure should not exceed 20-30 lines of code. A single method should only be able to solve one issue.

There are several benefits associated with the KISS principle. One benefit of the KISS principle is that it is easy to understand the code. Another benefit is that it will be easier for another programmer to modify the code. At Günsel particularly in the DIC team, team members push changes to the main repository daily and things can get messy really quickly when we lack a standardized convention for writing code. We thus employ the DRY KISS which is highly frowned upon in avenues of intimacy but most preferred when writing code in a team.

This document contains the QML coding conventions that we follow and recommend that other team members follow too.

# 1: Code Style

This section provides details about how to format the order of properties, signals, and functions to make things easy on the eyes and quickly switch to the related code block. QML object attributes are always structured in the following order:

id

Property declarations

Signal declarations

Object properties

States

Transitions

Signal handlers

Child objects: Visual Items, Qt provided non-visual items, Custom provided non-visual items

```QtObject``` for encapsulating private members

JavaScript functions

```
Rectangle {
id: photo

// Property declarations
property bool thumbnail: false
property alias image: photoImage.source

// Signal declarations
signal clicked

// put x and y on the same line
x: 20; y: 20
height: 150

// Object properties
color: "gray"

// Large bindings
width: {
if (photoImage.width > 200) { photoImage.width }
else { 200 } // condense short functions to save up on space
}

// States
states: State {
name: "selected"
PropertyChanges { target: border; color: "red" }
}

// Transitions
transitions: Transition {
from: ""; to: "selected"
ColorAnimation { target: border; duration: 200 }
}
onSomeEvent: {}

// Child objects - Visual Items
Rectangle {
id: border
anchors.centerIn: parent; color: "white"
Image { id: photoImage; anchors.centerIn: parent }
}

// Child objects - Qt provided non-visual items
Timer { }
// Child object - Custom provided non-visual items
MyCppObject { }
QtObject {
id: privates
property var privateProperty: null
}

// short functions should be one liners
function doSomething(x) { return x + photoImage.width }
}
```
## Signal Handler Ordering

When handling the signals attached to an Item, make sure to always leave Component.onCompleted to the last line.

```
// Wrong
Item {
Component.onCompleted: {}
onSomeEvent: {}
}

// Correct
Item {
onSomeEvent: {}
Component.onCompleted: {}
}
```
This is because it mentally makes for a better picture because Component.onCompleted is expected to be fired when the construction of the component ends. If there are multiple signal handlers in an Item, then the ones with the least amount of lines are placed at the top. As the implementation lines increases, the handler also moves down.

The only exception to this is Component.onCompleted signal, it is always placed at the bottom.

```
// Wrong
Item {
onOtherEvent: {
// Line 1
// Line 2
// Line 3
// Line 4
}
onSomeEvent: {
// Line 1
// Line 2
}
}

// Correct
Item {
onSomeEvent: {
// Line 1
// Line 2
}
onOtherEvent: {
// Line 1
// Line 2
// Line 3
// Line 4
}
}
```
## Property Ordering

The first property assignment must always be the id of the component. If you want to declare custom properties for a component, the declarations are always above the first property assignment.

```
// Wrong
Item {
someProperty: false
property int otherProperty: -
id: myItem
}

// Correct
Item {
id: myItem
property int otherProperty: -
someProperty: false
}
```
There's also a bit of predefined order for property assignments. The order goes as follows:

id

x, y

width, height

anchors

The goal here is to put the most obvious and defining properties at the top for easy access and visibility. For example, for an Image you may decide to also put sourceSize above anchors. If there are also property assignments along with signal handlers, make sure to always put property assignments above the signal handlers.

```
// Wrong
Item {
onOtherEvent: {}
someProperty: true
onSomeEvent: {}
x: 23; y: 32
}

// Correct
Item {
x: 23; y: 32
someProperty: true
onOtherEvent: {}
onSomeEvent: {}
}
```
It is usually harder to see the property assignments If they are mixed with signal handlers. That's why we are putting the assignments above the signal handlers.

### Function Ordering

Although there are no private and public functions in QML, you can provide a similar mechanism by wrapping the properties and functions that are only supposed to be used internally in QtObject. Public function implementations are always put at the very bottom of the file.

```
// Wrong
Item {
function someFunction() {}
someProperty: true
}


// Correct
Item {
someProperty: true
onOtherEvent: {}
onSomeEvent: {}
function someFunction() {}
}
```
### Animations

When using any subclass of Animation, especially nested ones like SequentialAnimation, try to reduce the number of properties in one line. More than 2-3 assignments on the same line become harder to reason with after a while. Or maybe you can keep the one line assignments to whatever line length convention you have set up for your project. Since animations are harder to imagine in your mind, you will benefit from keeping the animations as simple as possible since they are executed in every frame. Try to give them meaningful IDs or object names to help your future self debug the animation should a problem arise in the future.

```
// Bad
NumberAnimation { target: root; property: "opacity"; duration: root.animationDuration;
from: 0; to: 1 }
// Depends on your convention. The line does not exceed 80 characters.
PropertyAction { target: root; property: "visible"; value: true }

// Good.
SequentialAnimation {
PropertyAction {
target: root
property: "visible"
value: true
}
NumberAnimation {
target: root
property: "opacity"
duration: root.animationDuration
from: 0
to: 1
}
}
```
### Giving Components ids

If a component does not need to be accessed for functionality, avoid setting the id property. This way you don't clutter the namespace with unused ids and you'll be less likely to run into duplicate id problems. It is a good idea to use max 3-4 character abbreviations for the ids so that when you are looking for a certain component, say a TextBox, it will be easier to list the IDs of all the text boxes by just typing tb.

The schema would be [COMPONENT_NAME][COMPONENT_DESCRIPTION], e.g tbEmail, btnLogIn


```
TextBox {
id: tbEmail
}
Button {
id: btnSubmit
}
CheckBox {
id: cbAgreement
}
```
Make sure that the topmost component in the file always has root as its id.

### Property Assignments

When assigning grouped properties, always prefer the dot notation If you are only altering just one property. Otherwise, always use the group notation.

```
Image {
// Dot notation
anchors.left: parent.left
// Group notation
sourceSize { width: 32; height: 32 }
}
```
When you are assigning the component to a Loader's sourceComponent in different places in the same file, consider using the same implementation. For example, in the following example, there are two instances of the same component. If both of those SomeSpecialComponent are meant to be identified it is a better idea to wrap SomeSpecialComponent in

#### a Component.

```
// BEGIN bad.
Loader {
id: loaderOne
sourceComponent: SomeSpecialComponent {
text: "Some Component"
}
}
Loader {
id: loaderTwo
sourceComponent: SomeSpecialComponent {
text: "Some Component"
}
}
// END bad.

// BEGIN good.
Loader {
id: loaderOne
sourceComponent: specialComponent
}
Loader {
id: loaderTwo
sourceComponent: specialComponent
}
Component {
id: specialComponent
SomeSpecialComponent {
text: "Some Component"
}
}
// END good.
```
This ensures that whenever you make a change to specialComponent it will take effect in all of the Loaders. In the bad example, you would have to duplicate the same change.

### Import Statements

Imports take time in QML. And If you are developing for a device with low system specifications, then you will want to optimize as much as possible. In that case, try to minimize the number of imports you use in your QML file. If you are also importing a JavaScript file, make sure to not include the same module in both the QML file and the JavaScript file. JavaScript files share the imports from the QML file so you can take advantage of that. Note that Qt Creator does not provide code completion for the modules that you import in the QML file.

If you are not making use of the imported module in the QML file, consider moving the import statement to the JavaScript file. But note that once you import something in the JavaScript file, the imports will no longer be shared. 

Alternatively, you can use Qt.include() which copies the contents of the included file and you will not have to worry about the import sharing rules.

## Import Order

When importing other modules, use the following order;

Qt modules

Third-party modules

Local C++ module imports

QML folder imports

# 2: Bindings

Bindings are a powerful tool when used responsibly. Bindings are evaluated whenever a property it depends on changes and this may result in poor performance or unexpected behaviours. Even when the binding is simple, its consequence can be expensive. For instance, a binding can cause the position of an item to change and every other item that depends on the position of that item or is anchored to it will also update its position. So consider the following rules when you are using bindings.

## Reduce the Number of Bindings

When using bindings, there are bound to be cases where a single changed signal can be used to update multiple values. Consider the following example:

```
Rectangle {
id: root
color: mouseArea.pressed? "red" : "yellow"
Text {
anchors.centerIn: parent
text: mouseArea.pressed? "Red Color" : "Yellow Color"
}

MouseArea {
id: mouseArea
anchors.fill: parent
}
}
```
Now, the bindings are simple in this case so just imagine that they were not that simple and we had a bigger app. As you can see there are two bindings and each is executed when the user presses the mouse button. We can rewrite that as follows to reduce the number of bindings to only one.

```
Rectangle {
id: root
Text {
id: label
anchors.centerIn: parent
}
MouseArea {
id: mouseArea
anchors.fill: parent
onPressedChanged: {
if (pressed) {
root.color = "red";
label.text = "Red Color";
}
else {
root.color = "yellow";
label.text = "Yellow Color";
}
}
}
}
```
Now whenever the user presses the mouse button, only one block will be executed for two of those expected outcomes. Alternatively, you can use Connections to connect to a particular signal for an object and update the properties in the signal handler. This case is particularly useful when you are using Loaders.


## Making Connections

A Connections object is used to handle signals from arbitrary QObject derived classes in QML. One thing to keep in mind when using connections is the default value of target property of the Connections is its parent if not explicitly set to something else. If you are setting the target after dynamically creating a QML object, you might want to set the target to null otherwise you might get signals that are not meant to be handled.

```
// Bad
Item {
id: root
onSomeEvent: { // Set the target of the Connections. }
Connections {
// Notice that target is not set so it's implicitly set to root.
onWidthChanged: {
// Do something. But since Item also has a width property we may
// handle the change for root until the target is set explicitly.
}
}
}

// Good
Item {
id: root
onSomeEvent: {
// Set the target of the Connections.
}
Connections {
target: null // Good. Now we won't have the same problem.
onWidthChanged: {
// Do something. Only handles the changes for the intended target.
}
}
}
```
## Use Binding Object

Binding's when the property can be used to enable or disable a binding expression depending on a condition. If the binding that you are using is complex and does not need to be executed every time a property changes, this is a good idea to reduce the binding execution count. Using the same example above, we can rewrite it as follows using a Binding object.

```
Rectangle {
id: root
Binding on color {
when: mouseArea.pressed
value: mouseArea.pressed? "red" : "yellow"
}
MouseArea {
id: mouseArea
anchors.fill: parent
}
}
```
Again, this is a really simple example to get the point out. In a real-life situation, you would not get more benefit from using a Binding object in this case unless the binding expression is expensive (e.g It changes the item's anchor which causes a whole chain reaction and causes other items to be repositioned.).

Binding objects can also be used to provide bidirectionally binding for properties without the risk of breaking the bindings. Consider the following example:

```
Rectangle {
id: rect
width: 50; height: 50
anchors.centerIn: parent
color: cd.color
MouseArea {
anchors.fill: parent
acceptedButtons: Qt.LeftButton | Qt.RightButton
onClicked: {
if (mouse.button === Qt.LeftButton) { cd.visible = true }
else { parent.color = "black" }
}
}
}
ColorDialog {
id: cd
color: rect.color
}
```

The binding to color properties of ColorDialog and Rectangle will be broken once those proeprties are set from outside. If you play around with the example, you'll see that parent.color = "black" breaks the binding.

Now, see the following example and you'll find that bindings are not broken.

```
Rectangle {
id: rect
width: 50; height: 50
anchors.centerIn: parent
color: "red"
Binding on color { value: cd.color }
MouseArea {
anchors.fill: parent
acceptedButtons: Qt.LeftButton | Qt.RightButton
onClicked: {
if (mouse.button === Qt.LeftButton) { cd.visible = true }
else { parent.color = "black" }
}
}
}
ColorDialog {
id: cd
Binding on color { value: rect.color }
}
```
### Transient Bindings

There may be cases where you have to end up using an imperative assignment. But naturally, this will break the binding. In that case, you can create transient Binding objects to safely set the new property without breaking the existing binding.

```
Item {
property var contentItem
onContentItemChanged: {
contentItem.width = 100 // This will break the binding.
// -----
var temp = cmpBinding.createObject(root, {
"target": contentItem,
"property": "width",
"value": 100
})
// Now the width property is safely updated to 100 without breaking
// any existing bindings.
temp.destroy() // Don't forget to destroy it.
}
Component {
id: cmpBinding
Binding { }
}
}
```
## KISS It

You are probably already familiar with the KISS principle by now. QML supports the optimization of binding expressions. Optimized bindings do not require a JavaScript environment hence it runs faster. The basic requirement for optimization of bindings is that the type information of every symbol accessed must be known at compile time.

So, avoid accessing var properties. You can see the full list of prerequisites of optimized bindings here.

## Be Lazy

There may be cases where you don't need the binding immediately but when a certain condition is met. By lazily creating a binding, you can avoid unnecessary executions. To create a binding during runtime, you can use Qt.binding().

```
Item {
property int edgePosition: 0
Component.onCompleted: {
if (checkForSomeCondition() == true) {
// bind to the result of the binding expression passed to Qt.binding()
edgePosition = Qt.binding(function() { return x + width })
}
}
}
```
You can also use Qt.callLater to reduce the redundant calls to a function.


## Avoid Unnecessary Re-Evaluations

If you have a loop or process where you update the value of the property, you may want to use a temporary local variable where you accumulate those changes and only report the last value to the property. This way you can avoid triggering re-evaluation of binding expressions during the intermediate stages of accumulation.

Here's a bad example straight from Qt documentation:

```
import QtQuick 2.
Item {
id: root
property int accumulatedValue: 0
width: 200; height: 200
Component.onCompleted: {
var someData = [ 1, 2, 3, 4, 5, 20 ];
for (var i = 0; i < someData.length; ++i) {
accumulatedValue = accumulatedValue + someData[i];
}
}
Text {
anchors.fill: parent
text: root.accumulatedValue.toString()
onTextChanged: console.log("text binding re-evaluated")
}
}
```
And here is the proper way of doing it:

```
import QtQuick 2.
Item {
id: root
property int accumulatedValue: 0
width: 200; height: 200
Component.onCompleted: {
var someData = [ 1, 2, 3, 4, 5, 20 ];
var temp = accumulatedValue;
for (var i = 0; i < someData.length; ++i) {
temp = temp + someData[i];
}
accumulatedValue = temp;
 }

Text {
anchors.fill: parent
text: root.accumulatedValue.toString()
onTextChanged: console.log("text binding re-evaluated")
}
}
```
3 : Javascript

It is the prevalent advice that you should avoid using JavaScipt as much as possible in your QML code and have the C++ side handle all the logic. This is a sound advice and should be followed, but there are cases where you can't avoid having JavaScript code for your UI. In those cases, follow these guidelines to ensure a good use of JavaScript in QML.

## Use Arrow Functions

Arrow functions were introduced in ES6. Its syntax is pretty close to C++ lambdas and they have a pretty neat feature that makes them most comfortable to use when you are using the connect() function to create a binding. If there's no block within the arrow function, it has an implicit return statement. Let's compare the arrow function version with the old way.

```
Item {
property int value: -
Component.onCompelted: {
// Arrow function
root.value = Qt.binding(() => root.someOtherValue)
// The old way.
root.value = Qt.binding(function() { return root.someOtherValue })
}
}
```
The arrow function version is easier on the eyes and cleaner to write. For more information about arrow functions, head over to the MDN Blog

Use the Modern Way of Declaring Variables. With ES6, there are 3 ways of declaring a variable: var, let, and const. You should leverage let and const in your codebase and avoid using var. let and const enables a scope based naming whereas var only knows about one scope.

```
Item {
onClicked: {
const value = 32;
let valueTwo = 42;
{
// Valid assignment since we are in a different scope.
const value = 32;
let valueTwo = 42;
}
}
}
```
Much like in C++, prefer using const If you don't want the variable to be assigned. But keep in mind that const variables in JavaScript are not immutable. It just means they can't be reassigned, but their contents can be changed.

```
const value = 32;
value = 42; // ERROR!
const obj = {value: 32};
obj.value = 42; // Valid.
```
