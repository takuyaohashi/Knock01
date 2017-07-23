//
//  ViewController.swift
//  Knock03
//
//  Created by Takuya OHASHI on 2017/07/11.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var calendarView : UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "calendar"

        createCalendar()
    }

    func createCalendar() {
        let layout = UICollectionViewFlowLayout()

        calendarView = UICollectionView(frame: self.view.frame,
                                        collectionViewLayout: layout)
        calendarView.backgroundColor = UIColor.lightGray
        calendarView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.view.addSubview(calendarView)

        // AutoLayout を使うために
        calendarView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addConstraints([

            NSLayoutConstraint(item: calendarView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: self.topLayoutGuide,
                               attribute: .bottom,
                               multiplier: 1.0,
                               constant: 0),

            NSLayoutConstraint(item: calendarView,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: self.view,
                               attribute: .width,
                               multiplier: 1.0,
                               constant: 0),

            NSLayoutConstraint(item: calendarView,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: self.view,
                               attribute: .bottom,
                               multiplier: 1.0,
                               constant: 0),
        ]);

        calendarView.dataSource = self
        calendarView.delegate   = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


// MARK: Datasource
extension ViewController: UICollectionViewDataSource {
    // セクション内のセル数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 7
        } else {
            return 14 // TODO: ここは月ごとに帰る必要あり
        }
    }
    // セクション数を返す。曜日表示部と日表示部は別セクションにしてみる。
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.white

        return cell
    }
}

// MARK: Delegate
extension ViewController: UICollectionViewDelegateFlowLayout {
    // セルのサイズを返す
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.width - 2.0 * 8)/7
        let height = width * 3/2
        return CGSize(width: width, height: height)
    }

    // セクション毎の縦のアイテムとのスペース
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    // セクション毎の横のアイテムとのスペース
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    // アイテムの周囲のマージンは、なし
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0,0,0,0)
    }
    // フッターのサイズ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 5)
    }
    // ヘッダーのサイズ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 0)
    }
}
