require 'google/apis/youtube_v3'

youtube = Google::Apis::YoutubeV3::YouTubeService.new
youtube.key = 'AIzaSyB5ywnOhgcW8Q-isywzjYcwLaSAomiNc70' # See Googleauth or Signet libraries

response = youtube.list_searches('snippet', channel_id: 'UClHVl2N3jPEbkNJVx-ItQIQ', max_results: 4, type: 'video', q: 'angry relationship')
video_ids = response.items.map {|item| item.id.video_id }


<iframe width="560" height="315" src="https://www.youtube.com/embed/#{video_id}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
