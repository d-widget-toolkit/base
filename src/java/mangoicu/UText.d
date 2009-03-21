/*******************************************************************************

        @file UString.d

        Copyright (c) 2008 Frank Benoit

        This software is provided 'as-is', without any express or implied
        warranty. In no event will the authors be held liable for damages
        of any kind arising from the use of this software.

        Permission is hereby granted to anyone to use this software for any
        purpose, including commercial applications, and to alter it and/or
        redistribute it freely, subject to the following restrictions:

        1. The origin of this software must not be misrepresented; you must
           not claim that you wrote the original software. If you use this
           software in a product, an acknowledgment within documentation of
           said product would be appreciated but is not required.

        2. Altered source versions must be plainly marked as such, and must
           not be misrepresented as being the original software.

        3. This notice may not be removed or altered from any distribution
           of the source.

        4. Derivative works are permitted, but they must carry this notice
           in full and credit the original source.


                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


        @version        Initial version, July 2008
        @author         Frank

        Note that this package and documentation is built around the ICU
        project (http://oss.software.ibm.com/icu/). Below is the license
        statement as specified by that software:


                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


        ICU License - ICU 1.8.1 and later

        COPYRIGHT AND PERMISSION NOTICE

        Copyright (c) 1995-2003 International Business Machines Corporation and
        others.

        All rights reserved.

        Permission is hereby granted, free of charge, to any person obtaining a
        copy of this software and associated documentation files (the
        "Software"), to deal in the Software without restriction, including
        without limitation the rights to use, copy, modify, merge, publish,
        distribute, and/or sell copies of the Software, and to permit persons
        to whom the Software is furnished to do so, provided that the above
        copyright notice(s) and this permission notice appear in all copies of
        the Software and that both the above copyright notice(s) and this
        permission notice appear in supporting documentation.

        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
        OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
        MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT
        OF THIRD PARTY RIGHTS. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
        HOLDERS INCLUDED IN THIS NOTICE BE LIABLE FOR ANY CLAIM, OR ANY SPECIAL
        INDIRECT OR CONSEQUENTIAL DAMAGES, OR ANY DAMAGES WHATSOEVER RESULTING
        FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT,
        NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION
        WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

        Except as contained in this notice, the name of a copyright holder
        shall not be used in advertising or otherwise to promote the sale, use
        or other dealings in this Software without prior written authorization
        of the copyright holder.

        ----------------------------------------------------------------------

        All trademarks and registered trademarks mentioned herein are the
        property of their respective owners.

*******************************************************************************/
module java.mangoicu.UText;

import java.mangoicu.ICU;

struct UText {
    // UText private fields -- start
    private {
        uint        magic = UTEXT_MAGIC;
        int         flags = 0;
        int         providerProperties = 0;
        int         sizeOfStruct = UText.sizeof;
        long        chunkNativeLimit = 0;
        int         extraSize = 0;
        int         nativeIndexingLimit = 0;
        long        chunkNativeStart = 0;
        int         chunkOffset = 0;
        int         chunkLength = 0;
        wchar*      chunkContents = null;
        void*       pFuncs = null;
        void*       pExtra = null;
        void*       context = null;
        void*       p = null;
        void*       q = null;
        void*       r = null;
        void*       privP = null;
        long        a = 0;
        int         b = 0;
        int         c = 0;
        long        privA = 0;
        int         privB = 0;
        int         privC = 0;
    } // UText private fields -- end
    // do not add any non-static fields

    private enum {
        UTEXT_MAGIC = 0x345ad82c
    }
    void close(){
        version(D_Version2){
            utext_close(&this);
        } else {
            utext_close(this);
        }
    }
    private void ensureStatusOk( ICU.UErrorCode status ){
        if( status !is ICU.UErrorCode.OK ){
            throw new Exception( "ICU Exception" );
        }
    }
    void openUTF8( char[] str ){
        auto status = ICU.UErrorCode.OK;
        version(D_Version2){
            utext_openUTF8(&this, str.ptr, str.length, status );
        } else {
            utext_openUTF8(this, str.ptr, str.length, status );
        }
        ensureStatusOk( status );
    }


        /***********************************************************************

                Bind the ICU functions from a shared library. This is
                complicated by the issues regarding D and DLLs on the
                Windows platform

        ***********************************************************************/

        private static void* library;

        /***********************************************************************

        ***********************************************************************/
    static extern(System){
        UText * function(UText* ut) utext_close;
        UText * function(UText* ut, char *s, long length, inout ICU.UErrorCode status) utext_openUTF8;
//         UText * function(UText* ut, UChar *s, int64_t length, inout UErrorCode status) utext_openUChars;
//         UText * function(UText* ut, U_NAMESPACE_QUALIFIER UnicodeString *s, inout UErrorCode status) utext_openUnicodeString;
//         UText * function(UText* ut, U_NAMESPACE_QUALIFIER UnicodeString *s, inout UErrorCode status) utext_openConstUnicodeString;
//         UText * function(UText* ut, U_NAMESPACE_QUALIFIER Replaceable *rep, inout UErrorCode status) utext_openReplaceable;
//         UText * function(UText* ut, U_NAMESPACE_QUALIFIER CharacterIterator *ic, inout UErrorCode status) utext_openCharacterIterator;
//         UText * function(UText* ut, UText *src, UBool deep, UBool readOnly, inout UErrorCode status) utext_clone;
//         UBool function(const UText *a, const UText *b) utext_equals;
//         int64_t function(UText* ut) utext_nativeLength;
//         UBool function(UText* ut) utext_isLengthExpensive;
//         UChar32 function(UText* ut, int64_t nativeIndex) utext_char32At;
//         UChar32 function(UText* ut) utext_current32;
//         UChar32 function(UText* ut) utext_next32;
//         UChar32 function(UText* ut) utext_previous32;
//         UChar32 function(UText* ut, int64_t nativeIndex) utext_next32From;
//         UChar32 function(UText* ut, int64_t nativeIndex) utext_previous32From;
//         int64_t function(UText* ut) utext_getNativeIndex;
//         void function(UText* ut, int64_t nativeIndex) utext_setNativeIndex;
//         UBool function(UText* ut, int delta) utext_moveIndex32;
//         int64_t function(UText* ut) utext_getPreviousNativeIndex;
//         int function(UText* ut, int64_t nativeStart, int64_t nativeLimit,
//                 UChar *dest, int destCapacity,
//                 inout UErrorCode status) utext_extract;
//         UBool function(UText* ut) utext_isWritable;
//         UBool function(UText* ut) utext_hasMetaData;
//         int function(UText* ut,
//                 int64_t nativeStart, int64_t nativeLimit,
//                 UChar *replacementText, int replacementLength,
//                 inout UErrorCode status) utext_replace;
//         void function(UText* ut,
//                 int64_t nativeStart, int64_t nativeLimit,
//                 int64_t destIndex,
//                 UBool move,
//                 inout UErrorCode status) utext_copy;
//         void function(UText* ut) utext_freeze;
//         UText * function(UText* ut, int extraSpace, inout UErrorCode status) utext_setup;
    }

        /***********************************************************************

        ***********************************************************************/
        static  FunctionLoader.Bind[] targets = [
            {cast(void**) &utext_close,                   "utext_close"},
            {cast(void**) &utext_openUTF8,                "utext_openUTF8"},
//         {cast(void**) &utext_openUChars,              "utext_openUChars"},
//         {cast(void**) &utext_openUnicodeString,       "utext_openUnicodeString"},
//         {cast(void**) &utext_openConstUnicodeString,  "utext_openConstUnicodeString"},
//         {cast(void**) &utext_openReplaceable,         "utext_openReplaceable"},
//         {cast(void**) &utext_openCharacterIterator,   "utext_openCharacterIterator"},
//         {cast(void**) &utext_clone,                   "utext_clone"},
//         {cast(void**) &utext_equals,                  "utext_equals"},
//         {cast(void**) &utext_nativeLength,            "utext_nativeLength"},
//         {cast(void**) &utext_isLengthExpensive,       "utext_isLengthExpensive"},
//         {cast(void**) &utext_char32At,                "utext_char32At"},
//         {cast(void**) &utext_current32,               "utext_current32"},
//         {cast(void**) &utext_next32,                  "utext_next32"},
//         {cast(void**) &utext_next32From,              "utext_next32From"},
//         {cast(void**) &utext_previous32,              "utext_previous32"},
//         {cast(void**) &utext_previous32From,          "utext_previous32From"},
//         {cast(void**) &utext_setNativeIndex,          "utext_setNativeIndex"},
//         {cast(void**) &utext_moveIndex32,             "utext_moveIndex32"},
//         {cast(void**) &utext_getPreviousNativeIndex,  "utext_getPreviousNativeIndex"},
//         {cast(void**) &utext_extract,                 "utext_extract"},
//         {cast(void**) &utext_isWritable,              "utext_isWritable"},
//         {cast(void**) &utext_hasMetaData,             "utext_hasMetaData"},
//         {cast(void**) &utext_replace,                 "utext_replace"},
//         {cast(void**) &utext_copy,                    "utext_copy"},
//         {cast(void**) &utext_freeze,                  "utext_freeze"},
//         {cast(void**) &utext_setup,                   "utext_setup"},
        ];

        /***********************************************************************

        ***********************************************************************/

        static this ()
        {
                library = FunctionLoader.bind (ICU.icuuc, targets);
                //test ();
        }

        /***********************************************************************

        ***********************************************************************/

        static ~this ()
        {
                FunctionLoader.unbind (library);
        }

}
