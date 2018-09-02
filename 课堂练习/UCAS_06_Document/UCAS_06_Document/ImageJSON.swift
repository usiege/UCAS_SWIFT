//
//  ImageJSON.swift
//  UCAS_06_Document
//
//  Created by charles on 2018/6/10.
//  Copyright © 2018年 lizhonghuan. All rights reserved.
//

import Foundation

struct ImageJson: Codable {
    var url: URL?
    var info: String?
    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    init?(json: Data) {
        if let value = try? JSONDecoder().decode(ImageJson.self, from: json) {
            self = value
        } else {
            return nil
        }
    }
    
    init(url: URL, info: String) {
        self.url = url
        self.info = info
        
    }
}
