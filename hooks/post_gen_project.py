import os
import shutil

print(os.getcwd())

def remove(filepath):
    if os.path.isfile(filepath):
        os.remove(filepath)
    elif os.path.isdir(filepath):
        shutil.rmtree(filepath)

create_direnv = '{{cookiecutter.create_direnv}}' == 'y'

if not create_direnv:
    remove('.envrc')
