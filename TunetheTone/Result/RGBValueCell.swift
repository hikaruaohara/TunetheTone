import SwiftUI

struct RGBValueCell: View {
    enum RGB {
        case red
        case green
        case blue
    }
    let color: RGB
    let value: Double
    
    var body: some View {
        HStack {
            switch color {
            case .red:
                Group {
                    Circle()
                        .frame(width: 20)
                    
                    Text(String(format: "%3d", Int(value)))
                        .frame(width: 40)
                }
                .foregroundColor(.red)
            case .green:
                Group {
                    Circle()
                        .frame(width: 20)
                    
                    Text(String(format: "%3d", Int(value)))
                        .frame(width: 40)
                }
                .foregroundColor(.green)
            case .blue:
                Group {
                    Circle()
                        .frame(width: 20)
                    
                    Text(String(format: "%3d", Int(value)))
                        .frame(width: 40)
                }
                .foregroundColor(.blue)
            }
        }
        .font(.body.weight(.bold))
    }
}

struct RGBValueCell_Previews: PreviewProvider {
    static var previews: some View {
        RGBValueCell(color: .red, value: 123)
    }
}
