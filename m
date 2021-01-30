Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D65C433DB
	for <linux-usb@archiver.kernel.org>; Sat, 30 Jan 2021 13:12:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E03D64E0C
	for <linux-usb@archiver.kernel.org>; Sat, 30 Jan 2021 13:12:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhA3NLt (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 30 Jan 2021 08:11:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:35690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229620AbhA3NLr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 30 Jan 2021 08:11:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 4782F60234
        for <linux-usb@vger.kernel.org>; Sat, 30 Jan 2021 13:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612012267;
        bh=rl7fwFV14roCwizzTzNmtD6eUZoS7fUM2NaJ3Qawtrg=;
        h=From:To:Subject:Date:From;
        b=ikSH8TL07neEwt+89DjzO6eL1yT9MBwYveloRadOMYSzGHJe1gcEXqw42viMqNkNi
         m3plEaZvTRt698RywxcNXoX4AI6g08Qe18zKE8pOJtZfruSvkVfobDKsbvQV7ZVsqy
         bt4niQ7LM3+s4cbQec4zwkdxeq3EmDYS9zRd84moGovBooM1VPgIRiL3SQM5NpkXzc
         zfO3hYZ2DdTq1cEaQp1pEcRKCa5KeHn4Xt8t8unIiV4xZwYnqZ+bNxDelVDtpT+xj1
         b6NIuEzp2dehrT34/qdxW8rZOpQibAaVxS5hivGosKu9Ic9H0eiVMckGLVSKtwDamd
         8Rn6+r0zc/SUA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 211479] New: hid-generic: offset (0) exceeds report_count (0)
Date:   Sat, 30 Jan 2021 13:11:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andreas.thalhammer@linux.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-211479-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211479

            Bug ID: 211479
           Summary: hid-generic: offset (0) exceeds report_count (0)
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.11
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: andreas.thalhammer@linux.com
        Regression: No

Created attachment 295005
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D295005&action=3Dedit
relevent dmesg part...

After updating the firmware of my Wooting Two keyboard to the newest version
(in Windows, not Linux), I get this during boot-up (output copied from dmes=
g):

hid-generic 0003:03EB:FF02.0006: offset (0) exceeds report_count (0)
RIP: 0010:__alloc_pages_nodemask+0x1bc/0x240

see attatchment...

There is to say that I also have a mouse and a gamepad connected, also with=
 a
couple of input device nodes each.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
