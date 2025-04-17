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


        Thank you for visiting my personal webpage! 
        
        I am an **Early Career Researcher** at the [**School of Economics of the University of Edinburgh**](https://www.ed.ac.uk/economics). 
        
        I am a labor economist working on topics in both **labor** and **development economics**. I am particularly interested in issues related to gender inequality, skill acquisition, and education.

        I hold a Ph.D. in Economics from [**Boston University**](https://www.bu.edu/econ/). I pronounce my name as [ˈse.saɾ].
    design:
      columns: '1'
  - block: markdown
    id: news
    content:
      title: News
      text: |-
            - **June 2025:** I will presenting our paper on the interaction between [education and skill use]({<relref "research.md">}#skill-use) at the AASLE-SOLE-EALE Joint Conference in Toronto.
            - **March 2025:** New draft of our paper studying a [teacher training intervention](https://cesarlgm.github.io/documents/papers/garroHilmy_smk.pdf) in Indonesian vocational high schools.
            - **February 2025:** Our paper studying [trade offs of workplace amenities](https://cesarlgm.github.io/documents/papers/workhours.pdf) is forthcoming at AEA P&P. 
      design:
      columns: '1'
---
