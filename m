Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CDBC4338F
	for <linux-usb@archiver.kernel.org>; Sun,  8 Aug 2021 18:01:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6689C60EE9
	for <linux-usb@archiver.kernel.org>; Sun,  8 Aug 2021 18:01:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232210AbhHHSBn (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 8 Aug 2021 14:01:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:33768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232209AbhHHSBg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 8 Aug 2021 14:01:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C4C8B60E97
        for <linux-usb@vger.kernel.org>; Sun,  8 Aug 2021 18:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628445677;
        bh=2eE0ATOoIaRTiEvX9TOa4w0dJWT2qrGT7TC9rxKgQKY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ueHVLjnb5MqSVAS+Jwr2uYWB2FZ8fjM1jMSe73anjDFV9uIkII2jK98Fq9abouNKT
         wBdhcAWO1/Dub0BIcVV5u+XGRJMGzy4NB/5uy8vFnQPN1jxT9o8Lhisugxqfqk1MXa
         UlwjldJpXKAobJpNB7i3npDwzcHbNyU2zaT9GwJd/g//Z+lhxaXoFIPVdXLE9TjfTn
         Xc7wvhH9V75IP5J79HhZthxkSZjaVMgdaJ0PtlhuIJwCoW/GtSfc99GrptVnvYT3+v
         AoYBQksf7wBCcewKur4IISH4+sfyhJCIV/PvQfHEgHR/5yIbdLds2BcjA0xgmPWUC+
         b7JrXHvUzGOyg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213967] Thinkpad T14 Chicony Webcam not recognized by kernel
Date:   Sun, 08 Aug 2021 18:01:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dev@horatiuion.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213967-208809-vg7ycQEtWm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213967-208809@https.bugzilla.kernel.org/>
References: <bug-213967-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213967

--- Comment #1 from Horatiu Ion (dev@horatiuion.com) ---
I've managed to get some more info:

On the non-working kernel versions, I get these messages during boot

```
[    7.292465] xhci_hcd 0000:06:00.0: xHCI Host Controller
[    7.292476] xhci_hcd 0000:06:00.0: new USB bus registered, assigned bus
number 2
[    7.292499] xhci_hcd 0000:06:00.0: Zeroing 64bit base registers, expecti=
ng
fault
[   17.324564] xhci_hcd 0000:06:00.0: can't setup: -110
[   17.324573] xhci_hcd 0000:06:00.0: USB bus 2 deregistered
[   17.324679] xhci_hcd 0000:06:00.0: init 0000:06:00.0 fail, -110
[   17.324697] xhci_hcd: probe of 0000:06:00.0 failed with error -110
```

From what I could gather, it is timing out while trying to communicate with=
 the
USB device

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
