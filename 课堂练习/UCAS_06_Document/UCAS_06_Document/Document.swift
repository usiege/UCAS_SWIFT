//
//  Document.swift
//  UCAS_06_Document
//
//  Created by charles on 2018/6/10.
//  Copyright © 2018年 lizhonghuan. All rights reserved.
//

import UIKit

class Document: UIDocument {
    
    var imageJson: ImageJson?
    
    override func contents(forType typeName: String) throws -> Any {
        // Encode your document with an instance of NSData or NSFileWrapper
        return imageJson?.json ?? Data()
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // Load your document from contents
        
    }
}

