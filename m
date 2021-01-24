Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0989EC433E0
	for <linux-usb@archiver.kernel.org>; Sun, 24 Jan 2021 22:31:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C182722C7B
	for <linux-usb@archiver.kernel.org>; Sun, 24 Jan 2021 22:30:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbhAXWan convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 24 Jan 2021 17:30:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:43284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725968AbhAXWam (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 24 Jan 2021 17:30:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 6C31322C9F
        for <linux-usb@vger.kernel.org>; Sun, 24 Jan 2021 22:30:02 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 207045] uvcvideo: properly handle UVC payloads that occur in
 the middle of bulk URBs
Date:   Sun, 24 Jan 2021 22:30:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rpgm2k@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-207045-208809-ZNJNUOOauW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207045-208809@https.bugzilla.kernel.org/>
References: <bug-207045-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207045

Gabriel Gravel (rpgm2k@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rpgm2k@gmail.com

--- Comment #8 from Gabriel Gravel (rpgm2k@gmail.com) ---
I've been using this patch on Ubuntu 20.04 with kernel 5.4 and now 5.8 without
issue. Many thanks to you! Any chance this could be merged eventually?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
