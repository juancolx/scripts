#!/bin/bash
###############################################################################
#
# This is free and unencumbered software released into the public domain.
# For more information, please refer to <http://unlicense.org/>
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
# AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
# ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
###############################################################################

###############################################################################
# This script adds a given file as a header to other file(s). 
#
# Example of usage:
#     add-header.sh HEADER.txt *.cpp 
# 
# Author: Juan A. Colmenares <juancol@eecs.berkeley.edu>
#
# Creation Date: 10 March 2010
#
###############################################################################

HEADER_FILE=$1

shift

tmp=$(mktemp)   # Create a temporary file
trap "rm -f $tmp; exit 1" 0 1 2 3 13 15


for file in "$@"
  do
  {
    cat $HEADER_FILE $file  
  } > $tmp
  mv $tmp $file
  chmod ugo+rw $file
done

rm -f $tmp
trap 0


