Return-Path: <SRS0=yvN3=3K=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA25C2D0CE
	for <linux-usb@archiver.kernel.org>; Tue, 21 Jan 2020 20:15:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E6DDF20882
	for <linux-usb@archiver.kernel.org>; Tue, 21 Jan 2020 20:15:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729107AbgAUUPw convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 21 Jan 2020 15:15:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:39446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727829AbgAUUPw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Jan 2020 15:15:52 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 206271] New: Trackpoint stops working after updating from
 Kernel 5.4.11 to 5.4.12
Date:   Tue, 21 Jan 2020 20:15:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: goepfert.johannes@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-206271-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206271

            Bug ID: 206271
           Summary: Trackpoint stops working after updating from Kernel
                    5.4.11 to 5.4.12
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4.13
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: goepfert.johannes@gmail.com
        Regression: No

The Trackpoint from my Lenovo X1 Tablet Gen 3 stopped working after updating to
Kernel version 5.4.12. The Trackpoint is recognized by "usbmon" (usbmon gives
an output) and also "libinput list-devices". But there is no output for "cat
/dev/input/eventX".

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
