# Script install - Project - Doxyfile - Conan - Docker

This script will generate an empty project by installing various dependencies. allowing you to document your project with Doxygen, manage your packages with conan and place your project in a Docker container.
  - Document you project with Doxygen
  - Manage your package with Conan
  - Contain and launch you project with Docker

You can also:
  - You can also uninstall the dependencies if you wish.

### Technologie

This script is realize in Bash (Bourne-Again shell)
This script uses one source projects to work properly:

* [Bash] - Bash is a command line interpreter of script type. It is the Unix shell of the GNU project. Based on the Bourne shell, Bash brings many improvements to it, notably from the Korn shell and the C shell. Bash is free software released under the GNU General Public License.

And of course this project itself is open source with a [public repository][dill]
 on GitHub.

### Installation

```sh
$ git clone https://github.com/ftestu/Script-Doxyfile-Conan.git
$ chmod 777 .script.sh
```

Two command are provided, the first one install all dependancies for use Conan and Doxygen.
```sh
$ ./.script.sh 0
```
The second command allows you to uninstall them.
```sh
$ ./.script.sh
$ NODE_ENV=production node app
```

#### Building for source
For production release:
```sh
$ gulp build --prod
```
Generating pre-built zip archives for distribution:
```sh
$ gulp build dist --prod
```
### Docker
For use docker,
By default, the Docker will expose port 8080, so change this within the Dockerfile if necessary. When ready, simply use the Dockerfile to build the image.

```sh
docker build --tag [YOUR_PROJECT] .
```
This will create the dillinger image and pull in the necessary dependencies. Be sure to swap out `${package.json.version}` with the actual version of Dillinger.

Once done, run the Docker image and map the port to whatever you wish on your host. In this example, we simply map port 8000 of the host to port 8080 of the Docker (or whatever port was exposed in the Dockerfile):

```sh
docker run --publish 8000:8080 --detach --name bb [YOUR_PROJECT]
```

Verify the deployment by navigating to your server address in your preferred browser.

```sh
127.0.0.1:8000
```

### Doxygen

Here is a link that will allow you to learn more if you wish to document a project done in C or C++.

[Doxygen - Getting started][url-doxygen]

### Conan

here is a link that will allow you to learn more about the package manager Conan.

[Conan - Getting started][url-conan]

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)


   [dill]: <https://github.com/ftestu/Script-Doxyfile-Conan>
   [url-doxygen]: <https://www.doxygen.nl/manual/starting.html>
