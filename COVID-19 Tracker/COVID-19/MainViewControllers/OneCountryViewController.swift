//
//  OneCountryViewController.swift
//  COVID-19
//
//  Created by Mustafa Jamal on 10/11/20.
//  Copyright © 2020 Mustafa Jamal. All rights reserved.
//

import UIKit
import Charts

class OneCountryViewController: UIViewController {

    @IBOutlet weak var ChartContentView: BarChartView!
    var country: Country!
    
    @IBOutlet weak var flagImage: UIImageView!{
        didSet{
            self.flagImage.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var CountryLable: UILabel!
    
    @IBOutlet weak var todayCases: UILabel!
    
    @IBOutlet weak var todayDeaths: UILabel!
    
    @IBOutlet weak var todayRecoveried: UILabel!
    
    @IBOutlet weak var caseesLable: UILabel!
    
    @IBOutlet weak var daethsLable: UILabel!
    
    @IBOutlet weak var recoveriedLable: UILabel!
    
    @IBOutlet weak var criticalLable: UILabel!
    
    @IBAction func WHOButton(_ sender: Any) {
        let url  = URL(string: "https://www.who.int/westernpacific/emergencies/covid-19/technical-guidance/infection-prevention-control")
        UIApplication.shared.open(url!, options: [:])
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        barChartUpdate()
        getImage(urlString: country.flag, uiimageview: flagImage)
        CountryLable.text = country.country
        todayCases.text = "+" + String(country.todayCases)
        todayDeaths.text = "+" + String(country.todayDeaths)
        todayRecoveried.text = "+" + String(country.todayRecovered)
        caseesLable.text = formatter.string(from: NSNumber(value: country.cases))
        daethsLable.text = formatter.string(from: NSNumber(value: country.deaths))
        recoveriedLable.text = formatter.string(from: NSNumber(value: country.recovered))
        criticalLable.text = formatter.string(from: NSNumber(value: country.critical))

    }
    func barChartUpdate(){
        let color1 = UIColor.init(red: 117/255, green: 12/255, blue: 187/255, alpha: 1)
        let color2 = UIColor.init(red: 242/255, green: 28/255, blue: 0/255, alpha: 1)
        let color3 = UIColor.init(red: 253/255, green: 193/255, blue: 0/255, alpha: 1)
        let color4 = UIColor.init(red: 64/255, green: 175/255, blue: 92/255, alpha: 1)
        let colors = [color1 , color2 , color3 , color4]
        let entry1 = BarChartDataEntry(x: 1.0, y: Double(country.cases))
        let entry2 = BarChartDataEntry(x: 2.0, y: Double(country.deaths))
        let entry3 = BarChartDataEntry(x: 3.0, y: Double(country.critical))
        let entry4 = BarChartDataEntry(x: 4.0, y: Double(country.recovered))
        let dataSet = BarChartDataSet.init(entries: [entry1 , entry2 , entry3 , entry4])
        dataSet.colors = colors
        dataSet.formLineWidth = 2
        let data = BarChartData(dataSets: [dataSet])
        ChartContentView.data = data
        ChartContentView.legend.enabled = false
        ChartContentView.animate(yAxisDuration: 2)
        ChartContentView.leftAxis.drawLabelsEnabled = false
        
    }
    func getImage(urlString : String , uiimageview : UIImageView){
        
        let url = URL(string: urlString)

        let datatask = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error?.localizedDescription ?? "No Data")
                return
            }
            DispatchQueue.main.async {
                uiimageview.image = UIImage(data: data!)
            }
        }
        datatask.resume()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
