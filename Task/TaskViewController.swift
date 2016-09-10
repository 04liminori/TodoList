//
//  ViewController.swift
//  Task
//
//  Created by fukumoriminori on 2016/09/10.
//  Copyright © 2016年 fukumoriminori. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tasks: [[String: String]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = NSUserDefaults.standardUserDefaults().objectForKey("todoList") as! [[String: String]]
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// セルの個数を指定するデリゲートメソッド（必須）
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    /// セルに値を設定するデータソースメソッド（必須）
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // セルを取得
        let cellValue = tableView.dequeueReusableCellWithIdentifier("MyCell") as! TaskTableViewCell
        // セルに値を設定
        cellValue.myTaskLabel.text = tasks[indexPath.row]["title"]
        
        return cellValue
    }
    
    /// セルが選択された時に呼ばれるデリゲートメソッド
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(tasks[indexPath.row])
    }
    
}
