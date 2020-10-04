Return-Path: <SRS0=b8rD=DL=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D05C4363C
	for <linux-usb@archiver.kernel.org>; Sun,  4 Oct 2020 20:47:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E152206DD
	for <linux-usb@archiver.kernel.org>; Sun,  4 Oct 2020 20:47:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgJDUrO convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 4 Oct 2020 16:47:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:60694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726300AbgJDUrO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 4 Oct 2020 16:47:14 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209499] NKRO does not work on vortex race 3 keyboard
Date:   Sun, 04 Oct 2020 20:47:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sid@aeam.us
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-209499-208809-01YvMg8MZL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209499-208809@https.bugzilla.kernel.org/>
References: <bug-209499-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209499

R0b0t1 (sid@aeam.us) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |sid@aeam.us

--- Comment #1 from R0b0t1 (sid@aeam.us) ---
I understand your confusion but this is expected. The standard report format
for a USB keyboard is 8 bytes. The first byte contains the modifier key state,
the second is padding, and the remaining 6 bytes contain key codes.

N-key rollover is more a statement of how the switch matrix has been
constructed than how many keys you can use in your OS. There are other ways of
constructing a switch matrix that are marginally cheaper but lead to the
inability to distinguish keys after a certain point; for a typical 84-120 key
keyboard the optimal constructions tend to cap out at 6 simultaneous key
presses, explaining the choices made in the USB standard.

Looking at the lsusb -v output the device shows up as a boot keyboard (slightly
more restricted) and a normal keyboard, but both report the expected number of
bytes. Your keyboard has more interface information than usual but I am not
sure how it is interpreted. It could be sending more bytes back to Windows and
Windows may accept them. You may wish to investigate the keyboard from Windows
using the USBView tool.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
