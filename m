Return-Path: <SRS0=w69b=CX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D81BC433E2
	for <linux-usb@archiver.kernel.org>; Mon, 14 Sep 2020 20:42:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E843B20E65
	for <linux-usb@archiver.kernel.org>; Mon, 14 Sep 2020 20:42:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgINUmn convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 14 Sep 2020 16:42:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:43232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726094AbgINUmk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 14 Sep 2020 16:42:40 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209089] USB storage devices appear as SATA devices
Date:   Mon, 14 Sep 2020 20:42:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bourne.identity@hotmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-209089-208809-18BZPinXkP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209089-208809@https.bugzilla.kernel.org/>
References: <bug-209089-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209089

Manish Jain (bourne.identity@hotmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|WILL_NOT_FIX                |---

--- Comment #12 from Manish Jain (bourne.identity@hotmail.com) ---
Hi Alan,

I request one more reasoning session. I would like to present an argument. If
the argument does not convince you, I shall close this thread for all times.

The argument is:

Consider yourself a cannabis user. Cannabis is legal in most countries now (at
least for medical use). An estimated 15% of Europe and America uses cannabis.

While high on pot, you suddenly remember something on your USB pen drive needs
to be accessed immediately.

You attach the USB pen drive, and try to mount it.

If USB disks use the ud* series, your command becomes:

mount -t /dev/ud<TAB>

If USB disks use the sd* series, your command becomes:

mount -t /dev/sdb<TAB>

Which one would you prefer ?


Thanks,
Manish Jain

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
