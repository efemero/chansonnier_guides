call_recipe := just_executable() + " --justfile=" + justfile()

build: clean 
    echo Building…
    mkdir -p target/pdf
    typst compile --ignore-system-fonts --font-path fonts/ chansonnier.typ target/pdf/chansonnier.pdf

clean:
    rm -fr target
    rm -fr $out

install:
    mkdir -p $out
    if [ -d target/pdf ] ; then mv target/pdf $out ; fi
