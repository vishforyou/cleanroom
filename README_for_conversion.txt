1. Run a python script (see below) to convert all the pages of all PDFs in a folder to images (JPEG) with resolution 300 DPI and dimensions 2550(width) *3300(height):
    python3 convert_pdf_to_image.py --input {folder containing PDFs} --output_dir {sample_folder_name} --dpi 300

(sample_folder_name is usually the same as the path to the folder containing the images)

2. Run the following command to initiate the labelImg UI and subsequently, create boxes (to be done by coders):
       labelImg {folder containing images} {path to classes.txt} {folder containing images}
       
3. Create the boxes and save the annotations in the folder containing the images.
Please note that we should have the same number of image and annotation text files (excluding classes.txt) in the output_dir folder path used in step 2.
