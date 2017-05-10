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
    
    @IBOutlet weak var lblDot: UILabel!
    @IBOutlet var popUpView: UIView!
    @IBOutlet weak var hStackView: UIStackView!
    @IBOutlet weak var barChart: UIView!
    @IBOutlet weak var threedChart: UIView!
    
    var btnNew : [UIButton] = []
    
    @IBOutlet var objlineView: [UIView]!
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        lblDot.layer.cornerRadius = 10
        lblDot.layer.masksToBounds = true
        scrollChart(ObjeData: "")
        threediChart()
    }
    //MARK: Expence Tracking
    @IBAction func expBtnHoulryAction(_ sender: UIButton) {
        
        threediChart()
        popUpView.frame = CGRect(x: 30, y: 50, width: popUpView.frame.size.width , height: popUpView.frame.size.height)
        threedChart.addSubview(popUpView)
    }
    @IBAction func expBtnWeeklyAction(_ sender: UIButton) {
        
        threediChart()
        popUpView.frame = CGRect(x: 70, y: 50, width: popUpView.frame.size.width , height: popUpView.frame.size.height)
        threedChart.addSubview(popUpView)
    }
    @IBAction func expBtnMonlyAction(_ sender: UIButton) {
        threediChart()
        popUpView.frame = CGRect(x: 50, y: 50, width: popUpView.frame.size.width , height: popUpView.frame.size.height)
        threedChart.addSubview(popUpView)
    }
    @IBAction func expBtnDailyAction(_ sender: UIButton) {
        threediChart()
        popUpView.frame = CGRect(x: 100, y: 50, width: popUpView.frame.size.width , height: popUpView.frame.size.height)
        threedChart.addSubview(popUpView)
    }
    //MARK: Return investment
    @IBAction func btnMonthlyAction(_ sender: UIButton) {
    }
    @IBAction func btnHoulryAction(_ sender: UIButton) {
    }
    @IBAction func btnWeeklyAction(_ sender: UIButton) {
        scrollChart(ObjeData: "Weekly")
    }
    @IBAction func btnDailyAction(_ sender: UIButton) {
        scrollChart(ObjeData: "Daily")
    }
    func fillProcess(ObjeData:String)
    {
        let data: [Double] = [30, 8, 15, 16, 23, 42, 8, 15, 16, 23, 21, 23]
        if ObjeData == "Daily"
        {
            for view in objlineView
            {
                if view.tag == 2
                {
                    let Myy = 160 - Int(data[view.tag - 1])
                    let boxView = UIView(frame: CGRect(x: Int(view.frame.origin.x), y: Myy, width: Int(view.frame.size.width), height: Myy - 2))
                    boxView.backgroundColor = UIColor.orange
                    let lblPercenTageString = UILabel(frame: CGRect(x: boxView.frame.origin.x, y: boxView.frame.origin.y - 20, width: boxView.frame.size.width, height: 20))
                    lblPercenTageString.font = UIFont(name: lblPercenTageString.font.fontName, size: 10)
                    lblPercenTageString.text = String(Myy)
                    lblPercenTageString.textAlignment = NSTextAlignment.center
                    barChart.addSubview(lblPercenTageString)
                    barChart.addSubview(boxView)
                }
                else{
                }
            }
        }
        if ObjeData == "Weekly"
        {
            for view in objlineView
            {
                if view.tag == 3
                {
                    let Myy = 160 - Int(data[view.tag - 1])
                    let boxView = UIView(frame: CGRect(x: Int(view.frame.origin.x), y: Myy, width: Int(view.frame.size.width), height: Myy - 2))
                    boxView.backgroundColor = UIColor.orange
                    let lblPercenTageString = UILabel(frame: CGRect(x: boxView.frame.origin.x, y: boxView.frame.origin.y - 20, width: boxView.frame.size.width, height: 20))
                    lblPercenTageString.textAlignment = NSTextAlignment.center
                    lblPercenTageString.font = UIFont(name: lblPercenTageString.font.fontName, size: 10)
                    lblPercenTageString.text = String(Myy)
                    barChart.addSubview(lblPercenTageString)
                    barChart.addSubview(boxView)
                }
                else{
                    
                }
            }
        }
        barChart.layer.addBorder(edge: UIRectEdge.left, color: UIColor.black, thickness: 1.0)
        let widh = UIScreen.main.bounds.size.width - 20

        let vlineView = UIView(frame: CGRect(x: widh-1, y: 0, width: 1, height: 160))
        vlineView.layer.borderWidth = 1.0
        vlineView.layer.borderColor = UIColor.black.cgColor
        //self.barChart.backgroundColor = UIColor.clear
        self.barChart.addSubview(vlineView)

        //barChart.layer.addBorder(edge: UIRectEdge.right, color: UIColor.black, thickness: 1.0)
    }
    func scrollChart( ObjeData:String)
    {
        for view in barChart.subviews {
            if view is UIStackView
            {
            }
            else{
                view.removeFromSuperview()
            }
        }
        let data: [Double] = [30, 8, 15, 16, 23, 42, 8, 15, 16, 23, 21, 23]
        let widh = UIScreen.main.bounds.size.width - 20
        
        fillProcess(ObjeData: ObjeData)
        self.barChart.backgroundColor = UIColor.black
        
        let labels = ["jan", "Feb", "march", "April", "May", "Jun", "July", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let frmae = CGRect(x: 0, y: 0, width: Int(widh), height: Int(barChart.frame.size.height))
        let graphView = ScrollableGraphView(frame: frmae)
        graphView.topMargin = -20.0
        graphView.bottomMargin = 10.0
        graphView.alpha = 0.8
        graphView.backgroundFillColor =  UIColor.clear
        graphView.backgroundColor = UIColor.clear
        graphView.rangeMax = 70
        graphView.lineWidth = 3
        graphView.lineColor = UIColor.red
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
        for view in threedChart.subviews {
                view.removeFromSuperview()
        }
        
        let widh = UIScreen.main.bounds.size.width - 20
        var ypos = 0
        var xpos = 0
        
        //343D47
        for _ in 0...11
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
            xpos = xpos + 33
        }
        
        let vlineView = UIView(frame: CGRect(x: widh-1, y: 0, width: 1, height: 222))
        vlineView.layer.borderWidth = 1.0
        vlineView.layer.borderColor = UIColor.black.cgColor
        self.threedChart.addSubview(vlineView)
        self.threedChart.backgroundColor = UIColor.clear
        
        let data: [Double] = [50, 8, 0, 45, 23, 10, 8, 40, 16, 35, 21, 5]
        let labels = ["jan", "Feb", "march", "April", "May", "Jun", "July", "Aug", "Sep", "Oct", "Nov", "Dec"]
        
        let frmae = CGRect(x: 0, y: 0, width: Int(widh), height: Int(threedChart.frame.size.height))
        let graphView = ScrollableGraphView(frame: frmae)
        
        graphView.backgroundFillColor =  UIColor.clear
        graphView.backgroundColor = UIColor.clear
        //graphView.alpha = 0.9
        graphView.topMargin = -20.0
        graphView.bottomMargin = 10.0
        graphView.rangeMax = 70
        
        
        graphView.lineWidth = 3
        graphView.lineColor = UIColor.clear //UIColor.colorFromHex(hexString: "#777777")
        graphView.lineStyle = ScrollableGraphViewLineStyle.smooth
        graphView.shouldFill = true
        graphView.fillColor = UIColor.colorFromHex(hexString: "#71b4dc")
        graphView.shouldDrawDataPoint = false
        graphView.dataPointSpacing = 30
        graphView.dataPointSize = 1
        graphView.dataPointFillColor = UIColor.white
        
        graphView.referenceLineLabelFont = UIFont.boldSystemFont(ofSize: 8)
        graphView.referenceLineColor = UIColor.white.withAlphaComponent(0.2)
        graphView.referenceLineLabelColor = UIColor.white
        graphView.dataPointLabelColor = UIColor.white.withAlphaComponent(0.5)
        
        //Hide y axis
        graphView.shouldShowLabels = false
        graphView.shouldShowReferenceLines = false
        graphView.shouldRangeAlwaysStartAtZero = false
        graphView.shouldAddLabelsToIntermediateReferenceLines = false
        
        graphView.set(data: data, withLabels: labels)
        self.threedChart.addSubview(graphView)
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
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class Colors {
    var glColor:CAGradientLayer!
    
    init() {
        let colorTop = UIColor.clear.cgColor //UIColor(red: 192.0 / 255.0, green: 38.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor.orange.cgColor //UIColor(red: 35.0 / 255.0, green: 2.0 / 255.0, blue: 2.0 / 255.0, alpha: 1.0).cgColor
        
        self.glColor = CAGradientLayer()
        self.glColor.colors = [colorTop, colorBottom]
        self.glColor.locations = [0.0, 3.0]
    }
}
extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: self.frame.height - thickness, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect(x: self.frame.width - thickness, y: 0, width: thickness, height: self.frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        self.addSublayer(border)
    }
}
