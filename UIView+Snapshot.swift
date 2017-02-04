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
		
		- Parameter snapshotRect:	The combined rect that contains the view and all of its subviews, including the parts that exceed the view's bounds.
	
		- Returns:	A UIImageView containing the snapshot.
	*/
	func snapshotWithoutClippingBounds(usingRect snapshotRect: CGRect) -> UIImageView? {
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
}
