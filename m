Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022D8C6FA8E
	for <linux-usb@archiver.kernel.org>; Tue, 20 Sep 2022 09:22:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbiITJWH (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 20 Sep 2022 05:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231322AbiITJWE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Sep 2022 05:22:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE020647FE
        for <linux-usb@vger.kernel.org>; Tue, 20 Sep 2022 02:22:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9F76162206
        for <linux-usb@vger.kernel.org>; Tue, 20 Sep 2022 09:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07D8EC4347C
        for <linux-usb@vger.kernel.org>; Tue, 20 Sep 2022 09:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663665723;
        bh=U2eQfPoqH4WEmziFLbkFNqpv0Kb9UcJzNbpbhQ5C1Rs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=F3SU3gmvdui624B7cB+PZMEV+e9xSYx10TzttVsXtX34+YhnVCCOmNceQFvDBcuJe
         +1y02xYYkNdzEsQQTOH+X3f7j/JKMtUYFy7z0jqyHQQefxtKpbPQ4KZx1wawp0S8QK
         sZXC/deRSssizuVFGzU0ac5LicnX5K9jEm98123LuZDMwbqitHmBZR4krRB1igZS2z
         aUyckPflLEgwf/dH3iPHxyomZZ2MW1s4LJfBp/mfGKNvFgtI5PNGTk5J9Ci/q52xmw
         FZTCT8U+YAKUxYxvd32RmtY2h9YQ/UPoycGrpHYMy7jnbH+GLWst0qaWOP5zoUM44/
         L3vDDreUNOQzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D54E4C433E7; Tue, 20 Sep 2022 09:22:02 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216497] USB connections through thunderbolt dock broken
Date:   Tue, 20 Sep 2022 09:22:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jonas.lindmark@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216497-208809-UpDyVdbv45@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216497-208809@https.bugzilla.kernel.org/>
References: <bug-216497-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216497

Jonas (jonas.lindmark@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jonas.lindmark@gmail.com

--- Comment #8 from Jonas (jonas.lindmark@gmail.com) ---
I also had issues with my usb-c dock.

Error while assigning device slot ID. Max number of devices this xHCI host
supports is 64.

Downgrading to 5.19.8.arch1-1 fixed my issues.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
