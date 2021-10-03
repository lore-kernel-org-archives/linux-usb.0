Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB09C433EF
	for <linux-usb@archiver.kernel.org>; Sun,  3 Oct 2021 10:00:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44AB861B00
	for <linux-usb@archiver.kernel.org>; Sun,  3 Oct 2021 10:00:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbhJCKB5 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 3 Oct 2021 06:01:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:40552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229786AbhJCKB4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 3 Oct 2021 06:01:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3A13561B03
        for <linux-usb@vger.kernel.org>; Sun,  3 Oct 2021 10:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633255209;
        bh=4lfSUnJzvWyX49MLx9j1DJkQPfCX/uTuptdpOLMYw64=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GxMesqYa+gmw+cL5B36xXV4t6eX/gQ3b1PZFsgsNFP7iqWwV7iWc/+AlL+oq18Fl+
         xyWtFWRGJT5m+HgNwWhNpzPKYTpa0Cs8X3NOkCdRy/z1OogugPBwMtlAa4ubq6k4d1
         i15jbU3Qv8gxpxDg14nvG5ULafQdrA/C59+jYAvixD0jEQplnvGRb+/uy7MhjRLl2Q
         SkIGnHDlN/0RgTbsyCYSRFTkq7EmlYGhOHiSCzo3km843GPkE5FI5YXK91amkGBSIE
         WiYaLNhrqBv5FqxVBpu+7ea62LDwaBk/I8WY9uiZQYH83c5KggvcyyaUUVRCr+rdTV
         VZUHh3BUE9Qcg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214437] usb: hid: u2fzero: buffer overrun in u2fzero_rng_read
Date:   Sun, 03 Oct 2021 10:00:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andrew@shadura.me
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-214437-208809-PkSO5AQzW4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214437-208809@https.bugzilla.kernel.org/>
References: <bug-214437-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214437

Andrej Shadura (andrew@shadura.me) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #3 from Andrej Shadura (andrew@shadura.me) ---
Fixed in 22d6576

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D22d65765f211cc83186fd8b87521159f354c0da9

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
