//
//  ViewController.swift
//  Wetter
//
//  Created by Alumno on 18/10/18.
//  Copyright © 2018 Pablo. All rights reserved.
//

import UIKit
import Alamofire

class WetterViewController: UIViewController {
    
    let urlWetter = "https://api.openweathermap.org/data/2.5/weather?q=Berlin&APPID=3326d4de85a204e001116973cc1e557a&units=metric"
    
    @IBOutlet weak var lblGrados: UILabel!
    @IBOutlet weak var aiCargarClima: UIActivityIndicatorView!
    @IBOutlet weak var lblTempButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aiCargarClima.startAnimating()
        
        Alamofire.request(urlWetter).responseJSON { response in
            if let diccionarioRespuesta = response.result.value as? NSDictionary {
                if let diccionarioMain = diccionarioRespuesta.value(forKey: "main") as? NSDictionary {
                    if let temperaturaFloat = diccionarioMain.value(forKey: "temp") as? Double {
                        self.lblGrados.text = "\(temperaturaFloat)" + " ºC"
                        self.aiCargarClima.stopAnimating()
                    }
                }
            } else {
                //Avisarle al usuario que no se pudo leer la respuesta
            }
        }
    }
    
    @IBAction func doTapActualizar(_ sender: Any) {
        aiCargarClima.startAnimating()
        
        if lblTempButton.titleLabel?.text == "Temperatura" {
            lblTempButton.titleLabel?.text = "Temperatura Max"
            
            Alamofire.request(urlWetter).responseJSON { response in
                if let diccionarioRespuesta = response.result.value as? NSDictionary {
                    if let diccionarioMain = diccionarioRespuesta.value(forKey: "main") as? NSDictionary {
                        if let temperaturaFloat = diccionarioMain.value(forKey: "temp") as? Double {
                            self.lblGrados.text = "\(temperaturaFloat)" + " ºC"
                            self.aiCargarClima.stopAnimating()
                        }
                    }
                } else {
                    //Avisarle al usuario que no se pudo leer la respuesta
                }
            }
        } else {
            lblTempButton.titleLabel?.text = "Temperatura"
            
            Alamofire.request(urlWetter).responseJSON { response in
                if let diccionarioRespuesta = response.result.value as? NSDictionary {
                    if let diccionarioMain = diccionarioRespuesta.value(forKey: "main") as? NSDictionary {
                        if let temperaturaFloat = diccionarioMain.value(forKey: "temp_max") as? Double {
                            self.lblGrados.text = "\(temperaturaFloat)" + " ºC"
                            self.aiCargarClima.stopAnimating()
                        }
                    }
                } else {
                    //Avisarle al usuario que no se pudo leer la respuesta
                }
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

