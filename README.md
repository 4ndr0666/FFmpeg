# Custom FFmpeg Upscaling

This repository contains a custom FFmpeg build for upscaling videos using Topaz Video AI models and filters.

## Features

- Upscales videos using Topaz Video AI models and filters.
- Provides a Dockerfile for easy setup and usage.
- Supports running the software on multiple devices and instances.

## Setup and Usage

1. Clone the repository:


git clone https://github.com/4ndr0666/FFmpeg.git


2. Change to the repository directory:


cd FFmpeg


3. Build the Docker image:


docker build -t custom-ffmpeg .


4. Run the Docker container:


docker run -it --rm --gpus all custom-ffmpeg


5. Use the custom FFmpeg command inside the container to upscale your videos.


## License

MIT License

Copyright (c) 2023

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
