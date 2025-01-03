# Script que transforma ficheros TSV (Tab-Separated Values) conteniendo varias tablas separadas por, presuntamente, dos saltos de línea en vez de uno, a varios XSLX, uno por tabla.

from tkinter import Tk, filedialog
import os
import time
from io import StringIO
import pandas as pd

root = Tk()
root.withdraw()
directory = filedialog.askdirectory(title="Seleccione el directorio cuyos ficheros han de ser transformados")

if directory:
    if not os.path.exists(f'{directory}/txtseparated'):
        os.mkdir(f'{directory}/txtseparated')
    for filename in os.listdir(directory):
        file_path = os.path.join(directory, filename)
        if os.path.isfile(file_path):
            content = None
            with open(file_path, 'r') as file:
                content = file.read()
            content = content.split(os.linesep * 2)
            for table in content:
                if table != '':
                    df = pd.read_csv(StringIO(table), sep='\t')
                    filename_wout_ext, _ = os.path.splitext(filename)
                    output_filename = f'{directory}/txtseparated/{filename_wout_ext}_{int(time.time() * 1000)}.xlsx'
                    df.to_excel(output_filename, index=False)
