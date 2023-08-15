//
//  ContentView.swift
//  WeatherEjercicio
//
//  Created by Montserrat Gomez on 2023-08-14.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight) //pasar el valor a otras vistas
            VStack{
                CityView(cityName: "Ottawa, ON")
            
                DaySelected(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 23)
                
                HStack(spacing: 30) {
                    WeatherDayView(day: "Now", iconName: "cloud.sun.fill", temperature: 23)
                    WeatherDayView(day: "TUE", iconName: "cloud.fill", temperature: 21)
                    WeatherDayView(day: "WEN", iconName: "sun.max.fill", temperature: 25)
                    WeatherDayView(day: "THU", iconName: "cloud.sun.fill", temperature: 27)
                    WeatherDayView(day: "FRI", iconName: "cloud.fill", temperature: 23)
                }
                Spacer()
                
                Button{
                    isNight.toggle() //para cambiar de verdadero a falso
                    
                } label: {
                    WeatherButton(title: "Change day time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
                
            }
        }
    }
}



// VIEWS


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var day: String
    var iconName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(day)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: iconName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 50)
            Text("\(temperature) °")
                .font(.system(size: 21, weight:.bold))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint:.topLeading, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityView: View {
    var cityName: String
    
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .bold))
            .foregroundColor(.white)
            .padding()
    }
    
}

struct DaySelected: View{
    var imageName: String
    var temperature: Int
    
    var body: some View{
        VStack(spacing: 8){ //Para el espacio entre elementos
            Image(systemName: imageName)
                .renderingMode(.original)//Para traer el color original
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 170, height: 170) //la imagen esta alargada
            Text("\(temperature)°")
                .font(.system(size: 60, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}


