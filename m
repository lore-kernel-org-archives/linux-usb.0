Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7B7C433ED
	for <linux-usb@archiver.kernel.org>; Wed, 19 May 2021 17:59:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0F936124C
	for <linux-usb@archiver.kernel.org>; Wed, 19 May 2021 17:59:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbhESSAy (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 19 May 2021 14:00:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:57432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230148AbhESSAv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 May 2021 14:00:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 949AA61355
        for <linux-usb@vger.kernel.org>; Wed, 19 May 2021 17:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621447171;
        bh=n2l2jDRd8+xGByMhndFvD4xtzJrvhRctlUmuvX2M9fQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=au9w+cvrr3ONvriVaFRzZclLP/GHq0I0EO+qbSlOCFIdw1cgdk1vy4MMOlnqbhHp1
         unzdyUTGqk1u0hnoOpfwRXuLO73HdC2b0YGRJX9z069KowIudmWJCZyRnkXLLwyO3h
         Ff/zpt5b1quauadQJN4CLWjf2tA9VwIWgmlBy4vdXlHrVeSHY0Bkk3lT5CIV/0J17S
         JX61dpYKltDkGQPXthts4XvKwuJ6UDky1ehp2NZdxAix33mzJblOLD2lYUV5KCOVJI
         9oTD7rNyLsY+Lv3AklBh1aASbwQ+IHIyt1yLjYrbX5p0Qwd60YdNK5M3EVjlswK3JT
         QQiCBWyAqpnsA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Wed, 19 May 2021 17:59:31 +0000
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
Message-ID: <bug-213081-208809-OnIdFg1Gye@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213081-208809@https.bugzilla.kernel.org/>
References: <bug-213081-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213081

--- Comment #19 from Alan Stern (stern@rowland.harvard.edu) ---
The usbmon trace shows that the original problem of not reporting the STALL=
 has
been fixed.  But there is a new problem.  Here's where it shows up in the t=
race
for bus 6:

ffff88810248e0c0 67313744 S Bi:6:004:1 -115 13 <
ffff88810248e0c0 97843800 C Bi:6:004:1 -104 13 =3D 55534243 04000000 000000=
00 00

This was the second packet received from ep1in after the halt was cleared. =
 The
values in the received packet are correct (i.e., what I expect them to be),=
 but
the timestamp and the -104 error code show that the URB timed out after 30
second and was unlinked.  This should not have happened; the URB should have
completed normally in less than one millisecond.

After this error, the device was reset and the same sequence of packets was
exchanged, with the same result as before (apparently -- the trace ends dur=
ing
the second 30-second timeout window).

This indicates that the patch does not fully fix all the issues.  Evidently
xhci-hcd has trouble seeing when an URB for a formerly halted endpoint has
completed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
