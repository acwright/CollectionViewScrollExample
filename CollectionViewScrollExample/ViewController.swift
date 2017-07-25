//
//  ViewController.swift
//  CollectionViewScrollExample
//
//  Created by A.C. Wright Design on 7/25/17.
//  Copyright © 2017 A.C. Wright Design. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSCollectionViewDataSource, NSCollectionViewDelegate {

    @IBOutlet var standardCollectionView: NSCollectionView!
    @IBOutlet var kludgeCollectionView: NSCollectionView!
    
    var items: [String] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.standardCollectionView.register(CollectionViewItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier("CollectionViewItem"))
        self.kludgeCollectionView.register(CollectionViewItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier("CollectionViewItem"))
        
        for i in 0..<10 {
            self.items.append("\(i)")
        }
        
        self.standardCollectionView.reloadData()
        self.kludgeCollectionView.reloadData()
    }
    
    // MARK: - NSCollectionViewDataSource
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier("CollectionViewItem"), for: indexPath) as! CollectionViewItem
        
        item.representedObject = self.items[indexPath.item]
        
        return item
    }
}

