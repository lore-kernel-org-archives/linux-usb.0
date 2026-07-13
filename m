Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0418D357D1A
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 19:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783972592; cv=none; b=BKLO6WpdBk2H8Zk/+8VTnx34SCzTNpWNZwwjwaiLDbKWqiHUiPDe8uNEa9hoVls8Q6pP93IHe7JtFw1KvlVKYnmoNBUzbxxBbYG3xSdTShajIEdgsPs6iD+2Tnbi15LU7HqDUuRYQaTWmSF3nqrmbNS0W52gMoIZuBjoEVdzMYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783972592; c=relaxed/simple;
	bh=c/dBWgmrEC3WcNfpCn24Oob6QQxEsizV4jE0LPSWzFI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sYQGTCU00lUSaZP/f0lwiJNGujGZDuHoX3sLeV5OZSwNKI2IjE+iHHxdM2hGO0p0wp/N2XEI8YY2XLOG4Qy1i4KvCpYZSosECTt/EncAJdO9zy7O3zmsEDZgW2Ja9P2++8wjuwS2TV07AH8t2TedEqmFW35Ur+BwoumRZeWnbuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Upi1rWVz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Upi1rWVz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98C73C2BCF7
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 19:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783972591;
	bh=c/dBWgmrEC3WcNfpCn24Oob6QQxEsizV4jE0LPSWzFI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Upi1rWVzLFH6GF8/1WrS1AMxtJ/HC6FSNyl1KoXiDHvQFicm9k1osPgYBlT+cb7MP
	 KXkzjnMd/HtMpXZsd3E5eHKHjdOAgxKQd6YaaLGt3Thl0zjaT3L2drRlXHBzpkLmXy
	 dvYkNT6DRML/FVHUCiDfbd9W9Lkjso6gFr8G5GiLOtrUfe2OdvY4MIqLIn56hWxhv9
	 9URKiosSNxnVyIUQO4kXCTAqWn67BkmmdQtD31vk/tLh2YL7usAQxjecQop6EJL27w
	 1tjEP+9S8C6Rayk2VV9A0HotAp0cqHRz54juOL6WeLMzZuGeGESDZQ872H+a4gpaeq
	 3lBehABISZs1A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 874A2C41612; Mon, 13 Jul 2026 19:56:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Mon, 13 Jul 2026 19:56:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-221073-208809-Mp8smhOBmQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221073-208809@https.bugzilla.kernel.org/>
References: <bug-221073-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #310446|0                           |1
        is obsolete|                            |

--- Comment #59 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Created attachment 310447
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310447&action=3Dedit
possible patch for device link (v4)

OK, here is a version with it moved deeper into amdgpu code to only apply to
these systems.
Moving it here lets us potentially gate it on a firmware version in case the
firmware was adjusted to fix this race.

I have also submitted the workaround for review upstream.

https://lore.kernel.org/amd-gfx/20260713195313.1739762-1-mario.limonciello@=
amd.com/

NOTE: This is slightly different than what I'm attaching to this ticket.=20=
=20
* The one attached to this ticket is against 7.2-rc3.
* The one I'm submitting upstream is against amd-staging-drm-next, which is
standard practice for upstream submissions.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
