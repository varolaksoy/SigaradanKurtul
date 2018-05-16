//
//  ViewController.swift
//  SigaradanKurtul
//
//  Created by Mac on 10.03.2018.
//  Copyright © 2018 Varol. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDelegate {

    //MARK: IBOutlets

    @IBOutlet weak var dtZaman: UIDatePicker!
    @IBOutlet weak var lblSigaraAdedi: UITextField!
    @IBOutlet weak var lblPakettekiSigaraAdedi: UITextField!
    @IBOutlet weak var lblSigaraFiyati: UITextField!

    //MARK: Variables
    

    
    //MARK: Functions

    func userDefaultsKayit(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM.dd.yy"
        let string = dateFormatter.string(from: dtZaman.date)
        
        
        UserDefaults.standard.set(String(string), forKey: "birakmaTarihi")
        UserDefaults.standard.set(Int(lblSigaraAdedi.text!), forKey: "kacSigaraIciyordun")
        UserDefaults.standard.set(Int(lblPakettekiSigaraAdedi.text!), forKey: "pakettekiSigaraAdedi")
        UserDefaults.standard.set(Int(lblSigaraFiyati.text!), forKey: "sigaraFiyati")
    }
    
    
    //MARK: IBActions

    @IBAction func saveButton(_ sender: Any) {
        

        userDefaultsKayit()
        
        
        
        
        performSegue(withIdentifier: "toFinal", sender: nil)
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.object(forKey: "kacSigaraIciyordun") == nil {
            UserDefaults.standard.set(Int(0), forKey: "kacSigaraIciyordun")
            lblSigaraAdedi.text = String(describing: UserDefaults.standard.object(forKey: "kacSigaraIciyordun")!)

        } else {
            lblSigaraAdedi.text = String(describing: UserDefaults.standard.object(forKey: "kacSigaraIciyordun")!)
        }
        
        lblPakettekiSigaraAdedi.text = String(describing: UserDefaults.standard.object(forKey: "pakettekiSigaraAdedi")!)
        lblSigaraFiyati.text = String(describing: UserDefaults.standard.object(forKey: "sigaraFiyati")!)

    }
    
    
}





