Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FD3C43334
	for <linux-usb@archiver.kernel.org>; Fri,  3 Jun 2022 13:45:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241622AbiFCNpT (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 3 Jun 2022 09:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239454AbiFCNpS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jun 2022 09:45:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F3C3F6E
        for <linux-usb@vger.kernel.org>; Fri,  3 Jun 2022 06:45:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 164A1B8233C
        for <linux-usb@vger.kernel.org>; Fri,  3 Jun 2022 13:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7690C385B8
        for <linux-usb@vger.kernel.org>; Fri,  3 Jun 2022 13:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654263914;
        bh=fg00axE7VkFXGJRhFRy1L4dzK82NJpj8zebYYpQ0PZs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=tzdQvyYOoZ2CD73/3EU49GiZS0vt6XrYjfZgdK7PzuHQv8YoOrpakayhjDNrrMeER
         XZ/cG/WvPxqxGztA35tE2WmrhT707VGFsiZRiCIEQyFsUTvUJXGAJvY9TDwFEVDfhb
         1tjo5dhno8ZaRxYkHHcTNq5B4wid8EbDH1wh7EHNcs6Jk8yJb6lwoyy9yXYyMG4wFe
         tawLtnHum3QiyvwFh3uix9tKDtyDJXgNjWnNjOSJ4FZ4oWIK7nIbGmE8V1jqNw6vI+
         6UxOkXTiu8NANX3QUOV66DNj9FxEQsPl3a3dwaVtsPof0pQmfkbFMZyNAoePm+32X8
         7KQlqizSOAyhg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C4FF5CAC6E2; Fri,  3 Jun 2022 13:45:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Fri, 03 Jun 2022 13:45:14 +0000
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
Message-ID: <bug-215890-208809-6C647UyTaI@https.bugzilla.kernel.org/>
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
         Resolution|OBSOLETE                    |---

--- Comment #23 from Satadru Pramanik (satadru@umich.edu) ---
Building 5.18.1, this issue is rearing its ugly head again.

Mathias Nyman could we get that patch added to the driver please?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
