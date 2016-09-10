# Progress-arc
This is a small project involving a progress arc indicator using Angular and D3.

## What is it?
The `<progress-arc>` is an Angular directive to show the difference between an actual measurement compared to an expected measurement. It takes 2 inputs: the `actual` percentage of completion and the `expected` percentage of completion.  Based on these inputs, the widget will animate circular arcs representing the completion statuses (i.e. 50% -> half circle, 100% => full circle) with the actual display on reading out in the center.

The arcs are built with a color mood indicator that behaves as follows:
- Red if the actual is behind 50% or more than the expected
- Orange if the actual is behind 25% of the expected
- Green otherwise.  Green is good.

## Try it out
Follow the build & development section below and visit http://localhost:9000/#/ in your browser.
Play around with editing the input values in app/views/templates/demo.html and observe the different behavior based on your inputs.


## Example Usage
`<progress-arc actual=0.5 expected=0.75></progress-arc>`

## Structure
I started with everything written into one directive to get a quick POC, but now I've started re-factoring it for modularity and re-usability, possibly to expanding on this project later.  I have organized it across a few factory services:
- `Arc`: Composes the input data in a format for generating the arcs. Also containing the tween functions for animations
- `Color`: Defines colors and provides the mood color generator
- `Conversion`: Some trivial math conversion
- Then there's the directive itself

## Known Issues
- There are a bunch of unnecessary files from when I scaffolded the project.
- You can only create one arc in a given view!  There are some boo boos with how the d3 selector is targeting its svg element and appending its 'g' group.  What will happen right now if you tried adding multiple instances, they will all be sharing the same target elements rather than separate ones for each instance.  My bad.
- Unit test coverage still needed.  I've also structured the files in a way to favor testability.
- Change to a feature-based file structure (e.g. having my directive.js, directive.html, directive.scss all in its own directory).  This is more of a preference rather than a bug.  I learned that I would have to invest more time into a custom scaffolding engine to generate files in my preferred way.  It shouldn't be too difficult, but that's for another project.

## Build & development
Run `grunt` for building and `grunt serve` for preview.

## Testing
Running `grunt test` will run the unit tests with karma. (Coming Soon!)
