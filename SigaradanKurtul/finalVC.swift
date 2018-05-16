//
//  finalVC.swift
//  SigaradanKurtul
//
//  Created by Mac on 25.04.2018.
//  Copyright © 2018 Varol. All rights reserved.
//

import UIKit

class finalVC: UIViewController {

    
    @IBOutlet weak var sigarasizGunLabel: UILabel!
    
    @IBOutlet weak var icilmeyenSigaraLabel: UILabel!
    
    @IBOutlet weak var birikenParaLabel: UILabel!
    
    
    var icilmeyenSigaraAdet = Int()
    var birikenPara = 0

    func dateDayCount(date:String,format:String = "MM.dd.yy") -> Int {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.timeStyle = .medium
        dateFormatter.dateFormat = format
        
        let calender = Calendar.current
        
        let firstDate = calender.startOfDay(for: dateFormatter.date(from: date)!)
        let twiceDate = calender.startOfDay(for: Date())
        
        let companents = calender.dateComponents([.day], from: firstDate, to: twiceDate)
        
        return companents.day!
        
    }
    
    
    
    func hesapla(){
        
        
        if UserDefaults.standard.object(forKey: "birakmaTarihi") == nil {
            UserDefaults.standard.set("01.01.2018", forKey: "birakmaTarihi")
        }
        
        if UserDefaults.standard.object(forKey: "kacSigaraIciyordun") == nil {
            UserDefaults.standard.set(Int(1), forKey: "kacSigaraIciyordun")
        } else {
            print("bir bok anlamadım.")
        }
        
        if UserDefaults.standard.object(forKey: "pakettekiSigaraAdedi") == nil {
            UserDefaults.standard.set(Int(2), forKey: "pakettekiSigaraAdedi")
        }
        
        if UserDefaults.standard.object(forKey: "sigaraFiyati") == nil {
            UserDefaults.standard.set(Int(3), forKey: "sigaraFiyati")
        }
        
        
        
        
        
        if UserDefaults.standard.object(forKey: "birakmaTarihi") != nil && UserDefaults.standard.object(forKey: "kacSigaraIciyordun") != nil && UserDefaults.standard.object(forKey: "pakettekiSigaraAdedi") != nil && UserDefaults.standard.object(forKey: "sigaraFiyati") != nil {
            
            let  fark = dateDayCount(date: UserDefaults.standard.object(forKey: "birakmaTarihi") as! String)
            sigarasizGunLabel.text = String(fark) + " gündür sigara içmiyorsunuz 👍"
            
            icilmeyenSigaraAdet = UserDefaults.standard.object(forKey: "kacSigaraIciyordun") as! Int * fark
            
            icilmeyenSigaraLabel.text = String(icilmeyenSigaraAdet) + " adet sigara içmediniz."
            
            //print(UserDefaults.standard.object(forKey: "sigaraFiyati")))
            birikenPara = UserDefaults.standard.object(forKey: "sigaraFiyati")! as! Int
            
            birikenParaLabel.text = String(birikenPara * fark) + "₺ cebinizde kaldı."
            print(String(birikenPara * fark) + "₺ cebinizde kaldı.")
        } else {
            print("bir şeyler yanlış!")
            print(UserDefaults.standard.object(forKey: "birakmaTarihi")!)
            print(UserDefaults.standard.object(forKey: "kacSigaraIciyordun")!)
            print(UserDefaults.standard.object(forKey: "pakettekiSigaraAdedi")!)
            print(UserDefaults.standard.object(forKey: "sigaraFiyati")!)

        }
            
            
            
            
       
    }
    
    
    func Temizle() {
        
        UserDefaults.standard.removeObject(forKey: "birakmaTarihi")
        UserDefaults.standard.removeObject(forKey: "kacSigaraIciyordun")
        UserDefaults.standard.removeObject(forKey: "pakettekiSigaraAdedi")
        UserDefaults.standard.removeObject(forKey: "sigaraFiyati")

    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()


        
        
        hesapla()
    // Temizle()
       

    }

    
    
}
