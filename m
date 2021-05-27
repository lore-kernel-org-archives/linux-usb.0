Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C119C4707F
	for <linux-usb@archiver.kernel.org>; Thu, 27 May 2021 12:54:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CED5610A8
	for <linux-usb@archiver.kernel.org>; Thu, 27 May 2021 12:54:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235676AbhE0M40 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 27 May 2021 08:56:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:34114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235623AbhE0M40 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 May 2021 08:56:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 47E1C610A8
        for <linux-usb@vger.kernel.org>; Thu, 27 May 2021 12:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622120093;
        bh=vx9dv63MP7OPgLpWv0W75XhjZCG4ACP0S1GHhvLLfSM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=M2h89T75tVFpVuIPLIchKrbnf2wtbGekjVvipOWW+HUhper2i4T91vxaICg+Vl8De
         /ov5Bq5zKJfaoBkh+3nCzWe3IPEwKcyI334Ru/JU99jmoadoEBpO4PoSDkIRtuZV7a
         GK1CSm7MUhO/RH7k5wnvTVbCZJiOMByHPj8SzwrWmwmBYXS7iO/zjFExKSESe9fKng
         KOcDY3zHurIkd6Ca3FWpBuQ0HMg8V49NOmICaiLBcPCenIa8h6J8PMRe24yoTyX2GX
         JHBFbkZcuBgXVpx1tccW+Xe+k+vmMyuddU+kyTUsmRURNZbUWXlkp1VLpYooD2vtQF
         zKaT4M5xebjag==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212751] acm_port_activate - usb_submit_urb(ctrl irq) failed
 after kernel update
Date:   Thu, 27 May 2021 12:54:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alex.wellmann@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212751-208809-e223hIAAZ6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212751-208809@https.bugzilla.kernel.org/>
References: <bug-212751-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212751

--- Comment #3 from alex.wellmann@gmail.com ---
Can confirm the issue on 5.11.0-17 as well (Ubuntu)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
