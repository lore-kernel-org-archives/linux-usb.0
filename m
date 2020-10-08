Return-Path: <SRS0=gWik=DP=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37C7C04EBE
	for <linux-usb@archiver.kernel.org>; Thu,  8 Oct 2020 08:54:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60CE921775
	for <linux-usb@archiver.kernel.org>; Thu,  8 Oct 2020 08:54:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgJHIyK convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 8 Oct 2020 04:54:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:57598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725845AbgJHIyK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 8 Oct 2020 04:54:10 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209581] New: linux usb driver Intel(R) 5 Series/3400 Series
 Chipset Family not work well
Date:   Thu, 08 Oct 2020 08:54:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nasrsoftware@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-209581-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209581

            Bug ID: 209581
           Summary: linux usb driver Intel(R) 5 Series/3400 Series Chipset
                    Family not work well
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.6,5.8,5.9,fedora 32
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: nasrsoftware@gmail.com
        Regression: No

My laptob is acer 5733 …core i3 with 3 usb2 4gb ram i am using fedora
workstation 32 all usb ports slow, moving wireless usb mouse is so slow and
laggy, data transfer is 200kb/s writespeed is such 0kb/s I did
(vm.dirty_background_bytes =4194304 vm.dirty bytes=4194304 ) but didnt change
on My problem Its work correctly in win10 But on linux doenst work well So
would U think its(slowly usb transfer) reletive to chipset driver?? flash
drives take about 5 mins to mount :(

i tested 5.6 , 5.8 , 5.9 kernel , fedora 32 64bit , debian 9 and nothing
changed

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
