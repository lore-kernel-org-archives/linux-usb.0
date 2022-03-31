Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D530DC433F5
	for <linux-usb@archiver.kernel.org>; Thu, 31 Mar 2022 06:52:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231401AbiCaGyk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 31 Mar 2022 02:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbiCaGyj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 31 Mar 2022 02:54:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 300F645798
        for <linux-usb@vger.kernel.org>; Wed, 30 Mar 2022 23:52:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B607961715
        for <linux-usb@vger.kernel.org>; Thu, 31 Mar 2022 06:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23911C340F2
        for <linux-usb@vger.kernel.org>; Thu, 31 Mar 2022 06:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648709571;
        bh=Vp6ZMBPj/OMI9FddZXFHn72j70xy9JXiG5QjLGjoySc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=tWeIfRwUGYKKgyYTzJwH5gg3+wZPdpfe6A2ApnJZz9hj4Vj8nQRhmxCWCfcC2Yk1w
         8uwkqPHp3OiknXJvzPWvNsG4FwuunX8XMzgP2HusEiIGvFSIx8zAhKHpbAIOxQtE3q
         KYWepUA55JhAvMe1AH8/YqTS9AjjDNNP9MKOCGjLByqmGYI990irAZND3xXIc6McSh
         UeNf7v8EmySAcdLcBMLx+TxHMbGrXwy21O10UQNzaLHJRBtPebQ0aozQEKznwPJVcL
         VD5COtksNaLzdeOkSYD1VRyEXu+DWxJqaj4RRl39xHDCczBM/QpKb72JE1L67k467x
         R8GBAKe01u+7w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D9F28C05FD5; Thu, 31 Mar 2022 06:52:50 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date:   Thu, 31 Mar 2022 06:52:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215740-208809-0TrFDa2vZh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #1 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
Am I right in assuming this didn't happen on earlier Linux versions like 5.=
16?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
