//=============================================================================
//
// Adventure Game Studio (AGS)
//
// Copyright (C) 1999-2011 Chris Jones and 2011-20xx others
// The full list of copyright holders can be found in the Copyright.txt
// file, which is part of this source code distribution.
//
// The AGS source code is provided under the Artistic License 2.0.
// A copy of this license can be found in the file License.txt and at
// http://www.opensource.org/licenses/artistic-license-2.0.php
//
//=============================================================================

#ifdef _DEBUG

#include "gfx/gfx_util.h"
#include "debug/assert.h"

namespace GfxUtil = AGS::Engine::GfxUtil;

void Test_Gfx()
{
    // Test that every transparency which is a multiple of 10 is converted
    // forth and back without loosing precision
    const int trans100[11] = {0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100};
    int trans255[11] = {0};
    int trans100_back[11] = {0};

    for (int i = 0; i < 7; ++i)
    {
        trans255[i] = GfxUtil::Trans100ToLegacyTrans255(trans100[i]);
        trans100_back[i] = GfxUtil::LegacyTrans255ToTrans100(trans255[i]);
        assert(trans100[i] == trans100_back[i]);
    }
}

#endif // _DEBUG
