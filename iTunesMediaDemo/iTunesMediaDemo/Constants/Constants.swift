//
//  Constants.swift
//  iTunesMediaDemo
//
//  Created by Ashutosh's Macbook on 1/9/20.
//  Copyright © 2020 Ashutosh's Macbook. All rights reserved.
//

import Foundation

// MARK: - Constants
let URL_BASE            = "https://rss.itunes.apple.com/api/v1/us/"

let URL_APPLEMUSIC      = "apple-music/hot-tracks/all/100/explicit.json"
let URL_ITUNESMUSIC     = "itunes-music/hot-tracks/all/100/explicit.json"
let URL_IOSAPPS         = "ios-apps/new-apps-we-love/all/100/explicit.json"
let URL_AUDIOBOOKS      = "audiobooks/top-audiobooks/all/100/explicit.json"
let URL_BOOKS           = "books/top-free/all/100/explicit.json"
let URL_TVSHOWS         = "tv-shows/top-tv-episodes/all/100/explicit.json"
let URL_MOVIES          = "movies/top-movies/all/100/explicit.json"
let URL_ITUNESU         = "itunes-u/top-itunes-u-courses/all/100/explicit.json"
let URL_PODCASTS        = "podcasts/top-podcasts/all/100/explicit.json"
let URL_MUSICVIDEOS     = "music-videos/top-music-videos/all/100/explicit.json"

let TEXT_APPLEMUSIC     = "Apple Music"
let TEXT_ITUNESMUSIC    = "iTunes Music"
let TEXT_IOSAPPS        = "iOS Apps"
let TEXT_AUDIOBOOKS     = "Audio Books"
let TEXT_BOOKS          = "Books"
let TEXT_TVSHOWS        = "TV Shows"
let TEXT_MOVIES         = "Movies"
let TEXT_ITUNESU        = "iTunes U"
let TEXT_PODCASTS       = "Podcasts"
let TEXT_MUSICVIDEOS    = "Music Videos"

// MARK: - Enums
enum MediaType: Int {
    case MediaTypeAppleMusic = 1,
    MediaTypeiTunesMusic,
    MediaTypeiOSApps,
    MediaTypeAudioBooks,
    MediaTypeBooks,
    MediaTypeTVShows,
    MediaTypeMovies,
    MediaTypeiTunesU,
    MediaTypePodcasts,
    MediaTypeMusicVideos
}
