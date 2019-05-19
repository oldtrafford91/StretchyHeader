import Foundation
import UIKit

struct NewsItem {
  enum NewsCategory {
    case world
    case americas
    case europe
    case middleEast
    case africa
    case asiaPacific
    
    func toString() -> String {
      switch self {
      case .world:
        return "World"
      case .americas:
        return "Americas"
      case .europe:
        return "Europe"
      case .middleEast:
        return "Middle East"
      case .africa:
        return "Africa"
      case .asiaPacific:
        return "Asia-Pacific"
      }
    }
    
    func toColor() -> UIColor {
      switch self {
      case .world:
        return UIColor(red: 0.106, green: 0.686, blue: 0.125, alpha: 1)
      case .americas:
        return UIColor(red: 0.114, green: 0.639, blue: 0.984, alpha: 1)
      case .europe:
        return UIColor(red: 0.322, green: 0.459, blue: 0.984, alpha: 1)
      case .middleEast:
        return UIColor(red: 0.502, green: 0.290, blue: 0.984, alpha: 1)
      case .africa:
        return UIColor(red: 0.988, green: 0.271, blue: 0.282, alpha: 1)
      case .asiaPacific:
        return UIColor(red: 0.620, green: 0.776, blue: 0.153, alpha: 1)
      }
    }
  }
  
  let category: NewsCategory
  let summary: String
}

extension NewsItem {
  static func mockedItems() -> [NewsItem] {
    return [
      NewsItem(category: .world, summary: "Climate change protests, divestments meet fossil fuels realities"),
      NewsItem(category: .europe, summary: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"),
      NewsItem(category: .middleEast, summary: "Airstrikes boost Islamic State, FBI director warns more hostages possible"),
      NewsItem(category: .africa, summary: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim"),
      NewsItem(category: .asiaPacific, summary: "Despite UN ruling, Japan seeks backing for whale hunting"),
      NewsItem(category: .americas, summary: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"),
      NewsItem(category: .world, summary: "South Africa in $40 billion deal for Russian nuclear reactors"),
      NewsItem(category: .europe, summary: "'One million babies' created by EU student exchanges"),
    ]
  }
}

