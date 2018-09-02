//
//  TableViewController.swift
//  UCAS_05
//
//  Created by charles on 2018/6/10.
//  Copyright © 2018年 lizhonghuan. All rights reserved.
//

import UIKit

extension TableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        refresh()
        return true
    }
}

class TableViewController: UITableViewController {

    var dataSource: [ImageCell]?
    
    var searchText = "" {
        didSet {
            //
        }
    }
    
    func refresh() {
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource =
            [ImageCell(name: "join", info: "boy", url: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528031543880&di=1cbfd3f8c7a989e7f5d67911a7a3164a&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2Fc%2F581ff4b6a1149.jpg", filtered: false),
             ImageCell(name: "anna", info: "girl", url: "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=271441279,632559570&fm=27&gp=0.jpg", filtered: false),
             ImageCell(name: "shrea", info: "unknow", url: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1528627905&di=68a2eba1b3b40952c6ecbc31bb4190ea&imgtype=jpg&er=1&src=http%3A%2F%2Fwow.tgbus.com%2FUploadFiles_2396%2F201205%2F20120518203837576.jpg", filtered: false)]

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    @IBAction func doneAdding(_ segue: UIStoryboardSegue) {
        if let avc = segue.source as? AddCellViewController {
            guard avc.cellInfo != nil else {
                print("未设置cell info！")
                return
            }
            addCellToTableView(data: avc.cellInfo!, at: 0)
        }
    }

    @IBAction func cancelAdding(_ segue: UIStoryboardSegue) {
        
    }
    
    func addCellToTableView(data: ImageCell, at row: Int) {
        
        dataSource?.insert(data, at: row)
        let indexPath = IndexPath(row: row, section: 0)
        tableView.insertRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! ImageTableViewCell

        // Configure the cell...
        cell.imageCell = dataSource?[indexPath.row]
        
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let ivc = segue.destination as? ImageViewController {
            if let id = segue.identifier {
                switch id {

                default:
                    break
                }
            }
        }
    }
    

}
