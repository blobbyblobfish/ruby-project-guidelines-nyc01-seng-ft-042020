# The ‘DUA LIPA’ PlAYLIST APP

The ‘DUA LIPA’ PLAYLIST APP helps you easily create and manipulate DUA LIPA playlists from the CLI. 

# INSTALL

The 'DUA LIPA' PLAYLIST APP is a Ruby file available on Github here. Then take the following steps:

Clone the repo and open the app in your terminal.
Run the following commands:
rake db: migrate
rake db: seed
run the ruby file using the code: ruby bin/run.rb

Note: The app allows you to seed your database with songs from the latest album by a particular artist through an integration with Spotify. The default artist is Dua Lipa. To change the artist, you must go to the file seeds.rb and change the ‘artist’ where the name ‘dua lipa’ is currently:
 artists = RSpotify::Artist.search('dua lipa')
#CONTRIBUTORS GUIDE


Pull Requests are welcome. Please leave any comments and we will consider making changes. 

# LICENSE FOR CODE

#Learn.co Educational Content License

Copyright (c) 2015 Flatiron School, Inc

The Flatiron School, Inc. owns this Educational Content. However, the Flatiron School supports the development and availability of educational materials in the public domain. Therefore, the Flatiron School grants Users of the Flatiron Educational Content set forth in this repository certain rights to reuse, build upon and share such Educational Content subject to the terms of the Educational Content License set forth here (http://learn.co/content-license). You must read carefully the terms and conditions contained in the Educational Content License as such terms govern access to and use of the Educational Content.

Flatiron School is willing to allow you access to and use of the Educational Content only on the condition that you accept all of the terms and conditions contained in the Educational Content License set forth here (http://learn.co/content-license). By accessing and/or using the Educational Content, you are agreeing to all of the terms and conditions contained in the Educational Content License. If you do not agree to any or all of the terms of the Educational Content License, you are prohibited from accessing, reviewing or using in any way the Educational Content.
