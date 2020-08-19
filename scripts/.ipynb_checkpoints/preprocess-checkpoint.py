import sys
import os
import re
from copy import copy

book_root = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..')

files = ('chapter3/intro',
         'chapter3/planeshearflow',
         'chapter3/couette',
         'chapter3/poiseuille',
         'chapter3/similarity',
         'chapter3/stokes',
         'chapter4/intro',
         'chapter6/turbulence',
         'fenics/intro',
         'fenics/nonlinear',
         'fenics/transient',
         'mandatory/mandatory1',
         'mandatory/mandatory2',
         'solutions/chapter3/couette',
         'solutions/chapter3/poiseuille',
         'solutions/chapter4/intro',
         'solutions/chapter4/boundarylayer',
         'solutions/chapter4/blasius',
         'solutions/chapter4/falknerskan')

def main():
    os.chdir(book_root)

    for f in files:
        try:
            b = open('_build/html/content/{}.html'.format(f))
            bs = b.read()
            b.close()
            bs = re.sub('.ipynb#', '.html#', bs)
            b = open('_build/html/content/{}.html'.format(f), 'w')
            b.write(bs)
            b.close()
        except:
            pass


if __name__ == '__main__':
    main()
