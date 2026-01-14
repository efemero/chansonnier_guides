call_recipe := just_executable() + " --justfile=" + justfile()

build: clean 
    echo Building…
    mkdir -p target
    typst compile --ignore-system-fonts --font-path fonts/ chansonnier.typ target/chansonnier.pdf

clean:
    rm -fr target
    rm -fr $out

install:
    mkdir -p $out
    if [ -d target/chansonnier.pdf ] ; then mv target/chansonnier.pdf $out ; fi
