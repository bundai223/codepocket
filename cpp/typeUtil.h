//**********************************************************************
//! @file   typeUtil.h
//! @brief  describe
//**********************************************************************
#ifndef _TYPEUTIL_H_INCLUDED_
#define _TYPEUTIL_H_INCLUDED_


#include <stddef.h> //! offsetof


//! offset
#define OFFSET_OF(type, member)     offsetof(type, member)

//! align
#ifndef __cplusplus
    #define ALIGNMENT_OF(type) OFFSET_OF(struct { char a; type b; }, b)
#else
    #define ALIGNMENT_OF(type) alignof<type>::value

    template <typename T>
    class alignof
    {
        struct helper
        {
            char a_;
            T b_;
        };
    public:
    	static const size_t value = OFFSET_OF(helper, b_);
    };
#endif

#endif // _TYPEUTIL_H_INCLUDED_

