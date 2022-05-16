Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60927C433F5
	for <linux-usb@archiver.kernel.org>; Mon, 16 May 2022 11:39:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243260AbiEPLj4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 16 May 2022 07:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236194AbiEPLjz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 May 2022 07:39:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 580AADF55
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 04:39:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 14029B810D8
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 11:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8186C34115
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 11:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652701191;
        bh=EpTFKjeOKGw3OcF7V0zYGBKlV1YDjRRF7edKkm7TQ5w=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=C8cWGZda/zVTcQKaQm0tY/ueicxi0jyn2bpLXjm2rQEV918DJ7Bfvg1qUUuqLucvI
         /B9uLD5RSuuKSq++GfiOKc6CtABVhEmvkwhx0FfnCSJGDBFoi0XALCiNTTbwz7POp2
         iKfuwkCk737gFoR4uhParfTdGDfyJyA2B6bERuGyExHoMY+TaCSHr97hD5C9az6Eqt
         +TF8cjDND8Tg5UgYfZXDKvfryzWbdCj6wjbnVmAIyIj1ypoF2JnsMV+2swemadYrPw
         V9hz+MKH3lhwHhzw9vhZZ57yfsvVeeX8I9nAMKcu79I9Y8VBtka37V90bqzAESVg3i
         PODXVJsIosROA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 96740C05FD2; Mon, 16 May 2022 11:39:51 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Mon, 16 May 2022 11:39:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: satadru@umich.edu
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215890-208809-TaBrz5NQfC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215890-208809@https.bugzilla.kernel.org/>
References: <bug-215890-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215890

Satadru Pramanik (satadru@umich.edu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|CODE_FIX                    |---

--- Comment #18 from Satadru Pramanik (satadru@umich.edu) ---
I just tested the Ubuntu mainline build... Maybe I accidentally used the ol=
der
fixed kernel I built. The fix should definitely land to fix this properly.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
