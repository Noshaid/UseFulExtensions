import UIKit

//1. Dropping Shadow and Shake UIView
extension UIView {
    func dropShadow() {
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 2, height: 4)
        self.layer.shadowRadius = 5
    }
    
    func addShadow(
       cornerRadius: CGFloat = 16,
       shadowColor: UIColor = UIColor(white: 0.0, alpha: 0.5),
       shadowOffset: CGSize = CGSize(width: 0.0, height: 3.0),
       shadowOpacity: Float = 0.3,
       shadowRadius: CGFloat = 5) {
      
          layer.cornerRadius = cornerRadius
          layer.shadowColor = shadowColor.cgColor
          layer.shadowOffset = shadowOffset
          layer.shadowOpacity = shadowOpacity
          layer.shadowRadius = shadowRadius
    }
    
    func shake() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.05
        shake.repeatCount = 2
        shake.autoreverses = true
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        shake.fromValue = fromValue
        shake.toValue = toValue
        layer.add(shake, forKey: "position")
    }
}
let view = UIView()
view.dropShadow()
view.addShadow()
view.shake()


//2. Making Localization Easier
extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
let string = "Hello".localized + " " + "World".localized


//3. Rounding Double to a Specific Number of Places as String
extension Double {
    func rounded(toPlaces places:Int) -> String {
        let divisor = pow(10.0, Double(places))
        var returnValue = "\((self * divisor).rounded() / divisor)"
        if(returnValue.split(separator: ".")[1].count == 1 && places > 1) {
            returnValue += "0"
        }
        return returnValue
    }
}
1.403843.rounded(toPlaces: 2) // "1.40"
