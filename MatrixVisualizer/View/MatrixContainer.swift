//
//  MatrixContainer.swift
//  MV
//
//  Created by Rahul Pahuja on 07/10/23.
//

import UIKit

typealias MatrixData = [Data]

class MatrixContainer: UIView {
    var matrixData: MatrixData = [Data]()
    /*
     Only override draw() if you perform custom drawing.
     An empty implementation adversely affects performance during animation.*/
    override func draw(_ rect: CGRect) {
         //Drawing code
        super.draw(rect)
        //Getting the Data from the Completion Handler
        DataReader().readJSONFile(forName: "Data"){data in
            self.matrixData = data
        }
        drawMatrix(matrixData)
    }
    
    func getAlpha(_ record_count:Float)->Float{
        return record_count/MAX_COUNT
    }
    
    func drawMatrix(_ matrixData:MatrixData){
        var x  = CONST_O_X+CONST_LABEL_WIDTH, y = CONST_O_Y
        for date in 0..<matrixData.count{
            if(date == 0){
                    for j in 0..<matrixData[0].hours.count{
                        addLabel( createRect(x,y), String(j))
                        x += CONST_WIDTH + CONST_SPACE
                    }
                    x = CONST_O_X
                    y += CONST_O_Y
            }
            for h in 0..<matrixData[date].hours.count {
                let thString = matrixData[date].hours[h].hour.toDate()?.day.thString
                if ( h == 0 ) {
                    let rect = CGRect(x: x, y: y, width: CONST_LABEL_WIDTH, height: CONST_LABEL_HEIGHT)
                    addLabel( rect, thString!)
                    x += CONST_LABEL_WIDTH + CONST_SPACE
                }
                let alpha = CGFloat(getAlpha(Float(matrixData[date].hours[h].recordCount)))
                let shape = getShape(createRect(x,y) , alpha )
                self.layer.insertSublayer(shape, at: 0)
                x += CONST_WIDTH + CONST_SPACE
            }
            x = CONST_O_X
            y += CONST_HEIGHT + CONST_SPACE
        }
    }

    func getShape(_ rect:CGRect, _ alpha:CGFloat)->CAShapeLayer{
        let roundRectBez = UIBezierPath(roundedRect: rect, cornerRadius: 5.0)
        let shape = CAShapeLayer()
        shape.path = roundRectBez.cgPath
         shape.fillColor  = alpha == 0 ? UIColor.gray.cgColor :UIColor.green.withAlphaComponent(alpha).cgColor
        shape.shadowColor = UIColor.black.withAlphaComponent(0.60).cgColor
        shape.shadowOffset = CGSize(width: 0, height: 2)
        shape.shadowRadius = 5.0
        shape.shadowOpacity = 0.8
        return shape
    }
    
    
    func createRect(_ x:Int,_ y:Int)->CGRect{
        return CGRect(x: x, y: y, width: CONST_WIDTH, height: CONST_HEIGHT)
    }
    func addLabel(_ rect:CGRect,_ text:String){
        let label = UILabel()
        label.text = String(text)
        label.frame = rect
        label.font =  UIFont.systemFont(ofSize: 12)
        self.addSubview(label)
    }
}

