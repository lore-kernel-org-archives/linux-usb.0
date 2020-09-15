Return-Path: <SRS0=Z06V=CY=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB20C433E2
	for <linux-usb@archiver.kernel.org>; Tue, 15 Sep 2020 23:13:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E4E321655
	for <linux-usb@archiver.kernel.org>; Tue, 15 Sep 2020 23:13:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727353AbgIOXNP convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 15 Sep 2020 19:13:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:48796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727272AbgIOOki (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Sep 2020 10:40:38 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209089] USB storage devices appear as SATA devices
Date:   Tue, 15 Sep 2020 14:30:31 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209089-208809-UjU9Pu1bbW@https.bugzilla.kernel.org/>
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

--- Comment #16 from Manish Jain (bourne.identity@hotmail.com) ---
"This one has an advantage: one character less to type, plus the comfort of the
knowledge that USB have their own series"

was meant to be:

"This one has an advantage: one character less to type, plus the comfort of the
knowledge that USB mass storage devices have their own series"

Sorry for the typo.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
