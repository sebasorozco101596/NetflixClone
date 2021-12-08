//
//  EpisodesView.swift
//  NetflixClone
//
//  Created by Juan Sebastian Orozco Buitrago on 12/7/21.
//

import SwiftUI

struct EpisodesView: View {
    
    var episodes: [Episode]
    
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    func getEpisodes(forSeason season: Int) -> [Episode] {
        return episodes.filter {$0.season == season}
    }
    
    var body: some View {
        VStack(spacing: 14) {
            // Season Picker
            HStack {
                Button {
                    //
                    showSeasonPicker = true
                } label: {
                    Group {
                        Text("Season \(selectedSeason)")
                        Image(systemName: "chevron.down")
                    }
                    .font(.system(size: 16))
                }
                Spacer()
            }
            
            //Episodes List
            
            ForEach(getEpisodes(forSeason: selectedSeason)) { episode in
                // Loading the different Episodes of the season
                VStack(alignment: .leading) {
                    //Preview Image
                    HStack {
                        VideoPreviewImage(imageURL: episode.thumbnailURL, videoURL: episode.videoURL)
                            .frame(width: 130, height: 55)
                            .clipped()
                        
                        VStack(alignment: .leading) {
                            Text("\(episode.episodeNumber). \(episode.name)")
                                .font(.system(size: 16))
                            Text("\(episode.length) m")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "arrow.down.to.line.alt")
                            .font(.system(size: 20))
                    }
                    
                    //Description
                    Text(episode.description)
                        .font(.system(size: 13))
                        .lineLimit(3)
                    
                }
                .padding(.bottom, 20)
            }
            
            Spacer()

            
        }
        .foregroundColor(.white)
        .padding(.horizontal, 20)
    }
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            EpisodesView(episodes: allExampleEpisodes, showSeasonPicker: .constant(false), selectedSeason: .constant(1))
        }
    }
}
