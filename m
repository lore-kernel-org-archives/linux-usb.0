Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 268C8C04FDF
	for <linux-usb@archiver.kernel.org>; Thu, 27 Jul 2023 12:18:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233421AbjG0MSM (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 27 Jul 2023 08:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233804AbjG0MR7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jul 2023 08:17:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8711B2D49
        for <linux-usb@vger.kernel.org>; Thu, 27 Jul 2023 05:17:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1B48361E52
        for <linux-usb@vger.kernel.org>; Thu, 27 Jul 2023 12:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B148C433C7
        for <linux-usb@vger.kernel.org>; Thu, 27 Jul 2023 12:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690460277;
        bh=sBJLUQs5o+MEJznWaXonF3ncaZmaly991/YgyL+IYv8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jSIePvj47Hy4aI8bo8K0ZxZDEyoddFWHPZeGnk6BOxtMdNhufF6n8OogKrwEHbDk8
         MgT70zzcf23WNYWPz9XCh3vJR9zXYvxS5d985kCqH4DcWVCGdwQxXtnHOZhhskcEqL
         x7fewW7wpbdJ0om8BtNEl6KEv67jf5wtKeZKIJYzoTPr5H7iBTD9ylUQn0fd9hS3PF
         2BImmsofrYc5xAvG+1cvcPARuCtY68tSTsCepb/DZnfYHvbysMTY8JHR+V2yaQmH1x
         qFN3RwL8l59zQewBCjvjNU/dXld3LiGWvHwKcj5MV+9uMbogmuWNDMtUsWtMmoS/Kx
         LtwBrzevNeJ7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5AC50C4332E; Thu, 27 Jul 2023 12:17:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217715] USB from Thunderbolt 2 dock disconnects (xHCI host not
 responding)
Date:   Thu, 27 Jul 2023 12:17:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: youp1one1@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217715-208809-wjTeFbgFGb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217715-208809@https.bugzilla.kernel.org/>
References: <bug-217715-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217715

--- Comment #2 from youp1one1@gmail.com ---
Created attachment 304707
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304707&action=3Dedit
lscpi output

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
