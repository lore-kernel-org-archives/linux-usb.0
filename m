Return-Path: <SRS0=da/P=AZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C864C433E5
	for <linux-usb@archiver.kernel.org>; Tue, 14 Jul 2020 19:11:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E08D22507
	for <linux-usb@archiver.kernel.org>; Tue, 14 Jul 2020 19:11:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729743AbgGNTLd convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 14 Jul 2020 15:11:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:40604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728926AbgGNTLc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Jul 2020 15:11:32 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 208357] snd-usb-audio broken for 06f8:b000 since 4.9.189
Date:   Tue, 14 Jul 2020 19:11:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: bugzilla.kernel.org@mrtoasted.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208357-208809-gqzSDAfwov@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208357-208809@https.bugzilla.kernel.org/>
References: <bug-208357-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208357

--- Comment #10 from Alexander Chalikiopoulos (bugzilla.kernel.org@mrtoasted.com) ---
I just realized that the first part of your patch says `USB_DEVICE(0x0926,
0xb000)` but that should be `USB_DEVICE(0x06f8, 0xb000)` right?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
