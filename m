Return-Path: <SRS0=VZyl=5X=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E16C2BA80
	for <linux-usb@archiver.kernel.org>; Tue,  7 Apr 2020 14:01:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8957220719
	for <linux-usb@archiver.kernel.org>; Tue,  7 Apr 2020 14:01:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728943AbgDGOBR convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 7 Apr 2020 10:01:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:37510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728739AbgDGOBR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Apr 2020 10:01:17 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 207147] USB errors: uhci_hcd 0000:01:00.4: swiotlb buffer is
 full (sz: 8 bytes) ; iommu=off
Date:   Tue, 07 Apr 2020 14:01:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: John.p.donnelly@oracle.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207147-208809-E8q3inMIif@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207147-208809@https.bugzilla.kernel.org/>
References: <bug-207147-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207147

--- Comment #3 from John.p.donnelly@oracle.com ---
Hi Alan,


wrt to comment 2.


If that is the case that iommu=on is needed on that is fine. I just wanted to
report my observation. 

FWIIW - 4.14 Oracle UEK5 kernels and 4.18 Redhat kernels do not require
iommu=on to have the HP iLo devices operate. This is an operational difference
between the 4.x and 5.x kernels.

Our own Oracle servers do not exhibit the same failures as HP Gen9 and Gen10
do. They operation fine regardless of the iommu setting(s).

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
