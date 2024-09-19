import Foundation

extension Double {
    
    func formattedTimeFromUnixTime(secondsFromGMT: Int) -> String {
        let date = NSDate(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        // Returns date formatted as 12 hour time.
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: secondsFromGMT)
        return dateFormatter.string(from: date as Date)
    }
}
