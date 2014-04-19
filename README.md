## Processing shader examples

This is a collection of GLSL shaders being run inside Processing. Some of them are generic ones (brightness/saturation/contrast filters, blur, edge detection, etc) and others are more experimental. A number of them are modifications of exmaples taken from [GLSL Heroku](glsl.heroku.com).

In the Processing sketches, some shader parameters are routed to the position of the mouse, so as you move the mouse around inside the canvas, various properties of the shader graphics will change.

They fall into two categories:

### Texture shaders

These are shaders which modify the pixels of a source image. In the example sketch, the source images are three image files and one movie.

Click the left and right buttons to scroll through the different shaders, and click up and down to change the source images.

### Color shaders

These are shaders which create an image without any source. Click the left and right buttons to scroll through the shaders.


### Shaders GUI

This is a combination of the color shaders and texture shaders with an added user interface to change parameters. Requires [ControlP5 library](http://www.sojamo.de/libraries/controlP5/).