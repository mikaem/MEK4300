import subprocess
subprocess.call(["sed -i -e 's/latest.js?config=TeX-AMS-MML_HTMLorMML/MathJax.js?config=TeX-AMS_CHTML/g' $(find _build -name '*.html')"], shell=True)
