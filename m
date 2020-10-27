Return-Path: <SRS0=zRYX=EC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED96C56202
	for <linux-usb@archiver.kernel.org>; Tue, 27 Oct 2020 17:28:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2666321D24
	for <linux-usb@archiver.kernel.org>; Tue, 27 Oct 2020 17:28:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751653AbgJ0OwX convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 27 Oct 2020 10:52:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:49780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1768200AbgJ0Otj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Oct 2020 10:49:39 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 207045] uvcvideo: properly handle UVC payloads that occur in
 the middle of bulk URBs
Date:   Tue, 27 Oct 2020 14:49:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luciomf@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-207045-208809-eq1RnNdmWr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207045-208809@https.bugzilla.kernel.org/>
References: <bug-207045-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207045

Lucio MF (luciomf@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |luciomf@gmail.com

--- Comment #4 from Lucio MF (luciomf@gmail.com) ---
Hi Julian,
I've been testing this for a few days now, mostly with google meets at 720p.
Working like a charm. I'll post if something goes wrong.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
