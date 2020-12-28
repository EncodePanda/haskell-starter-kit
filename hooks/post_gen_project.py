import os
import shutil

print(os.getcwd())

def remove(filepath):
    if os.path.isfile(filepath):
        os.remove(filepath)
    elif os.path.isdir(filepath):
        shutil.rmtree(filepath)

create_direnv = '{{cookiecutter.create_direnv}}' == 'y'
enable_emacs_integration = '{{cookiecutter.enable_emacs_integration}}' == 'y'

if not create_direnv:
    remove('.envrc')

if not enable_emacs_integration:
    remove('.dir-locals.el')
