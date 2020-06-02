//
//  MainView.swift
//  Harmolor
//
//  Created by Can Balkaya on 6/2/20.
//  Copyright © 2020 Can Balkaya. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    @State private var colorIndex = 0
    let colorTypes = ["Background", "Object", "Shadow"]
    @State private var backgroundColor: (CGFloat, CGFloat, CGFloat) = (200, 200, 200)
    @State private var objectColor: (CGFloat, CGFloat, CGFloat) = (0, 0, 0)
    @State private var shadowColor: (CGFloat, CGFloat, CGFloat) = (0, 0, 0)
    @State private var text = ""
    @State private var opacity: CGFloat = 0.5
    @State private var axises: (CGFloat, CGFloat) = (0, 0)
    @State private var radius: CGFloat = 20
    
    // MARK: - UI Elements
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: UIScreen.main.bounds.width - 30, height: 200)
                            .foregroundColor(Color(UIColor(red: backgroundColor.0 / 255, green: backgroundColor.1 / 255, blue: backgroundColor.2 / 255, alpha: 1.0)))
                        
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: (UIScreen.main.bounds.width - 30) / 2, height: 100)
                            .foregroundColor(Color(UIColor(red: objectColor.0 / 255, green: objectColor.1 / 255, blue: objectColor.2 / 255, alpha: 1.0)))
                            .shadow(color: Color(UIColor(red: shadowColor.0 / 255, green: shadowColor.1 / 255, blue: shadowColor.2 / 255, alpha: opacity)), radius: radius, x: axises.0, y: axises.1)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Color:")
                            .font(.system(size: 20, weight: .bold))
                        
                        Picker(selection: $colorIndex, label: Text("What is your favorite color?")) {
                            ForEach(0..<colorTypes.count) { index in
                                Text(self.colorTypes[index])
                                    .tag(index)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.bottom)
                        
                        VStack(spacing: 20) {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Red:")
                                    Text(String(format: "%g", setColorNumber().0))
                                }
                                
                                Slider(value: setColorType().0, in: 0...255, step: 1)
                            }
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Green:")
                                    Text(String(format: "%g", setColorNumber().1))
                                }
                                
                                Slider(value: setColorType().1, in: 0...255, step: 1)
                            }
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Blue:")
                                    Text(String(format: "%g", setColorNumber().2))
                                }
                                
                                Slider(value: setColorType().2, in: 0...255, step: 1)
                            }
                            
                            Text(hexStringFromColor(color: UIColor(red: setColorNumber().0, green: setColorNumber().1, blue: setColorNumber().2, alpha: 1)))
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.mainBackground)
                    )
                    
                    VStack(alignment: .leading) {
                        Text("Shadow:")
                            .font(.system(size: 20, weight: .bold))
                            .padding(.bottom)
                        
                        VStack(spacing: 20) {
                            VStack(alignment: .leading) {
                                Text(String(format: "Opacity: %g", opacity))
                                
                                Slider(value: $opacity, in: 0...1, step: 0.01)
                                
                                VStack {
                                    Stepper(String(format: "x: %g", axises.0), value: $axises.0, in: -20...20)
                                    Stepper(String(format: "y: %g", axises.1), value: $axises.1, in: -20...20)
                                    Stepper(String(format: "Radius: %g", radius), value: $radius, in: 0...50)
                                }
                                .padding(.top)
                            }
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.mainBackground)
                    )
                }
                .padding()
            }
            .animation(.linear)
            .navigationBarTitle("Hermony")
            .navigationViewStyle(DoubleColumnNavigationViewStyle())
        }
    }
    
    func setColorType() -> Binding<(CGFloat, CGFloat, CGFloat)> {
        switch colorIndex {
        case 0:
            return $backgroundColor
        case 1:
            return $objectColor
        case 2:
            return $shadowColor
        default:
            return $backgroundColor
        }
    }
    
    func setColorNumber() -> (CGFloat, CGFloat, CGFloat) {
        switch colorIndex {
        case 0:
            return backgroundColor
        case 1:
            return objectColor
        case 2:
            return shadowColor
        default:
            return backgroundColor
        }
    }
    
    func hexStringFromColor(color: UIColor) -> String {
        let r: CGFloat = color.rgba.red
        let g: CGFloat = color.rgba.green
        let b: CGFloat = color.rgba.blue

        let hexString = String.init(format: "#%02lX%02lX%02lX", lroundf(Float(r)), lroundf(Float(g)), lroundf(Float(b)))
        
        return hexString
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
