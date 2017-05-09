//
//  ViewController.swift
//  chartDemo
//
//  Created by Mehul Solanki on 08/05/17.
//  Copyright © 2017 sufalam. All rights reserved.
//

import UIKit
import ScrollableGraphView

class ViewController: UIViewController {
    
    @IBOutlet weak var barChart: UIView!
    @IBOutlet weak var threedChart: UIView!
    
        var btnNew : [UIButton] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //ScrollbarChart()
        scrollChart(ObjeData: "")
        
        threediChart()
    }
    
    @IBAction func btnWeeklyAction(_ sender: UIButton) {
        scrollChart(ObjeData: "Weekly")
        
        
    }
    @IBAction func btnDailyAction(_ sender: UIButton) {
        scrollChart(ObjeData: "Daily")
        

    }
    func btnAction(sender:UIButton)
    {
        print(sender.tag)
        
        
        for button in btnNew
        {
            if sender.tag == button.tag
            {
                button.backgroundColor = UIColor.orange
            }
            else{
                button.backgroundColor = UIColor.black
            }
        }
    }
    func ScrollbarChart()
    {
        let data: [Double] = [50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50]
        let widh = UIScreen.main.bounds.size.width - 20

        let vlineView = UIView(frame: CGRect(x: widh-1, y: 0, width: 1, height: 222))
        vlineView.layer.borderWidth = 1.0
        vlineView.layer.borderColor = UIColor.black.cgColor
        self.barChart.addSubview(vlineView)
        
        let labels = ["jan", "Feb", "march", "April", "May", "Jun", "July", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let frmae = CGRect(x: -20, y: 0, width: Int(widh), height: Int(barChart.frame.size.height))
        
        let graphView = ScrollableGraphView(frame:frmae)
        
        // Disable the lines and data points.
        graphView.shouldDrawDataPoint = false
        graphView.lineColor = UIColor.clear
        
        // Tell the graph it should draw the bar layer instead.
        graphView.shouldDrawBarLayer = true
        
        // Customise the bar.
        graphView.barWidth = 25
        graphView.barLineWidth = 1
        graphView.barLineColor = UIColor.colorFromHex(hexString: "#777777")
        graphView.barColor = UIColor.colorFromHex(hexString: "#555555")
        graphView.backgroundFillColor = UIColor.colorFromHex(hexString: "#333333")
        
        graphView.referenceLineLabelFont = UIFont.boldSystemFont(ofSize: 8)
        graphView.referenceLineColor = UIColor.white.withAlphaComponent(0.2)
        graphView.referenceLineLabelColor = UIColor.white
        graphView.numberOfIntermediateReferenceLines = 5
        graphView.dataPointLabelColor = UIColor.white.withAlphaComponent(0.5)
        
        graphView.shouldAnimateOnStartup = true
        graphView.shouldAdaptRange = true
        graphView.adaptAnimationType = ScrollableGraphViewAnimationType.elastic
        graphView.animationDuration = 1.5
        graphView.rangeMax = 50
        graphView.shouldRangeAlwaysStartAtZero = true
        graphView.dataPointSpacing = 30
        
        graphView.shouldShowReferenceLines = false
        graphView.shouldRangeAlwaysStartAtZero = false
        graphView.shouldAddLabelsToIntermediateReferenceLines = false
        graphView.shouldShowLabels = false
        graphView.shouldAdaptRange = false
        graphView.shouldShowReferenceLineUnits = false
        graphView.set(data: data, withLabels: labels)
        self.barChart.addSubview(graphView)
    }
    func scrollChart( ObjeData:String)
    {
        for view in barChart.subviews {
            view.removeFromSuperview()
        }
        
        var ObjeData = ObjeData
        let data: [Double] = [30, 8, 15, 16, 23, 42, 8, 15, 16, 23, 21, 23]
        let widh = UIScreen.main.bounds.size.width - 20
        var ypos = 0
        for i in 0...10
        {
            let boxView = UIView(frame: CGRect(x: ypos, y: 0, width: 50, height: 222))
            boxView.layer.borderWidth = 1.0
            boxView.layer.borderColor = UIColor.black.cgColor
            
            if (ObjeData == "Daily" || ObjeData == "Weekly") && i > 1
            {
                if (ObjeData == "Weekly") && i > 5
                {
                    let gradient: CAGradientLayer = CAGradientLayer()
                    
                    gradient.colors = [UIColor.blue, UIColor.red]
                    gradient.locations = [0.0 , 1.0]
                    gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
                    gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
                    gradient.frame = CGRect(x: 0.0, y: 0.0, width: boxView.frame.size.width, height: boxView.frame.size.height)
                    //boxView.backgroundColor = UIColor.lightGray
                    boxView.layer.insertSublayer(gradient, at: 0)
                }
                else{
                    
                    let gradient: CAGradientLayer = CAGradientLayer()
                    gradient.colors = [UIColor.blue, UIColor.red]
                    gradient.locations = [0.0 , 1.0]
                    gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
                    gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
                    gradient.frame = CGRect(x: 0.0, y: 0.0, width: boxView.frame.size.width, height: boxView.frame.size.height)
                    //boxView.backgroundColor = UIColor.lightGray
                    boxView.layer.insertSublayer(gradient, at: 0)
                }
                ObjeData = ""
            }
            else{
                boxView.backgroundColor = UIColor.clear
            }
            self.barChart.addSubview(boxView)
            ypos = ypos + 50
        }
        
        let vlineView = UIView(frame: CGRect(x: widh-1, y: 0, width: 1, height: 222))
        vlineView.layer.borderWidth = 1.0
        vlineView.layer.borderColor = UIColor.black.cgColor
        self.barChart.addSubview(vlineView)
        
        
        
        let labels = ["jan", "Feb", "march", "April", "May", "Jun", "July", "Aug", "Sep", "Oct", "Nov", "Dec"]
        
        let frmae = CGRect(x: 0, y: 0, width: Int(widh), height: Int(barChart.frame.size.height))
        let graphView = ScrollableGraphView(frame: frmae)
        graphView.topMargin = -20.0
        graphView.bottomMargin = 10.0
        graphView.alpha = 0.8
        
        graphView.backgroundFillColor = UIColor.colorFromHex(hexString: "#111111")
        //graphView.backgroundFillColor = UIColor.clear
        graphView.rangeMax = 70
        graphView.lineWidth = 3
        graphView.lineColor = UIColor.red //UIColor.colorFromHex(hexString: "#777777")
        graphView.lineStyle = ScrollableGraphViewLineStyle.smooth
        
        graphView.shouldFill = true
        graphView.fillType = ScrollableGraphViewFillType.gradient
        graphView.fillColor = UIColor.colorFromHex(hexString: "#999999")
        graphView.fillGradientType = ScrollableGraphViewGradientType.linear
        graphView.fillGradientStartColor = UIColor.colorFromHex(hexString: "#555555")
        graphView.fillGradientEndColor = UIColor.colorFromHex(hexString: "#444444")
        graphView.shouldDrawDataPoint = false
        
        graphView.dataPointSpacing = 20
        graphView.dataPointSize = 1
        graphView.dataPointFillColor = UIColor.white
        
        graphView.referenceLineLabelFont = UIFont.boldSystemFont(ofSize: 8)
        graphView.referenceLineColor = UIColor.white.withAlphaComponent(0.2)
        graphView.referenceLineLabelColor = UIColor.white
        graphView.dataPointLabelColor = UIColor.white.withAlphaComponent(0.5)
        
        //Hide y axis
        graphView.shouldShowReferenceLines = false
        graphView.shouldRangeAlwaysStartAtZero = false
        graphView.shouldAddLabelsToIntermediateReferenceLines = false
        graphView.shouldShowLabels = false
        graphView.shouldAdaptRange = false
        graphView.shouldShowReferenceLineUnits = false
        graphView.set(data: data, withLabels: labels)
        self.barChart.addSubview(graphView)
        
    }
    
    func threediChart()
    {
        let widh = UIScreen.main.bounds.size.width - 20
        var ypos = 0
        var xpos = 0
        
        for _ in 0...50
        {
            let lineView = UIView(frame: CGRect(x: 0, y: ypos, width: Int(widh), height: 1))
            lineView.layer.borderWidth = 1.0
            lineView.layer.borderColor = UIColor.black.cgColor
            
            self.threedChart.addSubview(lineView)
            
            let vlineView = UIView(frame: CGRect(x: xpos, y: 0, width: 1, height: 222))
            vlineView.layer.borderWidth = 1.0
            vlineView.layer.borderColor = UIColor.black.cgColor
            self.threedChart.addSubview(vlineView)
            ypos = ypos + 30
            xpos = xpos + 50
        }
        
        let vlineView = UIView(frame: CGRect(x: widh-1, y: 0, width: 1, height: 222))
        vlineView.layer.borderWidth = 1.0
        vlineView.layer.borderColor = UIColor.black.cgColor
        self.threedChart.addSubview(vlineView)
        self.threedChart.backgroundColor = UIColor.gray
        
        
        
        
        let data: [Double] = [50, 8, 15, 16, 23, 42, 8, 15, 16, 23, 21, 23]
        let labels = ["jan", "Feb", "march", "April", "May", "Jun", "July", "Aug", "Sep", "Oct", "Nov", "Dec"]
        
        
        let frmae = CGRect(x: 0, y: 0, width: Int(widh), height: Int(threedChart.frame.size.height))
        let graphView = ScrollableGraphView(frame: frmae)
        
        graphView.backgroundFillColor = UIColor.colorFromHex(hexString: "#222222")
        graphView.backgroundFillColor = UIColor.clear
       //graphView.alpha = 0.9
        graphView.topMargin = -20.0
        graphView.bottomMargin = 10.0
        graphView.rangeMax = 70
        
        graphView.lineWidth = 3
        graphView.lineColor = UIColor.clear //UIColor.colorFromHex(hexString: "#777777")
        graphView.lineStyle = ScrollableGraphViewLineStyle.smooth
        graphView.shouldFill = true
        graphView.fillColor = UIColor.colorFromHex(hexString: "#FF0080")
        graphView.shouldDrawDataPoint = false
        graphView.dataPointSpacing = 40
        graphView.dataPointSize = 1
        graphView.dataPointFillColor = UIColor.white
        
        graphView.referenceLineLabelFont = UIFont.boldSystemFont(ofSize: 8)
        graphView.referenceLineColor = UIColor.white.withAlphaComponent(0.2)
        graphView.referenceLineLabelColor = UIColor.white
        graphView.dataPointLabelColor = UIColor.white.withAlphaComponent(0.5)
        
        //Hide y axis
        graphView.shouldShowLabels = true
        graphView.shouldShowReferenceLines = true
        graphView.shouldRangeAlwaysStartAtZero = false
        graphView.shouldAddLabelsToIntermediateReferenceLines = false
        
        graphView.set(data: data, withLabels: labels)
        self.threedChart.addSubview(graphView)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
