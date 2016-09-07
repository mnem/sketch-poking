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
            guard let key = row[0], let blob = row[1] as? Blob else {
                continue
            }
            
            let archive = NSData(bytes: blob.bytes, length: blob.bytes.count)
            do {
                var format = NSPropertyListFormat.BinaryFormat_v1_0
                let value = try NSPropertyListSerialization.propertyListWithData(archive, options: .Immutable, format: &format)
                print("key: \(key), value: \(value)")
            } catch let e {
                print(e)
            }
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

