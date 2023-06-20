'''
Function to convert a PDF(s) into images of its constituent pages
'''
from __future__ import print_function, division, with_statement
from __future__ import absolute_import, unicode_literals
from warnings import filterwarnings
filterwarnings('ignore')
import os, sys, time
from os.path import *
import argparse
import fitz
import numpy as np
import cv2
from tqdm import tqdm
parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('--input', type=str, required=True, default=None, \
    help='Provide one PDF file path or the path of a folder containing several PDFs')
parser.add_argument('--output_dir', type=str, required=True, default=None, \
    help='Provide the path of the folder that will store the resulting images')
parser.add_argument('--dpi', type=int, required=False, default=300, \
    help='The DPI of the images', choices=[196, 256, 300])
args = vars(parser.parse_args())
assert exists(abspath(args['input'])), 'Make sure the input file/folder path is correct'
args['input'] = abspath(args['input'])
assert not isfile(abspath(args['output_dir'])), "The output directory must be a folder, not a file"
args['output_dir'] = abspath(args['output_dir'])
os.makedirs(args['output_dir'], exist_ok=True)
if isfile(args['input']):
    '''input file is a single PDF file'''
    doc = fitz.open(args['input'])
    pdfname = "_".join(basename(args['input']).split('.')[:-1])  ##// To account for dots in filenames
    print(pdfname)
    for idx, page in tqdm(enumerate(doc), total=doc.page_count, desc='Converting Pages to Images'):
        image = cv2.imdecode(np.frombuffer(page.get_pixmap(dpi=args['dpi']).tobytes('ppm'), dtype=np.uint8), cv2.IMREAD_COLOR)
        outputfilename = abspath(join(args['output_dir'], pdfname + f'_page_{idx+1}.jpg'))
        cv2.imwrite(outputfilename, image, [cv2.IMWRITE_JPEG_QUALITY, 95])
        # time.sleep(0.25)
elif isdir(args['input']):
    pdffiles = []
    for root, folder, files in os.walk(args['input']):
        if files != []:
            for file in files:
                if file.endswith(".pdf"):
                    pdffiles.append(abspath(join(root, file)))
    for pdffile in tqdm(pdffiles, total=len(pdffiles), desc="Converting pages to Images"):
        doc = fitz.open(filename=pdffile)
        pdfname = ".".join(basename(pdffile).split('.')[:-1])  ##// To account for dots in filenames
        for idx, page in enumerate(doc):
            image = cv2.imdecode(np.frombuffer(page.get_pixmap(dpi=args['dpi']).tobytes('ppm'), dtype=np.uint8), cv2.IMREAD_COLOR)
            outputfilename = abspath(join(args['output_dir'], pdfname + f'_page_{idx}.jpg'))
            cv2.imwrite(outputfilename, image, [cv2.IMWRITE_JPEG_QUALITY, 95])
