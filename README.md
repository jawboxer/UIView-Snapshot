# UIView+Snapshot
A Swift extension for UIView that enables you to take a snapshot of a view, including all of its subviews - even if they exceed the view's bounds.

## Usage
Simply add the UIView+Snapshot.swift file to your project, then you can use these methods on any UIView:

`snapshotWithoutClippingBounds()`\
Use this to take a snapshot of a UIView and its subviews, including any areas that exceed the UIView's bounds

`snapshotWithoutClippingBounds(usingRect snapshotRect: CGRect)`\
Use this to take a snapshot of a UIView and its subviews using a specific CGRect. The snapshot will include any areas that exceed the UIView's bounds if they fall within the specified CGRect.

A UIView+Snapshot.playground file is included with visual examples:

![UIView+Snapshot examples](http://crushapps.com/m/uiview+snapshot.png)
