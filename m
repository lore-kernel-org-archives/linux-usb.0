Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2796C433E6
	for <linux-usb@archiver.kernel.org>; Tue, 26 Jan 2021 14:12:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3B8022B3B
	for <linux-usb@archiver.kernel.org>; Tue, 26 Jan 2021 14:12:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392407AbhAZOLk convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 26 Jan 2021 09:11:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:51876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405770AbhAZOKF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 Jan 2021 09:10:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 39D7F22D04
        for <linux-usb@vger.kernel.org>; Tue, 26 Jan 2021 14:09:20 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210351] Wrong setting baudrate for FTDI chip FT230X
Date:   Tue, 26 Jan 2021 14:09:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: johan@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210351-208809-8KTTIUc3fD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210351-208809@https.bugzilla.kernel.org/>
References: <bug-210351-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210351

--- Comment #5 from Johan Hovold (johan@kernel.org) ---
Your reply never made it to the linux-usb list so I didn't see it until
today when I was preparing the patch I just CCed you on.

I'll queue it up for 5.12, but then I think we can backport it to the
stable trees as well.

Thanks again for reporting this.

Johan

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
