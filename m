Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3613C433DB
	for <linux-usb@archiver.kernel.org>; Fri,  5 Mar 2021 09:30:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B37D264FE1
	for <linux-usb@archiver.kernel.org>; Fri,  5 Mar 2021 09:30:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhCEJa0 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 5 Mar 2021 04:30:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:38580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229494AbhCEJaQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Mar 2021 04:30:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 3260E64F53
        for <linux-usb@vger.kernel.org>; Fri,  5 Mar 2021 09:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614936616;
        bh=f7DvF+Pr9QWPnXCL9TORwgNs7EEC8qOb95s7zBsmi0Q=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FknOgsOiE2Z5/AgoRlOabGRUt7NQpOpjvqGzXu4S0kCQtG3o20Y/lMqvDJnbqXEFq
         jyoEU04hUxIbGXuc8lhyshF4H/WLDj9vOGAgGyJ2o8k811HS8HbhhA6FBLlx1M+Eml
         4bmK9jiJ1CEfjJLkMvZWmUBH/0Fi62SJR/CEjG5/7LHUNtEwFQ84n2gNNBDDda5tJa
         tSYFcEsomM/FLQclvrc1OxMyVnI4Q+/lJxSCcyXGoQ9eBaS0Krvlm7PcB/X0O1xKQ5
         c9Q5vulpXXAtr2ESYC3vmgE86h5Y5diQ1pOTggB2tnB4Q9oJS1QaM1JBmHGLAPqJ+a
         JHTYx7JWtQX9A==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212045] dwc2 gadget mode read call blocks
Date:   Fri, 05 Mar 2021 09:30:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Minas.Harutyunyan@synopsys.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212045-208809-e4wS8Cbq6K@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212045-208809@https.bugzilla.kernel.org/>
References: <bug-212045-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212045

Minas Harutyunyan (Minas.Harutyunyan@synopsys.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |Minas.Harutyunyan@synopsys.
                   |                            |com

--- Comment #4 from Minas Harutyunyan (Minas.Harutyunyan@synopsys.com) ---
According to dmesg, you use follow EP's: ep0in, ep0out, ep1in and ep1out. W=
hy
you refer to not used ep2?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
