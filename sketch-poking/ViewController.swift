//
//  ViewController.swift
//  sketch-poking
//
//  Created by David Wagner on 06/09/2016.
//  Copyright © 2016 Noise & Heat. All rights reserved.
//

import Cocoa
import SQLite

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let path = NSBundle.mainBundle().pathForResource("some", ofType: "sketch") else {
            assert(false, "Could not find path to sketch file")
        }
        let db = try! Connection(path)
        for row in try! db.prepare("SELECT * FROM metadata") {
            print("key: \(row[0]), value: \(row[1])")
            // id: Optional(2), email: Optional("betty@icloud.com")
            // id: Optional(3), email: Optional("cathy@icloud.com")
        }
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

