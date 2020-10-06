Return-Path: <SRS0=zoLE=DN=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494B1C4363D
	for <linux-usb@archiver.kernel.org>; Tue,  6 Oct 2020 14:22:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F359F20789
	for <linux-usb@archiver.kernel.org>; Tue,  6 Oct 2020 14:22:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgJFOW2 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 6 Oct 2020 10:22:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:46552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbgJFOW2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Oct 2020 10:22:28 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 203419] Logitech Group USB audio stopped working in 5.1-rc6
Date:   Tue, 06 Oct 2020 14:22:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dirk.gajewski@uni-hamburg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203419-208809-titfRnecnY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203419-208809@https.bugzilla.kernel.org/>
References: <bug-203419-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=203419

Dirk Gajewski (dirk.gajewski@uni-hamburg.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dirk.gajewski@uni-hamburg.d
                   |                            |e

--- Comment #48 from Dirk Gajewski (dirk.gajewski@uni-hamburg.de) ---
I can second the previous comment. Kernel 5.8.12: no success for Logitech
conference cam. Camera is working but no audio (084b, 084c, 084e).

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
