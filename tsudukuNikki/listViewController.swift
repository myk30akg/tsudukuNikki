//
//  listViewController.swift
//  tsudukuNikki
//
//  Created by 竹田美雪 on 8/10/16.
//  Copyright © 2016 竹田美雪. All rights reserved.
//

import UIKit

class listViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var listTableView: UITableView!
    
    var diaryList = ["日記1","日記2","日記3","日記4"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
        //TableViewに表示する行数を決定する
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            //配列の中身の分だけ表示
            return diaryList.count
            }
        //表示する行の中身
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            var cell = UITableViewCell(style: .Default, reuseIdentifier:"listCell")
            
            cell.textLabel!.text = diaryList[indexPath.row]
            return cell
            }
        //セルが選択されたとき
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
            print("\(indexPath.row)行目を選択")
            
            //画面遷移
            performSegueWithIdentifier("showViewController", sender: nil)
            var row = indexPath.row
         
        }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
