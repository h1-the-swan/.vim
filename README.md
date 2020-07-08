# My .vim directory

Run:

```
git submodule init
git submodule update --recursive
git submodule foreach git submodule init
git submodule foreach git submodule update --recursive
```

You might have to go into `bundle/jedi-vim/pythonx/jedi/` and do a `git submodule init` and `git submodule update --recursive`
