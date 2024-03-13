List of books with their read status
- <img src=https://github.com/nihal0514/healthbuddy/assets/77735813/41fb5997-0947-448d-8f1e-5df7820f0266
 width="300" height="600">

When Search icon is Clicked
- <img src=https://github.com/nihal0514/book/assets/77735813/1ed76153-76b5-4c22-bbf5-9878754625db width="300" height="600">

Search bar result
- <img src=https://github.com/nihal0514/book/assets/77735813/3a7b3b42-8722-45ae-a25e-a7984baa06ac width="300" height="600">


Libraries used:
 -GetX  (for state management)
 -Floor (for sqlite database)
 -Http  (for network request)

 Screens
- Home Screen
   Features
          - Home screen contains list of books with coverimage,title,author,published year and Read status
          - Read status changes according to button click
          - search icon is there in app bar
          - when search icon is clicked, search bar opens in appbar in same screen
          - movie title can be searched accordingly


  Api used
  - Fetching list of books
    "https://openlibrary.org/trending/now.json"
    
  - Searching books
    "https://openlibrary.org/search.json?q=$bookName"

 Sqlite Database
 - Read status bool can be derived with the help of sqlite database.

