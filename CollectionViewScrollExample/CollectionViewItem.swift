//
//  CollectionViewItem.swift
//  CollectionViewScrollExample
//
//  Created by A.C. Wright Design on 7/25/17.
//  Copyright © 2017 A.C. Wright Design. All rights reserved.
//

import Cocoa

class CollectionViewItem: NSCollectionViewItem {

    @IBOutlet var label: NSTextField!
    
    override var representedObject: Any? {
        didSet {
            self.update()
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.lightGray.cgColor
    }
    
    // MARK: - Helpers
    
    func update() {
        guard let title = self.representedObject as? String else { return }
        
        self.label.stringValue = title
    }
    
}
