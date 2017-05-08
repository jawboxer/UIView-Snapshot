import UIKit

// create a container UIView
let containerFrame = CGRect(x: 0.0, y: 0.0, width: 200.0, height: 200.0)
let containerView = UIView(frame: containerFrame)
containerView.backgroundColor = UIColor.red

// add a subview with an origin that is outside of the container view's frame
let subview1Frame = CGRect(x: -100.0, y: -100.0, width: 200.0, height: 200.0)
let subview1 = UIView(frame: subview1Frame)
subview1.backgroundColor = UIColor.yellow
subview1.alpha = 0.5
containerView.addSubview(subview1)

// add another subview that exceeds the container view's frame
let subview2Frame = CGRect(x: 100.0, y: 100.0, width: 200.0, height: 200.0)
let subview2 = UIView(frame: subview2Frame)
subview2.backgroundColor = UIColor.blue
subview2.alpha = 0.5
containerView.addSubview(subview2)

// add yet another subview, this time to subview2
// (to test that recursively calculating subview frames works as expected)
let innerSubviewFrame = CGRect(x: 100.0, y: 100.0, width: 200.0, height: 200.0)
let innerSubview = UIView(frame: innerSubviewFrame)
innerSubview.backgroundColor = UIColor.white
innerSubview.alpha = 0.5
subview2.addSubview(innerSubview)



// in an iOS app, this is what the snapshot would look like if you used UIKit's snapshotView method:
// containerView.snapshotView(afterScreenUpdates: true)
containerView

// take a snapshot of the containerView and all of its subviews,
// including the areas that exceed the container view's frame
containerView.snapshotWithoutClippingBounds()

// take snapshot using a specific rect
containerView.snapshotWithoutClippingBounds(usingRect: CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0))


