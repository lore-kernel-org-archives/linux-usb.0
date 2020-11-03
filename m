Return-Path: <SRS0=pmyG=EJ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E18C2D0A3
	for <linux-usb@archiver.kernel.org>; Tue,  3 Nov 2020 18:07:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 473E922243
	for <linux-usb@archiver.kernel.org>; Tue,  3 Nov 2020 18:07:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729107AbgKCSHc convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 3 Nov 2020 13:07:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:35386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729160AbgKCSHa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Nov 2020 13:07:30 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210015] page allocation failure in usb_hub_wq hub_event when
 adding HID device
Date:   Tue, 03 Nov 2020 18:07:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michel@daenzer.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210015-208809-Ob4FWYeyVZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210015-208809@https.bugzilla.kernel.org/>
References: <bug-210015-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210015

--- Comment #3 from Michel Dänzer (michel@daenzer.net) ---
(In reply to Benjamin Tissoires from comment #2)
> I'll have to double check but I don't think the allocated memory should be
> that big.

order:5 means 32 physically contiguous pages.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
