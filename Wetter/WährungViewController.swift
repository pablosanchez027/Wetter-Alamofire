//
//  WährungViewController.swift
//  Wetter
//
//  Created by Alumno on 23/10/18.
//  Copyright © 2018 Pablo. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class WährungViewController: UIViewController {
    let urlWährung = "https://api.exchangeratesapi.io/latest?base=USD"
    
    @IBOutlet weak var lblCurrency: UILabel!
    @IBOutlet weak var aiCurrency: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aiCurrency.startAnimating()
        
        Alamofire.request(urlWährung).responseJSON { response in
            if let diccionarioRespuesta = response.result.value as? NSDictionary {
                if let diccionarioRates = diccionarioRespuesta.value(forKey: "rates") as? NSDictionary {
                    if let MXNcurrency = diccionarioRates.value(forKey: "MXN") as? Double {
                        self.lblCurrency.text = "$" + "\(MXNcurrency)"
                    }
                }
            }
        }
        
        aiCurrency.stopAnimating()
    }
}
