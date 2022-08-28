Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B93EECAAD1
	for <linux-usb@archiver.kernel.org>; Sun, 28 Aug 2022 00:21:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbiH1AVW (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 27 Aug 2022 20:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbiH1AVV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 27 Aug 2022 20:21:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C97E5A196
        for <linux-usb@vger.kernel.org>; Sat, 27 Aug 2022 17:21:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8A21BB80917
        for <linux-usb@vger.kernel.org>; Sun, 28 Aug 2022 00:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44603C433D7
        for <linux-usb@vger.kernel.org>; Sun, 28 Aug 2022 00:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661646078;
        bh=228xN0VPI7M4thI/bXOygwd4jW4ynciiWSaMZhUTgDU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=nwyvOQVc/q+8Ui1zr0VkWrh1UdHMJOlxy2Umnjf/nyuDH2iJT5mlfQCxQ1q8KNTYQ
         +tiV/oAsHaLFCBZW0V8nfYak/0G0xGH4DRzQsBCukC2rUVdo1WDf5iPyoPpRt7nJsW
         JTtqW4pjopgyDGvATA9Ci5MCqGTns3/N1uFrv7gJhmJUWLovTkwC0XQbBO+XSc4yQ0
         BalF8dcrNmVp2VA84AQmNhOnKDOd94/ToNZx7j5LUT5iFeVIyNbK9Ve7ozKVxwGqrp
         MkZ87xyDNmla726nHvmievVDtPrHm9OHdkAf8Tz/bbwAH3Wm4/ct4Za7OhrdSyQwQk
         fEFFPEI2VL5HQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 25AD4C433E4; Sun, 28 Aug 2022 00:21:18 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216422] BUG: kernel NULL pointer dereference, address:
 0000000000000000
Date:   Sun, 28 Aug 2022 00:21:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ehaynes99@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216422-208809-FyU8iK6ZKU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216422-208809@https.bugzilla.kernel.org/>
References: <bug-216422-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216422

Eric Haynes (ehaynes99@protonmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ehaynes99@protonmail.com

--- Comment #2 from Eric Haynes (ehaynes99@protonmail.com) ---
I am also experiencing this. I'm not sure if modern docking stations are mo=
re
than just a USB C hub, but in case it matters, I have an external monitor a=
nd a
keyboard connected via USB C but do not own a docking station.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
