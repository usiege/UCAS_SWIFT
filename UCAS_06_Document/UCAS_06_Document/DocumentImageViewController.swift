//
//  ImageViewController.swift
//  UCAS_06_Document
//
//  Created by charles on 2018/6/10.
//  Copyright © 2018年 lizhonghuan. All rights reserved.
//

import UIKit

extension DocumentImageViewController: UIDropInteractionDelegate {
    
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: UIImage.self) && session.canLoadObjects(ofClass: NSURL.self)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        
        session.loadObjects(ofClass: NSURL.self) { (urls) in
            if let url = urls.first as? URL {
                self.data = ImageJson.init(url: url, info: url.description)
                
            }
        }
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        if let json = data?.json {
            if let jsonString = String(bytes: json, encoding: .utf8) {
                print(jsonString)
            }
            

            if let storeURL = try? FileManager.default.url(for: .documentDirectory,
                                                           in: .userDomainMask,
                                                           appropriateFor: nil,
                                                           create: true).appendingPathComponent("image.json") {
                do {
                    try json.write(to: storeURL)
                    print("Save successfully!")
                } catch let error {
                    print("\(error)")
                }
                
                if let jsonData = try? Data(contentsOf: storeURL) {
                    data = ImageJson(json: jsonData)
                    
                }
            }
        }
    }
}

class DocumentImageViewController: UIViewController {

    var data: ImageJson?
    var imageDocument: Document?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
