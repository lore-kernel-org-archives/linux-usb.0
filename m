Return-Path: <SRS0=jI6n=AK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE82C433DF
	for <linux-usb@archiver.kernel.org>; Mon, 29 Jun 2020 03:03:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2A7B206BE
	for <linux-usb@archiver.kernel.org>; Mon, 29 Jun 2020 03:03:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725998AbgF2DDV convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 28 Jun 2020 23:03:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:38724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725976AbgF2DDV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 28 Jun 2020 23:03:21 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 208307] Alcor Micro Corp. Multi Flash Reader [058f:6366] keeps
 being detected and removed continuously
Date:   Mon, 29 Jun 2020 03:03:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jian-hong@endlessm.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208307-208809-BFyInOTTdT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208307-208809@https.bugzilla.kernel.org/>
References: <bug-208307-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208307

--- Comment #4 from jian-hong@endlessm.com ---
(In reply to Alan Stern from comment #3)
> On Wed, Jun 24, 2020 at 05:05:49AM +0000,
> bugzilla-daemon@bugzilla.kernel.org wrote:
> Try disabling Link Power Management for this device:
> 
>    echo 058f:6366:k >/sys/module/usbcore/parameters/quirks
Thanks for your information.  But the issue still happen, after the quirk is
applied.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
