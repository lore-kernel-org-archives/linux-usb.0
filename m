Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E1FFEB64DA
	for <linux-usb@archiver.kernel.org>; Sun, 16 Jul 2023 09:17:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbjGPJR6 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 16 Jul 2023 05:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjGPJRz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Jul 2023 05:17:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5CB4B9
        for <linux-usb@vger.kernel.org>; Sun, 16 Jul 2023 02:17:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8273960959
        for <linux-usb@vger.kernel.org>; Sun, 16 Jul 2023 09:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D98A8C433C8
        for <linux-usb@vger.kernel.org>; Sun, 16 Jul 2023 09:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689499073;
        bh=6Sl3K8el5q5Pq0wcKnYSCz4rfUbX0tligjKsJOaz+mI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=crUdvKmHSi2q7HsTFMBzkhMpMTkbZbmYjTmAGw0EYkeahgQafXOOOkLFYPVSroFx3
         VjI1uZy2d3WmVF+HDfZcP14DnuO1IiGT/6PXYSqqMfqhZrruAJ67IjABO4ibJybu9n
         pMFooEimE2weM8QE3iwzjW6UhNSenLK6ygLFmx4x4aClpDRIKO5H5y/d/rxILF2yqV
         Wfn95b4LHAd4DjNnyqBbJ7SvADYwk2RxbXOSoVodP+bPQpjAUBt8/eLtmMFyjXmide
         KClGNCM7O87B6Wtr8ZL128/Uip8M52SdRDxt5+AFv7mLj6U0X/p2Ifq786n/16QR/1
         y8w9UrU+DbyHA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BCAC0C4332E; Sun, 16 Jul 2023 09:17:53 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217674] Thunderbolt dock does not recognize displays connected
 via DP->HDMI cable
Date:   Sun, 16 Jul 2023 09:17:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: planetmarshalluk@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217674-208809-2g1vRsbTI8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217674-208809@https.bugzilla.kernel.org/>
References: <bug-217674-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217674

--- Comment #1 from Andew Marshall (planetmarshalluk@gmail.com) ---
Created attachment 304642
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304642&action=3Dedit
journalctl --dmesg output

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
