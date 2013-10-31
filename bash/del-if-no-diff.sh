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
# This script checks if file.x and file.x.y have no differences.  If they don't
# it removes file.x.y.  It operates on multiple files. 
#
# How to use this file:
#     Modify the 'EXTRA_EXT' variable. 
# 
# Author: Juan A. Colmenares <juancol@eecs.berkeley.edu>
#
# Creation Date: 10 March 2010
#
###############################################################################

EXTRA_EXT=adap

for i in $(ls *.?); do
   diff $i $i.$EXTRA_EXT &>/dev/null
   if [ $? -eq 0 ]; then 
	echo $i $i.$EXTRA_EXT "are the same."
        rm $i.$EXTRA_EXT
   fi
done
