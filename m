Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EAF4C433B4
	for <linux-usb@archiver.kernel.org>; Mon, 10 May 2021 08:07:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14E9A6108B
	for <linux-usb@archiver.kernel.org>; Mon, 10 May 2021 08:07:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhEJIJB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 10 May 2021 04:09:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:39978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230076AbhEJIJB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 May 2021 04:09:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6A70360FF2
        for <linux-usb@vger.kernel.org>; Mon, 10 May 2021 08:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620634074;
        bh=yvHg2pavuOyQmukPL3fOp3oviKNkdx/5z1ooWZqtvEY=;
        h=From:To:Subject:Date:From;
        b=XOd3eYi7iYGstWzixF3i1rfyloBfEQ3+l55xogkHY91xK/vql6feO16yncLfGYdH5
         7QKldWNNnWlpbmtJKeDO5DQAcWfn6Gzo2tFydwd5KDdBad+vN4h+THhWPlFAULZVAp
         LngajFrvOG92fk3jD2mO/CBf/uql5i3ERYMazske7CIMJzlTZi09lej/ag9XaZTlLD
         sz4d69gZa9uY58yxXmpe26kow6wKFhb5qUrCwhnaiMk/CpAcos7V3GfGovAFDIrm2P
         Ar3WSG8KN8szqe3e61C4Eknw0a8gaDhQ9CYbhJ+cTikOvoP8OQlZBiWqJPIM8mKwVy
         KeXggVXY0uqpQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213011] New: [uvcvideo] Unable to turn on Realtek Semiconductor
 Corp. Integrated Webcam HD IR emitters
Date:   Mon, 10 May 2021 08:07:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: beresbarnus03@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-213011-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213011

            Bug ID: 213011
           Summary: [uvcvideo] Unable to turn on Realtek Semiconductor
                    Corp. Integrated Webcam HD IR emitters
           Product: Drivers
           Version: 2.5
    Kernel Version: All
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: beresbarnus03@gmail.com
        Regression: No

I am unable to turn on the IR emitters of my Realtek Semiconductor Corp.
Integrated Webcam on my Dell Inspiron 5567 laptop. Here is the output of ls=
usb
and v4l2-ctl --list-devices:

Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 006: ID 0cf3:e005 Qualcomm Atheros Communications
Bus 001 Device 004: ID 0bda:0129 Realtek Semiconductor Corp. RTS5129 Card
Reader Controller
Bus 001 Device 003: ID 0bda:58c2 Realtek Semiconductor Corp.
Integrated_Webcam_HD
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

Integrated_Webcam_HD: Integrate (usb-0000:00:14.0-5):
/dev/video0
/dev/video1

When I run ffplay /dev/video0 it works but when I run /dev/video1 it exits =
with
this error: /dev/video1: Inappropriate ioctl for device

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
