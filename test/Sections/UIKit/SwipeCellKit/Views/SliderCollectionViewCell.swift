//
//  SliderCollectionViewCell.swift
//  test
//
//  Created by li’Pro on 2018/11/26.
//  Copyright © 2018 wzl. All rights reserved.
//

import Foundation
//import SwipeCellKit


@objc protocol SliderCollectionViewCellDelegate {
    func flagActionOfCell(cell :SliderCollectionViewCell)
    func deleteActionOfCell(cell :SliderCollectionViewCell)
}

class SliderCollectionViewCell: SwipeCollectionViewCell, SwipeCollectionViewCellDelegate {
    func collectionView(_ collectionView: UICollectionView, editActionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        if orientation == .right {
            unowned let sf = self
            
            let flag = SwipeAction(style: .default, title: "置顶话题", handler: { (action, indexPath)  in  
                sf.cellDelegate.flagActionOfCell(cell: sf)  
            })
            flag.textColor = UIColor.white
            flag.firstActionAddCornerRadius = 10
            flag.backgroundColor = UIColor.lightGray
            flag.hidesWhenSelected = true
            flag.font = UIFont.systemFont(ofSize: 14)
            
            let del = SwipeAction(style: .default, title: "标为已读", handler: { (action, indexPath)  in  
                sf.cellDelegate.deleteActionOfCell(cell: sf)
            })
            del.hidesWhenSelected = true
            del.textColor = UIColor.white
            del.backgroundColor = UIColor.orange
            del.font = UIFont.systemFont(ofSize: 16)
            
            return [del, flag]
        } else {
            return nil
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, editActionsOptionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle =  .selection //orientation == .left ?  : .destructive
        options.transitionStyle = .drag
        options.buttonPadding = 16
        options.backgroundColor = contentView.backgroundColor
//        switch buttonStyle {
//        case .backgroundColor:
//            options.buttonSpacing = 11
//        case .circular:
//            options.buttonSpacing = 4
//            options.backgroundColor = #colorLiteral(red: 0.9467939734, green: 0.9468161464, blue: 0.9468042254, alpha: 1)
//        }
        
        return options
    }
    
    
    
    @objc weak var cellDelegate: SliderCollectionViewCellDelegate!
    
    @objc var lblTitle: UILabel = {
        let lbl: UILabel = UILabel()
        lbl.textColor = UIColor.black
        return lbl
    }()
    
    var line: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.lightGray
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.groupTableViewBackground
        contentView.addSubview(lblTitle)
        lblTitle.mas_makeConstraints { (make) in
            make?.left.offset()(15)
            make?.centerY.offset()(0)
        }
        
        contentView.addSubview(line)
        line.mas_makeConstraints { (make) in
            make?.left.right()?.bottom()?.offset()(0)
            make?.height.mas_equalTo()(0.5)
        }
        
        delegate = self
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
