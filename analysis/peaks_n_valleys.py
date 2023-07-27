import peakdetect

import numpy as np

import pandas as pd

from pandas import *
 
# reading CSV file
data = read_csv("irene_test.csv")
 
# converting column data to list
x_axis = data['x'].tolist()

y_axis_H1 = data['H1'].tolist()
y_axis_H2 = data['H2'].tolist()
y_axis_H3 = data['H3'].tolist()
y_axis_H4 = data['H4'].tolist()
y_axis_H5 = data['H5'].tolist()
y_axis_H6 = data['H6'].tolist()
y_axis_H7 = data['H7'].tolist()
y_axis_H8 = data['H8'].tolist()
y_axis_H9 = data['H9'].tolist()
y_axis_H10 = data['H10'].tolist()

y_axis_C1 = data['C1'].tolist()
y_axis_C2 = data['C2'].tolist()
y_axis_C3 = data['C3'].tolist()
y_axis_C4 = data['C4'].tolist()
y_axis_C5 = data['C5'].tolist()
y_axis_C6 = data['C6'].tolist()
y_axis_C7 = data['C7'].tolist()
y_axis_C8 = data['C8'].tolist()
y_axis_C9 = data['C9'].tolist()
y_axis_C10 = data['C10'].tolist()



result_H1 = peakdetect.peakdetect(y_axis_H1, x_axis, 1, 0.0001)
result_H2 = peakdetect.peakdetect(y_axis_H2, x_axis, 1, 0.0001)
result_H3 = peakdetect.peakdetect(y_axis_H3, x_axis, 1, 0.0001)
result_H4 = peakdetect.peakdetect(y_axis_H4, x_axis, 1, 0.0001)
result_H5 = peakdetect.peakdetect(y_axis_H5, x_axis, 1, 0.0001)
result_H6 = peakdetect.peakdetect(y_axis_H6, x_axis, 1, 0.0001)
result_H7 = peakdetect.peakdetect(y_axis_H7, x_axis, 1, 0.0001)
result_H8 = peakdetect.peakdetect(y_axis_H8, x_axis, 1, 0.0001)
result_H9 = peakdetect.peakdetect(y_axis_H9, x_axis, 1, 0.0001)
result_H10 = peakdetect.peakdetect(y_axis_H10, x_axis, 1, 0.0001)

result_C1 = peakdetect.peakdetect(y_axis_C1, x_axis, 1, 0.0001)
result_C2 = peakdetect.peakdetect(y_axis_C2, x_axis, 1, 0.0001)
result_C3 = peakdetect.peakdetect(y_axis_C3, x_axis, 1, 0.0001)
result_C4 = peakdetect.peakdetect(y_axis_C4, x_axis, 1, 0.0001)
result_C5 = peakdetect.peakdetect(y_axis_C5, x_axis, 1, 0.0001)
result_C6 = peakdetect.peakdetect(y_axis_C6, x_axis, 1, 0.0001)
result_C7 = peakdetect.peakdetect(y_axis_C7, x_axis, 1, 0.0001)
result_C8 = peakdetect.peakdetect(y_axis_C8, x_axis, 1, 0.0001)
result_C9 = peakdetect.peakdetect(y_axis_C9, x_axis, 1, 0.0001)
result_C10 = peakdetect.peakdetect(y_axis_C10, x_axis, 1, 0.0001)

# H1 results output to .csv
peaks_H1, valleys_H1 = result_H1
peaks_H1, valleys_H1 = np.array(peaks_H1), np.array(valleys_H1)
peak_panda_H1 = pd.DataFrame(
    {
        "peak_x": peaks_H1[:, 0], 
        "peak_y": peaks_H1[:, 1], 
    }
)
valley_panda_H1 = pd.DataFrame(
    {
        "valley_x": valleys_H1[:, 0], 
        "valley_y": valleys_H1[:, 1],
    }
)
add_H1 = pd.concat([peak_panda_H1.reset_index(drop=True), valley_panda_H1.reset_index(drop=True)], axis=1)
add_H1.to_csv("result_H1.csv")

# H2 results output to .csv
peaks_H2, valleys_H2 = result_H2
peaks_H2, valleys_H2 = np.array(peaks_H2), np.array(valleys_H2)
peak_panda_H2 = pd.DataFrame(
    {
        "peak_x": peaks_H2[:, 0], 
        "peak_y": peaks_H2[:, 1], 
    }
)
valley_panda_H2 = pd.DataFrame(
    {
        "valley_x": valleys_H2[:, 0], 
        "valley_y": valleys_H2[:, 1],
    }
)
add_H2 = pd.concat([peak_panda_H2.reset_index(drop=True), valley_panda_H2.reset_index(drop=True)], axis=1)
add_H2.to_csv("result_H2.csv")

# H3 results output to .csv
peaks_H3, valleys_H3 = result_H3
peaks_H3, valleys_H3 = np.array(peaks_H3), np.array(valleys_H3)
peak_panda_H3 = pd.DataFrame(
    {
        "peak_x": peaks_H3[:, 0], 
        "peak_y": peaks_H3[:, 1], 
    }
)
valley_panda_H3 = pd.DataFrame(
    {
        "valley_x": valleys_H3[:, 0], 
        "valley_y": valleys_H3[:, 1],
    }
)
add_H3 = pd.concat([peak_panda_H3.reset_index(drop=True), valley_panda_H3.reset_index(drop=True)], axis=1)
add_H3.to_csv("result_H3.csv")

# H4 results output to .csv
peaks_H4, valleys_H4 = result_H4
peaks_H4, valleys_H4 = np.array(peaks_H4), np.array(valleys_H4)
peak_panda_H4 = pd.DataFrame(
    {
        "peak_x": peaks_H4[:, 0], 
        "peak_y": peaks_H4[:, 1], 
    }
)
valley_panda_H4 = pd.DataFrame(
    {
        "valley_x": valleys_H4[:, 0], 
        "valley_y": valleys_H4[:, 1],
    }
)
add_H4 = pd.concat([peak_panda_H4.reset_index(drop=True), valley_panda_H4.reset_index(drop=True)], axis=1)
add_H4.to_csv("result_H4.csv")

# H5 results output to .csv
peaks_H5, valleys_H5 = result_H5
peaks_H5, valleys_H5 = np.array(peaks_H5), np.array(valleys_H5)
peak_panda_H5 = pd.DataFrame(
    {
        "peak_x": peaks_H5[:, 0], 
        "peak_y": peaks_H5[:, 1], 
    }
)
valley_panda_H5 = pd.DataFrame(
    {
        "valley_x": valleys_H5[:, 0], 
        "valley_y": valleys_H5[:, 1],
    }
)
add_H5 = pd.concat([peak_panda_H5.reset_index(drop=True), valley_panda_H5.reset_index(drop=True)], axis=1)
add_H5.to_csv("result_H5.csv")

# H6 results output to .csv
peaks_H6, valleys_H6 = result_H6
peaks_H6, valleys_H6 = np.array(peaks_H6), np.array(valleys_H6)
peak_panda_H6 = pd.DataFrame(
    {
        "peak_x": peaks_H6[:, 0], 
        "peak_y": peaks_H6[:, 1], 
    }
)
valley_panda_H6 = pd.DataFrame(
    {
        "valley_x": valleys_H6[:, 0], 
        "valley_y": valleys_H6[:, 1],
    }
)
add_H6 = pd.concat([peak_panda_H6.reset_index(drop=True), valley_panda_H6.reset_index(drop=True)], axis=1)
add_H6.to_csv("result_H6.csv")

# H7 results output to .csv
peaks_H7, valleys_H7 = result_H7
peaks_H7, valleys_H7 = np.array(peaks_H7), np.array(valleys_H7)
peak_panda_H7 = pd.DataFrame(
    {
        "peak_x": peaks_H7[:, 0], 
        "peak_y": peaks_H7[:, 1], 
    }
)
valley_panda_H7 = pd.DataFrame(
    {
        "valley_x": valleys_H7[:, 0], 
        "valley_y": valleys_H7[:, 1],
    }
)
add_H7 = pd.concat([peak_panda_H7.reset_index(drop=True), valley_panda_H7.reset_index(drop=True)], axis=1)
add_H7.to_csv("result_H7.csv")

# H8 results output to .csv
peaks_H8, valleys_H8 = result_H8
peaks_H8, valleys_H8 = np.array(peaks_H8), np.array(valleys_H8)
peak_panda_H8 = pd.DataFrame(
    {
        "peak_x": peaks_H8[:, 0], 
        "peak_y": peaks_H8[:, 1], 
    }
)
valley_panda_H8 = pd.DataFrame(
    {
        "valley_x": valleys_H8[:, 0], 
        "valley_y": valleys_H8[:, 1],
    }
)
add_H8 = pd.concat([peak_panda_H8.reset_index(drop=True), valley_panda_H8.reset_index(drop=True)], axis=1)
add_H8.to_csv("result_H8.csv")

# H9 results output to .csv
peaks_H9, valleys_H9 = result_H9
peaks_H9, valleys_H9 = np.array(peaks_H9), np.array(valleys_H9)
peak_panda_H9 = pd.DataFrame(
    {
        "peak_x": peaks_H9[:, 0], 
        "peak_y": peaks_H9[:, 1], 
    }
)
valley_panda_H9 = pd.DataFrame(
    {
        "valley_x": valleys_H9[:, 0], 
        "valley_y": valleys_H9[:, 1],
    }
)
add_H9 = pd.concat([peak_panda_H9.reset_index(drop=True), valley_panda_H9.reset_index(drop=True)], axis=1)
add_H9.to_csv("result_H9.csv")

# H10 results output to .csv
peaks_H10, valleys_H10 = result_H10
peaks_H10, valleys_H10 = np.array(peaks_H10), np.array(valleys_H10)
peak_panda_H10 = pd.DataFrame(
    {
        "peak_x": peaks_H10[:, 0], 
        "peak_y": peaks_H10[:, 1], 
    }
)
valley_panda_H10 = pd.DataFrame(
    {
        "valley_x": valleys_H10[:, 0], 
        "valley_y": valleys_H10[:, 1],
    }
)
add_H10 = pd.concat([peak_panda_H10.reset_index(drop=True), valley_panda_H10.reset_index(drop=True)], axis=1)
add_H10.to_csv("result_H10.csv")





# C1 results output to .csv
peaks_C1, valleys_C1 = result_C1
peaks_C1, valleys_C1 = np.array(peaks_C1), np.array(valleys_C1)
peak_panda_C1 = pd.DataFrame(
    {
        "peak_x": peaks_C1[:, 0], 
        "peak_y": peaks_C1[:, 1], 
    }
)
valley_panda_C1 = pd.DataFrame(
    {
        "valley_x": valleys_C1[:, 0], 
        "valley_y": valleys_C1[:, 1],
    }
)
add_C1 = pd.concat([peak_panda_C1.reset_index(drop=True), valley_panda_C1.reset_index(drop=True)], axis=1)
add_C1.to_csv("result_C1.csv")

# C2 results output to .csv
peaks_C2, valleys_C2 = result_C2
peaks_C2, valleys_C2 = np.array(peaks_C2), np.array(valleys_C2)
peak_panda_C2 = pd.DataFrame(
    {
        "peak_x": peaks_C2[:, 0], 
        "peak_y": peaks_C2[:, 1], 
    }
)
valley_panda_C2 = pd.DataFrame(
    {
        "valley_x": valleys_C2[:, 0], 
        "valley_y": valleys_C2[:, 1],
    }
)
add_C2 = pd.concat([peak_panda_C2.reset_index(drop=True), valley_panda_C2.reset_index(drop=True)], axis=1)
add_C2.to_csv("result_C2.csv")

# H3 results output to .csv
peaks_C3, valleys_C3 = result_C3
peaks_C3, valleys_C3 = np.array(peaks_C3), np.array(valleys_C3)
peak_panda_C3 = pd.DataFrame(
    {
        "peak_x": peaks_C3[:, 0], 
        "peak_y": peaks_C3[:, 1], 
    }
)
valley_panda_C3 = pd.DataFrame(
    {
        "valley_x": valleys_C3[:, 0], 
        "valley_y": valleys_C3[:, 1],
    }
)
add_C3 = pd.concat([peak_panda_C3.reset_index(drop=True), valley_panda_C3.reset_index(drop=True)], axis=1)
add_C3.to_csv("result_C3.csv")

# C4 results output to .csv
peaks_C4, valleys_C4 = result_C4
peaks_C4, valleys_C4 = np.array(peaks_C4), np.array(valleys_C4)
peak_panda_C4 = pd.DataFrame(
    {
        "peak_x": peaks_C4[:, 0], 
        "peak_y": peaks_C4[:, 1], 
    }
)
valley_panda_C4 = pd.DataFrame(
    {
        "valley_x": valleys_C4[:, 0], 
        "valley_y": valleys_C4[:, 1],
    }
)
add_C4 = pd.concat([peak_panda_C4.reset_index(drop=True), valley_panda_C4.reset_index(drop=True)], axis=1)
add_C4.to_csv("result_C4.csv")

# C5 results output to .csv
peaks_C5, valleys_C5 = result_C5
peaks_C5, valleys_C5 = np.array(peaks_C5), np.array(valleys_C5)
peak_panda_C5 = pd.DataFrame(
    {
        "peak_x": peaks_C5[:, 0], 
        "peak_y": peaks_C5[:, 1], 
    }
)
valley_panda_C5 = pd.DataFrame(
    {
        "valley_x": valleys_C5[:, 0], 
        "valley_y": valleys_C5[:, 1],
    }
)
add_C5 = pd.concat([peak_panda_C5.reset_index(drop=True), valley_panda_C5.reset_index(drop=True)], axis=1)
add_C5.to_csv("result_C5.csv")

# C6 results output to .csv
peaks_C6, valleys_C6 = result_C6
peaks_C6, valleys_C6 = np.array(peaks_C6), np.array(valleys_C6)
peak_panda_C6 = pd.DataFrame(
    {
        "peak_x": peaks_C6[:, 0], 
        "peak_y": peaks_C6[:, 1], 
    }
)
valley_panda_C6 = pd.DataFrame(
    {
        "valley_x": valleys_C6[:, 0], 
        "valley_y": valleys_C6[:, 1],
    }
)
add_C6 = pd.concat([peak_panda_C6.reset_index(drop=True), valley_panda_C6.reset_index(drop=True)], axis=1)
add_C6.to_csv("result_C6.csv")

# C7 results output to .csv
peaks_C7, valleys_C7 = result_C7
peaks_C7, valleys_C7 = np.array(peaks_C7), np.array(valleys_C7)
peak_panda_C7 = pd.DataFrame(
    {
        "peak_x": peaks_C7[:, 0], 
        "peak_y": peaks_C7[:, 1], 
    }
)
valley_panda_C7 = pd.DataFrame(
    {
        "valley_x": valleys_C7[:, 0], 
        "valley_y": valleys_C7[:, 1],
    }
)
add_C7 = pd.concat([peak_panda_C7.reset_index(drop=True), valley_panda_C7.reset_index(drop=True)], axis=1)
add_C7.to_csv("result_C7.csv")

# C8 results output to .csv
peaks_C8, valleys_C8 = result_C8
peaks_C8, valleys_C8 = np.array(peaks_C8), np.array(valleys_C8)
peak_panda_C8 = pd.DataFrame(
    {
        "peak_x": peaks_C8[:, 0], 
        "peak_y": peaks_C8[:, 1], 
    }
)
valley_panda_C8 = pd.DataFrame(
    {
        "valley_x": valleys_C8[:, 0], 
        "valley_y": valleys_C8[:, 1],
    }
)
add_C8 = pd.concat([peak_panda_C8.reset_index(drop=True), valley_panda_C8.reset_index(drop=True)], axis=1)
add_C8.to_csv("result_C8.csv")

# C9 results output to .csv
peaks_C9, valleys_C9 = result_C9
peaks_C9, valleys_C9 = np.array(peaks_C9), np.array(valleys_C9)
peak_panda_C9 = pd.DataFrame(
    {
        "peak_x": peaks_C9[:, 0], 
        "peak_y": peaks_C9[:, 1], 
    }
)
valley_panda_C9 = pd.DataFrame(
    {
        "valley_x": valleys_C9[:, 0], 
        "valley_y": valleys_C9[:, 1],
    }
)
add_C9 = pd.concat([peak_panda_C9.reset_index(drop=True), valley_panda_C9.reset_index(drop=True)], axis=1)
add_C9.to_csv("result_C9.csv")

# C10 results output to .csv
peaks_C10, valleys_C10 = result_C10
peaks_C10, valleys_C10 = np.array(peaks_C10), np.array(valleys_C10)
peak_panda_C10 = pd.DataFrame(
    {
        "peak_x": peaks_C10[:, 0], 
        "peak_y": peaks_C10[:, 1], 
    }
)
valley_panda_C10 = pd.DataFrame(
    {
        "valley_x": valleys_C10[:, 0], 
        "valley_y": valleys_C10[:, 1],
    }
)
add_C10 = pd.concat([peak_panda_C10.reset_index(drop=True), valley_panda_C10.reset_index(drop=True)], axis=1)
add_C10.to_csv("result_C10.csv")