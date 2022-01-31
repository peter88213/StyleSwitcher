"""unlink_template.py 

Unlink template from an ODT document (command line)
Extracts and modifies "meta.xml" removing the "meta.template" entry.

Copyright (c) 2022 Peter Triesberger
For further information see https://github.com/peter88213/StyleSwitcher
Published under the MIT License (https://opensource.org/licenses/mit-license.php)
"""
import os
import re
import zipfile
from shutil import rmtree
import argparse


TEMPDIR = 'temp_odf'


def tear_down(path):
    """Delete the temporary directory 
    containing the unpacked ODF directory structure.
    """
    try:
        rmtree(path)

    except:
        pass


def set_up(path):
    """Create a temporary directory containing the internal 
    structure of an ODF file except 'content.xml'.
    """
    tear_down(path)

    try:
        os.mkdir(path)

    except:
        pass


if __name__ == '__main__':

    parser = argparse.ArgumentParser(
        description='Unlink template from ODT document.', epilog='A backup file will be created.')
    parser.add_argument('sourcePath', metavar='Document',
                        help='ODT document to process')
    args = parser.parse_args()

    xmldoc = f'{TEMPDIR}/meta.xml'
    odtdoc = args.sourcePath

    if os.path.isfile(odtdoc):
        workdir = os.getcwd()

        # Extract ODT file to TEMPDIR

        set_up(TEMPDIR)

        with zipfile.ZipFile(odtdoc, 'r') as myzip:
            contents = myzip.namelist()
            myzip.extractall(TEMPDIR)
            myzip.close

        # Remove template links from meta.xml and rewrite the document

        with open(xmldoc, 'r', encoding='utf-8') as f:
            text = f.read()

        if re.search('<meta:template.*/>', text) != None:
            result = re.split('<meta:template.*/>', text)

            with open(xmldoc, 'w', encoding='utf-8') as f:
                f.write(f'{result[0]}{result[1]}')

            # Back up the odt document

            backupCount = 0
            backupFile = f'{odtdoc}.bak'

            while os.path.exists(backupFile):
                backupFile = f'{odtdoc}.bk{backupCount:03}'
                backupCount += 1

            try:
                os.rename(odtdoc, backupFile)

                # Write the odt document

                with zipfile.ZipFile(odtdoc, 'w') as odfTarget:
                    os.chdir(TEMPDIR)

                    for file in contents:
                        odfTarget.write(file, compress_type=zipfile.ZIP_DEFLATED)

                    os.chdir(workdir)

                message = f'SUCCESS: Template removed from "{os.path.normpath(odtdoc)}".'

            except PermissionError:
                message = f'ERROR: Please close "{os.path.normpath(odtdoc)}" first.'

        else:
            message = f'"{os.path.normpath(odtdoc)}" is not linked to a template and remains unchanged.'

        # Remove temporary directory

        tear_down(TEMPDIR)

    else:
        message = f'ERROR: "{os.path.normpath(odtdoc)}" not found.'

    print(message)
