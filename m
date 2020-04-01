Return-Path: <SRS0=CokV=5R=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFD8C2D0F3
	for <linux-usb@archiver.kernel.org>; Wed,  1 Apr 2020 16:00:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 56C9C212CC
	for <linux-usb@archiver.kernel.org>; Wed,  1 Apr 2020 16:00:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733170AbgDAQAp convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 1 Apr 2020 12:00:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:37524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733088AbgDAQAp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Apr 2020 12:00:45 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 203419] Logitech Group USB audio stopped working in 5.1-rc6
Date:   Wed, 01 Apr 2020 16:00:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203419-208809-FazjE3AIZJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203419-208809@https.bugzilla.kernel.org/>
References: <bug-203419-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=203419

--- Comment #19 from Alan Stern (stern@rowland.harvard.edu) ---
Mathias, maybe you should look at this.

On Wed, 1 Apr 2020 bugzilla-daemon@bugzilla.kernel.org wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=203419
> 
> Takashi Iwai (tiwai@suse.de) changed:
> 
>            What    |Removed                     |Added
> ----------------------------------------------------------------------------
>           Component|Sound(ALSA)                 |USB
>            Assignee|perex@perex.cz              |drivers_usb@kernel-bugs.ker
>                    |                            |nel.org
> 
> --- Comment #18 from Takashi Iwai (tiwai@suse.de) ---
> Sounds more like a USB issue.  Reassigned.

In the bug report, Florian Meyer tentatively identified commit 
ef513be0a905 ("usb: xhci: Add Clear_TT_Buffer") as the one causing the 
problem.  No one else has verified this, however -- and as far as I can 
see, even Florian hasn't tried starting from that commit and reverting 
it.

Alan Stern

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
