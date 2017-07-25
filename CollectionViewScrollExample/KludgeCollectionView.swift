//
//  KludgeCollectionView.swift
//  CollectionViewScrollExample
//
//  Created by A.C. Wright Design on 7/25/17.
//  Copyright © 2017 A.C. Wright Design. All rights reserved.
//

import Cocoa

class KludgeCollectionView: NSCollectionView {

    override func setFrameSize(_ newSize: NSSize) {
        let size = self.collectionViewLayout!.collectionViewContentSize
        
        if let scrollView = enclosingScrollView {
            scrollView.hasHorizontalScroller = size.width > scrollView.frame.width
        }
        
        super.setFrameSize(size)
    }
    
}
