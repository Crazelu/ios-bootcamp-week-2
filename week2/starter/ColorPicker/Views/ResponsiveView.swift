/// Copyright (c) 2023 Kodeco Inc.
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct ResponsiveView: View {
  @Binding var redColor: Double
  @Binding var greenColor: Double
  @Binding var blueColor: Double
  @Binding var foregroundColor: Color
  let isInPortraitMode: Bool
  
  var body: some View {
    if isInPortraitMode {
      VStack {
        TopView(
          foregroundColor: $foregroundColor,
          isInPortraitMode: isInPortraitMode
        )
        
        BottomView(
          redColor: $redColor,
          greenColor: $greenColor,
          blueColor: $blueColor,
          foregroundColor: $foregroundColor
        )
      }
    }
    else {
      HStack {
        TopView(
          foregroundColor: $foregroundColor,
          isInPortraitMode: isInPortraitMode
        )
        
        BottomView(
          redColor: $redColor,
          greenColor: $greenColor,
          blueColor: $blueColor,
          foregroundColor: $foregroundColor
        )
      }
    }
  }
}

struct TopView: View {
  @Binding var foregroundColor: Color
  let isInPortraitMode: Bool
  
  var body: some View {
    VStack {
      Text("Color Picker")
        .font(.largeTitle)
      
      ColoredRectangle(foregroundColor: $foregroundColor)
        .padding(isInPortraitMode ? .bottom : .trailing, 10)
    }
  }
}

struct BottomView: View {
  @Binding var redColor: Double
  @Binding var greenColor: Double
  @Binding var blueColor: Double
  @Binding var foregroundColor: Color
  
  var body: some View {
    VStack{
      SlidersView(
        redValue: $redColor,
        greenValue: $greenColor,
        blueValue: $blueColor
      )
      SetColorButton {
        foregroundColor = Color(
          red: redColor / Constants.maxColorValue,
          green: greenColor / Constants.maxColorValue,
          blue: blueColor / Constants.maxColorValue
        )
      }
    }
    
  }
}

struct ResponsiveView_Previews: PreviewProvider {
  static private var foregroundColor = Binding.constant(Color.black)
  static private var redColor = Binding.constant(56.0)
  static private var greenColor = Binding.constant(156.0)
  static private var blueColor = Binding.constant(106.0)
  
    static var previews: some View {
      ResponsiveView(
        redColor: redColor,
        greenColor: greenColor,
        blueColor: blueColor,
        foregroundColor: foregroundColor,
        isInPortraitMode: false
      )
      ResponsiveView(
        redColor: redColor,
        greenColor: greenColor,
        blueColor: blueColor,
        foregroundColor: foregroundColor,
        isInPortraitMode: true
      )
    }
}
