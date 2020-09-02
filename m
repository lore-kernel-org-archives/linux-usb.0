Return-Path: <SRS0=Ur+j=CL=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F19C433E6
	for <linux-usb@archiver.kernel.org>; Wed,  2 Sep 2020 06:05:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 274DF206F0
	for <linux-usb@archiver.kernel.org>; Wed,  2 Sep 2020 06:05:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgIBGFm convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 2 Sep 2020 02:05:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:33534 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725774AbgIBGFl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Sep 2020 02:05:41 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 203419] Logitech Group USB audio stopped working in 5.1-rc6
Date:   Wed, 02 Sep 2020 06:05:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stefan.ursella@wolfvision.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203419-208809-HPLIvzd4Lq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203419-208809@https.bugzilla.kernel.org/>
References: <bug-203419-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=203419

Stefan (stefan.ursella@wolfvision.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |stefan.ursella@wolfvision.n
                   |                            |et

--- Comment #42 from Stefan (stefan.ursella@wolfvision.net) ---
(In reply to Ikjoon Jang from comment #41)
> (In reply to Olivier R-D from comment #40)
> > logitech group microphone and sounds does not work on ubuntu 20.04 with
> > generic kernel 5.8.4. traces as in comment #21 attached.
> > 
> > I am available to test any build kernel. I have the device here
> 
> comment #33:
> Can you try this patch?
> https://lkml.org/lkml/2020/7/21/89
> 
> note that "8f97250c21f0 xhci: Don't clear hub TT buffer..." should be
> included in your kernel before.


Hi Ikjoon Jang, the patch is working on our side butt there is a litte problem
the device id is 0x0857 from our Logitech Group

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
