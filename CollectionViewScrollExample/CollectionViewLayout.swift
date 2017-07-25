//
//  CollectionViewLayout.swift
//  CollectionViewScrollExample
//
//  Created by A.C. Wright Design on 7/25/17.
//  Copyright © 2017 A.C. Wright Design. All rights reserved.
//

import Cocoa

class CollectionViewLayout: NSCollectionViewLayout {

    var attributes: [NSCollectionViewLayoutAttributes] = []
    var cellSize: NSSize = NSSize(width: 64.0, height: 64.0)
    var contentSize: NSSize = NSZeroSize
    var spacing: CGFloat = 8.0
    
    override var collectionViewContentSize: NSSize {
        return self.contentSize
    }
    
    override func prepare() {
        super.prepare()
        
        let numberOfItems: Int = self.collectionView!.numberOfItems(inSection: 0)
        
        for item in 0..<numberOfItems {
            let indexPath = IndexPath(item: item, section: 0)
            let offset: CGFloat = (self.cellSize.width + self.spacing) * CGFloat(item)
            let frame: NSRect = NSRect(x: offset, y: 0, width: self.cellSize.width, height: self.cellSize.height)
            
            let attributes: NSCollectionViewLayoutAttributes = NSCollectionViewLayoutAttributes(forItemWith: indexPath)
            attributes.frame = frame
            
            self.attributes.append(attributes)
        }
        
        self.contentSize = NSSize(width: CGFloat(numberOfItems) * (self.cellSize.width + self.spacing), height: self.cellSize.height)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: NSRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: NSRect) -> [NSCollectionViewLayoutAttributes] {
        var layoutAttributes: [NSCollectionViewLayoutAttributes] = []
        
        for attributes in self.attributes {
            if (attributes.frame.intersects(rect)) {
                layoutAttributes.append(attributes)
            }
        }
        
        return layoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> NSCollectionViewLayoutAttributes? {
        return self.attributes[indexPath.item]
    }
    
    override func layoutAttributesForInterItemGap(before indexPath: IndexPath) -> NSCollectionViewLayoutAttributes? {
        let offset: CGFloat = (self.cellSize.width + self.spacing) * CGFloat(indexPath.item)
        let attributes = NSCollectionViewLayoutAttributes(forInterItemGapBefore: indexPath)
        attributes.frame = NSRect(x: offset - self.spacing, y: 0, width: self.spacing, height: self.cellSize.height)
        
        return attributes
    }
    
}
