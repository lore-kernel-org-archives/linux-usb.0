Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94FBC433ED
	for <linux-usb@archiver.kernel.org>; Sat,  8 May 2021 03:10:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5EAA61151
	for <linux-usb@archiver.kernel.org>; Sat,  8 May 2021 03:10:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbhEHDLV (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 7 May 2021 23:11:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:38846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229775AbhEHDLV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 May 2021 23:11:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A591161288
        for <linux-usb@vger.kernel.org>; Sat,  8 May 2021 03:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620443420;
        bh=xLggAbGi50yWmnMtzx7zaZz/IVMJ6L1YiHpJeZjIVYM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=arRNI13cz19OPm1AQdReSPyNTb9iK3H3guPrjKuFB5lovhvOCUrAsrjiOZzMYV8X8
         O/b5FucIsn8bY7I4Gz2s9ILxZymXNwrZqNu2ZLFVB24IxTEH27V6Xh7ziGpoDxSCkK
         nPHbHQjbC2qxF3X00uNL/X2cnS/96IcsYxVkLEzYtV3k8eFNBC9ShfU/ygAQ/WrAxU
         9rfbwHW9ggy400jpXMFoNKZaWT29ydNpnsD31xH7jLudp7clcTcOtu5ms4CGj0BxaE
         CRwCgLm1BtTNh1f4oQ2rSyIZ0UiNUwqR8vI+NbhdZmDRwghGGCGbxIRIuVXQ38rVbm
         NBo9RN6JZkOXg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212955] Possible kernel regression USB2 (not USB3) port EDIROL
 UA-101 (in USB 1.1 mode, not USB2) error -110
Date:   Sat, 08 May 2021 03:10:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jaffa225man@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212955-208809-snyhZcsZ8r@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212955-208809@https.bugzilla.kernel.org/>
References: <bug-212955-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212955

--- Comment #10 from Lucas Endres (jaffa225man@gmail.com) ---
Thanks for your thoughts!  I helped to test a change on snd-ua101 to fix its
MIDI port not being created, but think it just blacklists the UA-101 from t=
he
snd-usb-audio driver, since it was conflicting.  Here's a link to that
discussion: https://bugzilla.kernel.org/show_bug.cgi?id=3D212477

Also, there have been substantial quality Roland/EDIROL/BOSS detection quirk
tweaks to snd-usb-audio (also with my championing and testing), but if I
understand correctly, they shouldn't be affecting the UA-101, due to its us=
e of
only snd-ua101: https://bugzilla.kernel.org/show_bug.cgi?id=3D212519

Sorry I hadn't mentioned these before, but until now I thought they could h=
ave
nothing to do with this issue.

In the next few days I hope to have time to attempt bisection to get to the
bottom of it all.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
