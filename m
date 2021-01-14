Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FECC433DB
	for <linux-usb@archiver.kernel.org>; Thu, 14 Jan 2021 17:07:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D4C923B1C
	for <linux-usb@archiver.kernel.org>; Thu, 14 Jan 2021 17:07:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbhANRHZ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 14 Jan 2021 12:07:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:54476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725961AbhANRHZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 Jan 2021 12:07:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 95F8B23B44
        for <linux-usb@vger.kernel.org>; Thu, 14 Jan 2021 17:06:42 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210777] pwc driver doesn't work anymore
Date:   Thu, 14 Jan 2021 17:06:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: harald@a-little-linux-box.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-210777-208809-bt6iw413HY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210777-208809@https.bugzilla.kernel.org/>
References: <bug-210777-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210777

--- Comment #7 from Harald Jenny (harald@a-little-linux-box.at) ---
Created attachment 294633
  --> https://bugzilla.kernel.org/attachment.cgi?id=294633&action=edit
patch for pwc courtesy of Matwey V. Kornilov

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
