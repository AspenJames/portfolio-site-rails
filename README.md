# Aspen James, Software Developer

Hello! First off, thank you for visiting my README. I always appreciated an
informative README, and hope I can give you what you came here for!

## Description

This is my own personal website, mainly used as an online business card of
sorts. You'll find a small "About" section at the project root, a resume at
'/resume', and (coming soon) some examples of my work at '/projects'. I built
this using Ruby on Rails, along with a few supporting libraries. For more
in-depth information about the software, you can reference the
[Technology](#Technology) section.

## License

This is free software, licensed under the [GNU General Public License](LICENSE).

## Contributing

Since this is my own portfolio site, I am not accepting contributions in the
form of code. However, I fully welcome issue/bug reports via
[GitHub][gh-issue], and general feedback via [email][email]. This is also [free
software](LICENSE), so please feel free to fork, copy, modify, redistribute,
etc. as is permissible in the license.

## Technology

This project was built using primarily Ruby on Rails. Rails was the first
backend framework that I learned (along with Ruby as my first language), so
Ruby on Rails always has a soft spot in my persistent storage. It's also just a
great tool, and a pleasure to use (in my opinion).

The font used is [JetBrains Mono][jb-mono], a free and open source typeface
from JetBrains. I am a huge fan of monospace type, starting before I got into
programming. When I was younger, I knew I always liked the fonts that had
"mono" in the name. I find this particular font particularly pleasing -- it's
currently set as my default for my terminal and code editors.

My goals with these choices was to keep application size and bandwidth usage
low while providing a clean, minimal experience. To do this, I tried to limit
the usage of third-party libraries, run constant audits during development, and
write only the code necessary. Here are some more specifics:

* [Ruby version 2.6.0][rb]
* [Rails version 5.2.3][rails]
* [kramdown version 2.1][kramdown]
* (Coming soon from here on down - check out the 'projects' branch)
* [CodeMirror][codemirror]
* [RequireJS][requirejs]

## Development

If you would like to get this application running locally, first install all
requirements:

* [Ruby v2.6.0][rb]
* [Node (LTS recommended)][node]

Once we have those, we can clone the repository:
    >$ git clone https://github.com/aspenjames/portfolio-site-rails

Next, `cd` into the directory:
    >$ cd portfolio-site-rails

We'll then install dependencies:
    >$ bundle install
    >$ npm install

We can then start the development server:
    >$ bundle exec rails server

You should now be able to navigate to `http://localhost:3000` in your browser
and see the "About" page.

## Areas of Interest

There are a couple interesting things I've done in this project that I'd like
to point out, as they were either good learning moments for me, or just clever
blocks of code.

### Resume

I knew I wanted to have a PDF download version of my resume accessible via my website along with a hosted HTML version. However, I didn't want to rewrite my resume in HTML from scratch. For something like this, I much prefer writing Markdown. I was able to find a gem (Ruby library) called "kramdown" that would allow me to write my resume in Markdown, then convert it to HTML. In the [controller action][resume-ca], I use a `respond_to` block to either convert and serve the HTML resume or serve a PDF download depending on the filetype requested.

[codemirror]: https://codemirror.net
[email]: mailto:aspenjames@tqca.org
[gh-issue]: https://github.com/AspenJames/portfolio-site-rails/issues
[jb-mono]: https://jetbrains.com/lp/mono
[kramdown]: https://kramdown.getalong.org
[node]: https://nodejs.org
[rails]: https://rubyonrails.org
[resume-ca]: https://github.com/AspenJames/portfolio-site-rails/blob/5d76807e37370a91f1209277d123de41780bc36e/app/controllers/static_controller.rb#L6
[requirejs]: https://requirejs.org
[rb]: https://ruby-lang.org
