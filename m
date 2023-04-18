Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D2AC6FD18
	for <linux-usb@archiver.kernel.org>; Tue, 18 Apr 2023 19:25:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbjDRTZC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 18 Apr 2023 15:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232226AbjDRTYu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Apr 2023 15:24:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED6B1721
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 12:24:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 260AF62D4B
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 19:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8331DC4339B
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 19:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681845888;
        bh=WxJ/VLbInCBbKNdWNgcUYPYwyIAnc8CVOEKDfVyAspQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=d3nHWs7f88GDsJparWowhl8JI132297pbWJ/3Bc5a21hFC+qbLMfRQTjpBSb01rt1
         cLrrQ8/CcWIJdi9Vf0TtyMKp6BrNF1iajnhR7sljPsW7b7EsfKw98btgbuAcz5R6vs
         06JTaICbNfV/OduPBNQE6ueExoXAUTTXKce9bYDxPO4bClJxDeKJegSlykI4pKPvkX
         /aZCDjps6xyLgq7ea+mrxVoorB1isDyyntwTQKKiToSQzPHiYr8s1qS6G2WlkhW3c5
         IanYIBXoEWHQL3Cg9iPVVgC7qkk+gMBE6VL4qkoD+M39atiXZCN2DqhYkErw9M6xW0
         kbC/Kz+sHUN8Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 740DDC43143; Tue, 18 Apr 2023 19:24:48 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Tue, 18 Apr 2023 19:24:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: miller.hunterc@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217242-208809-RiA3jNG2PT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #22 from Hunter M (miller.hunterc@gmail.com) ---
Created attachment 304159
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304159&action=3Dedit
xhci debug

Kernel compiled and initial test performed. See debug logs from journalctl
attached.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
