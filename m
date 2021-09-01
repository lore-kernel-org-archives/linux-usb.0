Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6A0C432BE
	for <linux-usb@archiver.kernel.org>; Wed,  1 Sep 2021 13:50:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 630146108B
	for <linux-usb@archiver.kernel.org>; Wed,  1 Sep 2021 13:50:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243518AbhIANu6 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 1 Sep 2021 09:50:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:44848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229975AbhIANu6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 09:50:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 40C7961057
        for <linux-usb@vger.kernel.org>; Wed,  1 Sep 2021 13:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630504201;
        bh=f4VxN43/hsCBUYNchs4nuHXh67fylYbs5xHU7dHctQY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=i4IjsMNnLDyMy5h8xyTdeW8NBeMfSo/Ks89SDIQr3D3hKcEi3guBXspZxDsJkBJXP
         vGqm4oSi1lP/ERO7qU/41vBUkGnYuvtbNOVKRv6qtIakUHoTRpO4iy50BGYQhrVQv6
         rxs04oR6/yzj8qaZQ5VJlnCyQzwFJRgkuQv2dI8byISf7RxJOb2y8qvbxHx/ua7pI5
         6gbPFDNYmgbrDsATd5F5EtiefSOhRlIi8pUEF9wU536DqdNdifE4hIE6EQGkNyoI4p
         lTThSPtua3SHdfUQFDTRgvnBOCTKp6AGtDBSTFfWA99qj+JwRsQf2nhOHAGgfAwQmb
         afHRrOpjfDBVg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Wed, 01 Sep 2021 13:50:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214259-208809-dWKKeLtvdp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

--- Comment #7 from wse@tuxedocomputers.com ---
These logs are all for kernel 5.14-rc7

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
