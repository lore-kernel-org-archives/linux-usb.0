Return-Path: <SRS0=QdHT=6K=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1C6C54FCB
	for <linux-usb@archiver.kernel.org>; Sun, 26 Apr 2020 14:25:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54E4D2074F
	for <linux-usb@archiver.kernel.org>; Sun, 26 Apr 2020 14:25:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgDZOZe convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 26 Apr 2020 10:25:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:45004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725876AbgDZOZe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 26 Apr 2020 10:25:34 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 207219] [BISECTED] Sony Vaio laptop built-in ricoh webcam no
 longer found on Fedora 31 with 5.4.11 kernel
Date:   Sun, 26 Apr 2020 14:25:33 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-207219-208809-xIvkRZllIC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207219-208809@https.bugzilla.kernel.org/>
References: <bug-207219-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207219

Alan Stern (stern@rowland.harvard.edu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |stern@rowland.harvard.edu

--- Comment #10 from Alan Stern (stern@rowland.harvard.edu) ---
It won't slow down enumeration all that much.

If you had a problem then it's likely that a bunch of other people had the same
problem too; they just didn't bother to report it.  Fixing your system will
help all those other people as well -- certainly it should help anyone who has
the same kind of laptop with the same kind of camera.  (Unless the problem was
a hardware flaw in your webcam, not any others.)

In theory we could add another usbcore module parameter for this.  But in fact,
usbcore already has too many module parameters; adding new ones is discouraged.
 Besides, that sort of thing isn't guaranteed always to work.  Some devices
will want the old scheme to come first, and others (like your webcam) will want
the new scheme to come first.  What can you do if your system has both types of
device present?

If you really want to track this down farther, here's something you can try. 
Set up your system so that the ehci-pci driver doesn't get loaded
automatically, in either the running system or the initrd image.  Then when the
system has started up, start up a usbmon trace from the 0u file (that is, all
buses) and load ehci-pci manually.  That way we can see exactly what happens
when the webcam gets initialized for the first time.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
