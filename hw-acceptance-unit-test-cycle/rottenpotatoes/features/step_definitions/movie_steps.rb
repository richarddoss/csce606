 Given /the following movies exist/ do |movies_table|
   movies_table.hashes.each do |movie|
   Movie.create movie
   #print("hello")
   end
end
  
When /I go to the edit page for "(.*)"/  do |movie_title|
  movie=Movie.find_by title: movie_title
  id =movie.id
  #edit_movie_path(Movie.find_by_title(movie_title).id)
  print("hello is ececuted\n")
end


