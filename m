Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64624C04FF3
	for <linux-usb@archiver.kernel.org>; Fri, 21 May 2021 21:57:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EE4C613F6
	for <linux-usb@archiver.kernel.org>; Fri, 21 May 2021 21:57:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbhEUV7T (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 21 May 2021 17:59:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:41756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229472AbhEUV7S (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 May 2021 17:59:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C8DF0613F4
        for <linux-usb@vger.kernel.org>; Fri, 21 May 2021 21:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621634274;
        bh=np++VuLt5v5Y6GVNPN4X867L0Af+9lRe51KKattrLoA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FuZ1KW5ZKRJ1sjVBhLhIuqhE4qhwIXWO6D8b2QSHGwOhcX9PPaij7qbcuZ1ddnO9Y
         ZoTIpmMtL9jcJ6u8tc+i/+g8mdNTOUIxT7sWStrCZg6WCsLw42TqyQRn4jwMxwlIBP
         KWx173EkYeoOUNbajEjqjR2oP0IpaJZeBSDc3U9SiciW9gnsUa00m13Qc98U2SXTJ2
         J8xt8bw5CSy2Asz7WCB2uAtmzRlRyvzBJwfQye2/ZUfQ2IXo2iYMJy0iMr/T0hnPIJ
         6ETUcwN1/NzbYogtZ48D7ZiPehPspS6oTQOkBmY3dwc/+pfC6vkBKnxShXOrDViHEq
         M4i5NtTBa6Z6w==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213169] IO error on devices connected with USB 3.0 ExpressCard
 adapter(ASMedia chip)
Date:   Fri, 21 May 2021 21:57:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213169-208809-nmSefjCXsk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213169-208809@https.bugzilla.kernel.org/>
References: <bug-213169-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213169

--- Comment #3 from Alan Stern (stern@rowland.harvard.edu) ---
Please check bug #213081; this may be the same problem.  Do the patches in =
that
bug report also fix your issue?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
