//
//  ViewController.swift
//  tsudukuNikki
//
//  Created by 竹田美雪 on 8/10/16.
//  Copyright © 2016 竹田美雪. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var myHeaderImage: UIImageView!
    @IBOutlet weak var myIconImage: UIImageView!
    @IBOutlet weak var topTableView: UITableView!
    
    var menuList = ["日記一覧","カレンダー","検索","設定","使い方"]
    var selectedIndex  =  -1

    override func viewDidLoad() {
        super.viewDidLoad()
        myHeaderImage.image = UIImage(named: "header.jpg")
        myIconImage.image = UIImage(named: "icon.jpg")
    }
    
    //TableViewに表示する行数を決定する
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //retun 10
        
        //配列の中身の分だけ表示しますよ、という意味
        return menuList.count
    }
    //表示する行の中身
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: .Default, reuseIdentifier:"myCell")
        //cell.textLabel?.text = "\(indexPath.row)行目"
        cell.textLabel!.text = menuList[indexPath.row]
        return cell
    }
    //セルが選択されたとき
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        print("\(indexPath.row)行目を選択")
        selectedIndex = indexPath.row
        
        //画面遷移
        performSegueWithIdentifier("listViewSegue", sender: nil)
    }
    
    //segueで画面遷移するとき
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        //遷移先の画面インスタンス(オブジェクト)を作成
//        var detailVC = segue.destinationViewController as! listViewController
        //listViewControllerのプロパティに選択された行番号を渡す
//        detailVC.selectedIndex = selectedIndex
//    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

