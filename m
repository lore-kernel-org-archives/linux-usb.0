Return-Path: <SRS0=ajTD=7H=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B77CC433DF
	for <linux-usb@archiver.kernel.org>; Mon, 25 May 2020 16:29:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5E8320723
	for <linux-usb@archiver.kernel.org>; Mon, 25 May 2020 16:29:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731473AbgEYQ3p convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 25 May 2020 12:29:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:35232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731458AbgEYQ3p (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 25 May 2020 12:29:45 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 207887] USB devices connected to Thinkpad Dock hangs after a
 while
Date:   Mon, 25 May 2020 16:29:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mail@3v1n0.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-207887-208809-uGt2TOOsxM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207887-208809@https.bugzilla.kernel.org/>
References: <bug-207887-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207887

--- Comment #1 from Marco Trevisan (Treviño) (mail@3v1n0.net) ---
Created attachment 289277
  --> https://bugzilla.kernel.org/attachment.cgi?id=289277&action=edit
lsusb

Attaching lsusb while hanging, to notice that even if I detach the laptop from
the dock all the USB devices are still shown, although not working.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
