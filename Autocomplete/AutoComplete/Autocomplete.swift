//
//  Autocomplete.swift
//  Autocomplete
//
//  Created by Amir Rezvani on 3/6/16.
//  Copyright © 2016 cjcoaxapps. All rights reserved.
//

import UIKit
public class Autocomplete {
    public class func setupAutocompleteForViewcontroller<T: UIViewController>(viewController: T) where T: AutocompleteDelegate {

        setupUI(autoCompleteViewController, parentViewController: viewController)

    }
    open class func setupAutocompleteForViewcontrollerWithDetachedDelegate(_ viewController: UIViewController, delegate:AutocompleteDelegate) {
        let autoCompleteViewController = initAutoCompleteVC()
        autoCompleteViewController.delegate = delegate
        
        setupUI(autoCompleteViewController, parentViewController: viewController)
        
    }
    
    fileprivate class func initAutoCompleteVC() -> AutoCompleteViewController {
        let podBundle: Bundle = Bundle(for: Autocomplete.self)

        let storyboard = UIStoryboard(name: "Autocomplete", bundle: podBundle)
        let autoCompleteViewController = storyboard.instantiateViewController(withIdentifier: "autocompleteScene") as! AutoCompleteViewController
        
        autoCompleteViewController.delegate = viewController

        autoCompleteViewController.willMove(toParentViewController: viewController)
        viewController.addChildViewController(autoCompleteViewController)
        autoCompleteViewController.didMove(toParentViewController: viewController)

        autoCompleteViewController.view.willMove(toSuperview: viewController.view)
        viewController.view.addSubview(autoCompleteViewController.view)
        autoCompleteViewController.view.didMoveToSuperview()

    }
}
