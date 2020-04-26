Return-Path: <SRS0=QdHT=6K=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E543DC54FCB
	for <linux-usb@archiver.kernel.org>; Sun, 26 Apr 2020 17:55:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8C33208FE
	for <linux-usb@archiver.kernel.org>; Sun, 26 Apr 2020 17:55:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgDZRzE convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 26 Apr 2020 13:55:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:43620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726150AbgDZRzD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 26 Apr 2020 13:55:03 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 207219] [BISECTED] Sony Vaio laptop built-in ricoh webcam no
 longer found on Fedora 31 with 5.4.11 kernel
Date:   Sun, 26 Apr 2020 17:55:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: williambader@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207219-208809-eNBmfK92RB@https.bugzilla.kernel.org/>
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

--- Comment #11 from William Bader (williambader@hotmail.com) ---
I see the instructions for making a usbmon trace in an earlier comment.
How do I keep the ehci-pci driver from getting loaded, and how do I load it
manually?

Is this how to keep it from being loaded?
# echo blacklist ehci_hcd > /etc/modprobe.d/ehci_hcd.conf
# cp /boot/initrd.$(uname -r).img save
# mkinitrd -o /boot/initrd.$(uname -r).img $(uname -r)
# reboot

How do I load it? I was guessing modprobe, but "lsmod | grep hci" shows only
sdhci, cqhci, and sdhci_pci.

"Set up your system so that the ehci-pci driver doesn't get loaded
automatically, in either the running system or the initrd image.  Then when the
system has started up, start up a usbmon trace from the 0u file (that is, all
buses) and load ehci-pci manually.  That way we can see exactly what happens
when the webcam gets initialized for the first time."

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
