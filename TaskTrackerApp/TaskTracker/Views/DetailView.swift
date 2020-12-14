//
//  DetailView.swift
//  TaskTracker
//
//  Created by Matej Plugel on 12/11/20.
//  Copyright © 2020 RIT. All rights reserved.
//

import SwiftUI
import UIKit
import MapKit
import SDWebImageSwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: EventViewModel
    var post: Post
    
    //let coords = CLLocationCoordinate2D(latitude: post.latitude ?? 0, longitude: post.longitude ?? 0)
   // let annotation = MapAnnotation(coordinate: coords, content: Text(post.body))
    
    
    @State var annotation = CLLocationCoordinate2D()
    
        @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(
        latitude: 53.8862, longitude: 8.6706),
        latitudinalMeters: 250, longitudinalMeters: 250 )

    private func setRegio(lati: Double, longi: Double){
            region = MKCoordinateRegion(center: CLLocationCoordinate2D(
                    latitude: lati, longitude: longi),
                    latitudinalMeters: 250, longitudinalMeters: 250)
        annotation = CLLocationCoordinate2D(latitude: lati, longitude: longi)
       
        }
    
    var body: some View {
        
        VStack{
        if(post.latitude != 0){
            Map(coordinateRegion: $region)
                .edgesIgnoringSafeArea(.top)
        
            .onAppear {self.setRegio(lati: post.latitude ?? 0, longi: post.longitude ?? 0)
               
            }
        }else{
            EmptyView()
        }
            ScrollView{
            Text(post.body)
                .padding(.all)
                .font(.system(size: 30, weight: .heavy, design: .rounded))

        
        Text(post.description).padding(.all)
            
        WebImage(url: post.imageUrl)
            .resizable()
            .placeholder {
                Rectangle().fill(Color.gray)
            }
            .frame(width: 200, height: 200)
            .cornerRadius(12)
            .padding(.bottom)

        }
    }
    }
}


//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(viewModel: EventViewModel(), post: Post(eventId: 1, id: 1, body: "Nothing", imageUrl: nil, longitude: 15, latitude: 45))
//    }
//}
