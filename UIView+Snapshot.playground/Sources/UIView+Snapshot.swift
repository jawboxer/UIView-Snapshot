//
//  UIView+Snapshot.swift
//
//  Created by Jim Rhoades on 1/26/17.
//  Copyright © 2017 Jim Rhoades. All rights reserved.
//

import UIKit

extension UIView {
	
	/**
	Take a snapshot of a UIView that includes all subviews, even if they exceed the view's bounds.
	
	- Returns:	A UIImageView containing the snapshot.
	*/
	public func snapshotWithoutClippingBounds() -> UIImageView? {
		let snapshotRect = recursiveUnionOfSubviewFrames(forView: self, withFrame: frame)
		return snapshotWithoutClippingBounds(usingRect: snapshotRect)
	}
	
	/**
	Take a snapshot of a UIView using a specific CGRect. The snapshot will include all subviews that are within the specified CGRect, even if they exceed the view's bounds.
	
	- Parameter snapshotRect:	The rect that you want to take a snapshot of.
	
	- Returns:	A UIImageView containing the snapshot.
	*/
	public func snapshotWithoutClippingBounds(usingRect snapshotRect: CGRect) -> UIImageView? {
		UIGraphicsBeginImageContext(snapshotRect.size)
		guard let currentContext = UIGraphicsGetCurrentContext() else {
			UIGraphicsEndImageContext()
			return nil
		}
		currentContext.translateBy(x: -snapshotRect.origin.x, y: -snapshotRect.origin.y)
		layer.render(in: currentContext)
		guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
			UIGraphicsEndImageContext()
			return nil
		}
		UIGraphicsEndImageContext()
		let imageView = UIImageView(image: image)
		return imageView
	}
	
	private func recursiveUnionOfSubviewFrames(forView outermostView: UIView, withFrame currentFrame: CGRect) -> CGRect {
		var workFrame = currentFrame
		for subview in subviews {
			// convert the subview's frame to the coordinate space of the outermost UIView
			let normalizedSubviewFrame = self.convert(subview.frame, to: outermostView)
			// create a union of the workframe and the normalizedSubviewFrame
			workFrame = workFrame.union(normalizedSubviewFrame)
			// recursively create a union of the workFrame and any subview's frames
			workFrame = subview.recursiveUnionOfSubviewFrames(forView: outermostView, withFrame: workFrame)
		}
		return workFrame
	}
}
