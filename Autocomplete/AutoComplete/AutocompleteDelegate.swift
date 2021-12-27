//
//  AutocompleteDelegate.swift
//  Autocomplete
//
//  Created by Amir Rezvani on 3/10/16.
//  Copyright © 2016 cjcoaxapps. All rights reserved.
//

import UIKit

public protocol AutocompleteDelegate: class {
    func autoCompleteTextField() -> UITextField
    func autoCompleteThreshold(textField: UITextField) -> Int
    func autoCompleteItemsForSearchTerm(term: String) -> [AutocompletableOption]
    func autoCompleteHeight() -> CGFloat
    func didSelectItem(item: AutocompletableOption) -> Void

    func nibForAutoCompleteCell() -> UINib
    func heightForCells() -> CGFloat
    func maxHeightForController() -> CGFloat?
    func getCellDataAssigner() -> ((UITableViewCell, AutocompletableOption) -> Void)
}

public extension AutocompleteDelegate {
    func nibForAutoCompleteCell() -> UINib {
        return UINib(nibName: "DefaultAutoCompleteCell", bundle: Bundle(for: AutoCompleteViewController.self))
    }

    func heightForCells() -> CGFloat {
        return 70
    }

    func getCellDataAssigner() -> ((UITableViewCell, AutocompletableOption) -> Void) {
        let assigner: ((UITableViewCell, AutocompletableOption) -> Void) = {
            (cell: UITableViewCell, cellData: AutocompletableOption) -> Void in
            if let cell = cell as? AutoCompleteCell, let cellData = cellData as? AutocompleteCellData {
                cell.textImage = cellData
                cell.layoutIfNeeded()
            }
        }
        
        return assigner
    }
    
    func maxHeightForController() -> CGFloat?{
        return nil
    }
}
