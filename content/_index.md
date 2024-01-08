---
# Leave the homepage title empty to use the site title
title:
date: 2022-10-24
type: landing

sections:
  - block: about.avatar
    content:
      # Choose a user profile to display (a folder name within `content/authors/`)
      username: admin
      text: 
    design:
      background:
        color: black
        text_color_light: true
        image:
          # Add your image background to `assets/media/`.
          filename: li-yang-5h_dMuX_7RE-unsplash.webp
          filters:
            brightness: 0.5
          size: cover
          position: center
          parallax: false
  - block: markdown
    content:
      title: 'Welcome'
      subtitle: ''
      text: |-


        Thank you for visiting my personal webpage! I am an **Early Career Researcher** at the [**School of Economics of the University of Edinburgh**](https://www.ed.ac.uk/economics). 
        
        I am a labor economist who works in labor markets in both developed and developing countries. My research interests lie in both **labor** and **development economics**. I hold a Ph.D. in Economics from [**Boston University**](https://www.bu.edu/econ/).

        My research focuses on understanding how geography influences gender inequality. My other work explores topics such as firms and earnings inequality, skill investment, and job training programs. 

        I pronounce my name as [ˈse.saɾ].

    design:
      columns: '1'
  - block: collection
    content:
      title: Working papers
      subtitle: ''
      text: ''
       Page type to display. E.g. post, talk, publication...
      page_type: working_papers
       Choose how many pages you would like to display (0 = all pages)
      count: 5
       Filter on criteria
      filters:
        author: ""
        category: ""
        tag: ""
        exclude_featured: false
        exclude_future: false
        exclude_past: false
       publication_type: ""
       Choose how many pages you would like to offset by
      offset: 0
       Page order: descending (desc) or ascending (asc) date.
      order: asc
    design:
       Choose a layout view
      view: compact
      columns: '1'

 # - block: collection
 #   content:
 #     title: Work in progress
 #     subtitle: ''
  #    text: ''
      # Page type to display. E.g. post, talk, publication...
  #    page_type: work_in_progress
      # Choose how many pages you would like to display (0 = all pages)
  #    count: 5
      # Filter on criteria
  #    filters:
   #     author: ""
   #     category: ""
   #     tag: ""
   #     exclude_featured: false
   #     exclude_future: false
   #     exclude_past: false
   #     publication_type: ""
      # Choose how many pages you would like to offset by
   #   offset: 0
      # Page order: descending (desc) or ascending (asc) date.
   #   order: desc
   # design:
      # Choose a layout view
   #   view: compact
   #   columns: '1'
---
