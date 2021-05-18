Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB8CC433B4
	for <linux-usb@archiver.kernel.org>; Tue, 18 May 2021 19:48:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FBAB6124C
	for <linux-usb@archiver.kernel.org>; Tue, 18 May 2021 19:48:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351952AbhERTtv (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 18 May 2021 15:49:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:46608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240654AbhERTtv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 May 2021 15:49:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id EC2A461285
        for <linux-usb@vger.kernel.org>; Tue, 18 May 2021 19:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621367313;
        bh=MpzkHjOinyqqR/gRxmTAYCV1Js1Edxi/06einUkGf1g=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=iTLPPqq9rIhgE7Q/riTKNyQrYkZ7bbNnmIV9WTLaiAhGe7Wcb9BX2CgRShDB8+6XS
         nPtC+2wUiRLphuCPmvfuen+dFCGN4I6AMQnqfk8PDqyY2nTvQ03cgtZAY/Iepjp19c
         2Miyg53io4Gk2k/2QTeir2DFe/DeQDvMMJsEH+hsAe/mYXWNpYW/YXvlGXzXVgK4up
         p9QXOz5TzllALClvhkADlgmbEhWXrf3x7tgCSBgK7YUa048FvcyCcmBMRSkcsNblzq
         S1/chdpocmZ4VrRh16KYivSaCre7EXRDmZaT6YXSsC90LmywE7j4Nfuof157n1ywEw
         GJafnK3mnML+g==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Tue, 18 May 2021 19:48:32 +0000
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
Message-ID: <bug-213081-208809-jRN5gdCSFp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213081-208809@https.bugzilla.kernel.org/>
References: <bug-213081-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213081

--- Comment #14 from Alan Stern (stern@rowland.harvard.edu) ---
Okay, good.  This is now something for Mathias to look into.  He'll have to
take over the analysis from this point.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
