Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EEBC4338F
	for <linux-usb@archiver.kernel.org>; Sun, 22 Aug 2021 23:32:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9FD96124E
	for <linux-usb@archiver.kernel.org>; Sun, 22 Aug 2021 23:32:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232498AbhHVXdM (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 22 Aug 2021 19:33:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:54050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229969AbhHVXdM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 22 Aug 2021 19:33:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4F92B61262
        for <linux-usb@vger.kernel.org>; Sun, 22 Aug 2021 23:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629675150;
        bh=fRH33a3MfnPbHwLePUQuUAdKabesSd3rc7nJ2i3HVzA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=X5ogIUr6ofXcP7wFArTXV/bghpDFJEaqXAh+Wi3lCBGQp1+T9QxLUNrD9doIe5Xz0
         FsV2XtllVmncHwbwP1EsKeSd6uwOXmqnxt+qU6Ea/vVsFc5WlgfMslp9FGxkOYfTcX
         pZpnzLvmYod8mm76Ztz25DpFfJ41iYyaehCpfzHui2g6J8lm2emA3wDBngGAi7hb7y
         c0cfhI4e57Iam1xuHlKC0P6XopA1iua+EuYxDjR7Txrk8rR/cMsNhcLCDWsfeyw2Ki
         2oUqzYqHGvBUR3wRYH5VXTXhUnC05ZDZSTUaBkLwHcQYubHoPXHayYFhx6RPc3YyKX
         Ve5A9FpfE8BCw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214131] ch341 communication problem
Date:   Sun, 22 Aug 2021 23:32:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel_bugzilla@entropy-collector.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214131-208809-I9Jw26PSwK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214131-208809@https.bugzilla.kernel.org/>
References: <bug-214131-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214131

loqs (kernel_bugzilla@entropy-collector.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kernel_bugzilla@entropy-col
                   |                            |lector.net

--- Comment #1 from loqs (kernel_bugzilla@entropy-collector.net) ---
What if you revert 3c18e9baee0ef97510dcda78c82285f52626764b
which was back-ported to 5.10-58 and 5.13.10?

I believe it is the same bug as discussed here
https://bugs.archlinux.org/task/71830

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
