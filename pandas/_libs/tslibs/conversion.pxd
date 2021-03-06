# -*- coding: utf-8 -*-

from cpython.datetime cimport datetime

from numpy cimport int64_t, int32_t

from pandas._libs.tslibs.np_datetime cimport npy_datetimestruct


cdef class _TSObject:
    cdef:
        npy_datetimestruct dts      # npy_datetimestruct
        int64_t value               # numpy dt64
        object tzinfo


cdef convert_to_tsobject(object ts, object tz, object unit,
                         bint dayfirst, bint yearfirst,
                         int32_t nanos=*)

cdef _TSObject convert_datetime_to_tsobject(datetime ts, object tz,
                                            int32_t nanos=*)

cdef int64_t get_datetime64_nanos(object val) except? -1

cpdef datetime localize_pydatetime(datetime dt, object tz)
