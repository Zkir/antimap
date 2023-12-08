import cv2
import numpy as np

TILE_SIZE=256

# We need to rescale our textures, 
# because we need different scales on different zooms, obviously.


#strange division,
# k is a whole number which is necessary to multiply x to get more or equal than y:
# x*k>=y
def strage_div(y, x):
    k = y // x 
    b = y % x 
    if b != 0:
        k=k+1 
    return k

#rescale image 'n' times and tile if necessary to 256px (TILE_SIZE)
def rescale(input_file_name, output_file_name, n):
    # read image
    img1 = cv2.imread('textures/'+input_file_name)
    h0, w0, _ = img1.shape

    xfact = 1/n
    yfact = 1/n
    reduced1 = cv2.resize(img1, (0,0), fx=xfact, fy=yfact, interpolation=cv2.INTER_AREA)
    h, w, _ = reduced1.shape
    k=strage_div(TILE_SIZE,h)

    # tile (repeat) pattern 2 times in each dimension
    if k>1:
        result1 = cv2.repeat(reduced1, k, k)
    else:
        result1 = reduced1

    # save results
    cv2.imwrite('textures/'+output_file_name, result1)

#allotments
rescale('allotments2_z17.png','allotments2_z16.png',2)
rescale('allotments2_z16.png','allotments2_z15.png',2)
rescale('allotments2_z16.png','allotments2_z14.png',4)
rescale('allotments2_z16.png','allotments2_z13.png',8)
rescale('allotments2_z16.png','allotments2_z12.png',16)

#garages
rescale('garages_z16.jpg','garages_z17.jpg',0.5)

#wood_forest
rescale('wood_leaftype_unknown_z16.png', 'wood_leaftype_unknown_z17.png',0.5) 
rescale('wood_leaftype_unknown_z16.png', 'wood_leaftype_unknown_z15.png',2) 
rescale('wood_leaftype_unknown_z16.png', 'wood_leaftype_unknown_z14.png',4) 
rescale('wood_leaftype_unknown_z13.png', 'wood_leaftype_unknown_z12.png',2) 

