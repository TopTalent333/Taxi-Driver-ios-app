//
//  NewEarningController.swift
//  Apporio Taxi Driver
//
//  Created by Nitu on 15/07/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import Charts

class NewEarningController: UIViewController,ParsingStates  {
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var bottomview: UIView!
    
        
    @IBOutlet weak var barchartgraph: BarChartView!
    
    var tablesize = 0
    
    var toastLabel : UILabel!
    
    var mydata : DriverEarningNew!
    
    
    var unitsSold: [Double] = []
    
    
    var months: [String]!
    
    @IBOutlet weak var weekdatetext: UILabel!
    @IBOutlet weak var totalPayoutLabel: UILabel!
    @IBOutlet weak var totalOutstandingLabel: UILabel!
    
    //@IBOutlet weak var currentBalLabel: UILabel!
    let driverid =   NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
    
    
    
    @IBAction func back_click(_ sender: Any) {
        dismissViewcontroller()
    }
    
    
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        bottomview.layer.shadowColor = UIColor.gray.cgColor
        bottomview.layer.shadowOpacity = 1
        bottomview.layer.shadowOffset = CGSize(width: 0, height: 2)
        bottomview.layer.shadowRadius = 2
        
        
     months = ["M", "T", "W", "Th", "F", "Sa", "Su"]
        
       // let unitsSold = [50.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
      //  setChart(dataPoints: months, values: unitsSold)
        
        //        toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height-300, width: 300, height: 35))
        //        toastLabel.backgroundColor = UIColor.white
        //        toastLabel.textColor = UIColor.black
        //        toastLabel.textAlignment = NSTextAlignment.center;
        //        self.view.addSubview(toastLabel)
        //        toastLabel.text = "No Earning!!"
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.DriverEarning1(self.driverid)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // self.mainview.frame.size.height = 700
        self.scrollview.frame = self.scrollview.bounds
        self.scrollview.contentSize.height = 500
        self.scrollview.contentSize.width = 0
        
    }

    
    func setChart(dataPoints: [String], values: [Double]) {
        
       
        
        barchartgraph.noDataText = "You need to provide data for the chart."
        
        
        barchartgraph.legend.enabled = false
        
        barchartgraph.xAxis.axisMinimum = -0.5;
        barchartgraph.xAxis.axisMaximum = Double(months.count) - 0.5;
        
        barchartgraph.xAxis.valueFormatter = IndexAxisValueFormatter(values:months)
        //Also, you probably we want to add:
        
        barchartgraph.xAxis.granularity = 1
        
        // grid lines
        barchartgraph.xAxis.drawAxisLineEnabled = false
        barchartgraph.xAxis.drawGridLinesEnabled = false
        barchartgraph.leftAxis.drawAxisLineEnabled = false
        barchartgraph.leftAxis.drawGridLinesEnabled = false
        barchartgraph.rightAxis.drawAxisLineEnabled = false
        barchartgraph.rightAxis.drawGridLinesEnabled = false
        
        // X-axis line
     //  barchartgraph.xAxis.drawAxisLineEnabled = true
     //   barchartgraph.xAxis.axisLineColor = UIColor.white
        
        // X-axis labels
        barchartgraph.xAxis.labelTextColor = UIColor.white
        barchartgraph.xAxis.labelFont = NSUIFont.systemFont(ofSize: 16.0)
        barchartgraph.xAxis.labelPosition = .bottom
        
    
        
        // Y-axis labels
       /* accountsBarChartView.leftAxis.labelTextColor = axisGridsAndLabelsColor
        accountsBarChartView.rightAxis.drawLabelsEnabled = false*/
        
       
       var valueColors = [UIColor]()
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            
           let dataEntry = BarChartDataEntry(x: Double(i) , yValues: [Double(values[i])])
            
          //  let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
            
            if values[i] < 0 {
                valueColors.append(UIColor.red)
            }
            else {
                valueColors.append(UIColor.white)
            }
        }
        
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "")
        
        chartDataSet.colors = [UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1)]
       // chartDataSet.colors = [UIColor.green]
               chartDataSet.valueColors = valueColors
        chartDataSet.valueFont =  NSUIFont.systemFont(ofSize: 12.0)
        
        
        
        let chartData = BarChartData()
        chartData.addDataSet(chartDataSet)
    
       barchartgraph.data = chartData
        
        barchartgraph.descriptionText = ""
        
        barchartgraph.rightAxis.drawGridLinesEnabled = false
        barchartgraph.rightAxis.drawAxisLineEnabled = false
        barchartgraph.rightAxis.drawLabelsEnabled = false
        
        barchartgraph.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInBounce)
        
        
        
    }
    
    @IBAction func view_full_summary_click(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: WeeklyStatementController = storyboard.instantiateViewController(withIdentifier: "WeeklyStatementController") as! WeeklyStatementController
        next.newdata = self.mydata
        self.present(next, animated: true, completion: nil)
    }
    
    
  
    
    @IBAction func view_old_summary_click(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: CalenderViewController = storyboard.instantiateViewController(withIdentifier: "CalenderViewController") as! CalenderViewController
         next.checkmovefrom = ""
        self.present(next, animated: true, completion: nil)
    }
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        if resultCode == 666{
            
            self.mydata = data as! DriverEarningNew
            
            if(self.mydata.result == 419){
                
                NsUserDefaultManager.SingeltonInstance.logOut()
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                self.present(next, animated: true, completion: nil)
                
                
                
            }else if(mydata.result == 0){
                
                //
                //            toastLabel.isHidden = false
                //            earningtable.isHidden = true
                //
                
            }else{
                
                
               // unitsSold.removeAll()
                
               let totalvalue = Int((mydata.details?.count)!)
                
                for i in 0..<totalvalue{
                    
                    
                    unitsSold.append(Double((mydata.details?[i].detail?.amount)!)!)
                    
                }
                
                
                  setChart(dataPoints: months, values: unitsSold)
                
              //  let startdate = (self.mydata.details?[0].date!)
                
             //   let enddate = (self.mydata.details?[6].date!)
                
              
                
             //   let date1 = (startdate?[1])! + "-" + (startdate?[2])!
               
              //  let date4 = enddate[1] + "-" + enddate[2]
                
                
                weekdatetext.text = (self.mydata.details?[0].date!)!  + " to " + (self.mydata.details?[6].date!)!
                //weekdatetext.text = (self.mydata.details?[0].date!)! + " to " +  (self.mydata.details?[6].date!)!
                totalPayoutLabel.text = GlobalVariables.currencysymbol + " " + String(self.mydata.weeklyAmount!)
                //currentBalLabel.text = self.mydata.companyCut!
                totalOutstandingLabel.text = GlobalVariables.currencysymbol + " " + self.mydata.companyPayment!
            }
            
        }
    }
    
}
