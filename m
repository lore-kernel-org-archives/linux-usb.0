Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B993DC4C4
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 10:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087691; cv=none; b=TCK/uYWBylLNEKzH473ynnq1XSLB9gEnspRK+A9mQqAm4pKhI9wUiNUco4oh+ucwl0ffVKSSSNtW9wm2tZNIanQwPO41+G1IbnPSm2UNhb5j2u6kP1hOFwsb+mHY664J/XzCvXjv9iPJwMFu8Kc8jA1do9W39pI/N0mDUeGnCKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087691; c=relaxed/simple;
	bh=2VMKMEQLSHcawFad0Gv4L9mqozGOy5dTcZdfvjMCsY0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=isyVEMVRyiQ+vVZo4gANbc2LVkVkA9DZ1INsKbX/wfvkK/4y/TIcrfbVeVJoBkojrny00RUdlrPWQmPPkg/20mvW8BEEsH0J62E8C6p1WOMkxp0j5f5B8QrqKjE6G+AKpw0UYDmvY+/YPp/827U6VT0V1QfqsJgaqj6Hyaa+ln4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RG83Jwyq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RG83Jwyq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBFC4C2BCB9
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 10:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781087690;
	bh=2VMKMEQLSHcawFad0Gv4L9mqozGOy5dTcZdfvjMCsY0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RG83JwyqBfV7JvMllakWwPsH5rIuZt1MSkBlr2dIX/6MM5HUpBG2TqWX8d33QE2ii
	 SeiX+FViJ3uiE0KpuUg6ZjFr9tshdHLdF/Rz4hdYXQ6dEie++x0t4U/+N+STclYMic
	 BBO+VArzLk9WfH0VwADFIM1HfW8Kq1yfx7Zm7byt2Eqca9kcvhAZSv/ZJGa/Vm8t7P
	 BYv0Bs9bswUtGD0FGGkVR547p/4BToY+GzBoCVf8HwwhcQzljhJ3KQfRGLYS2zVFBd
	 D0RPDrq1/0x8AN3RQ4Hy0POwxnYgMHlfwe1pvtSqJIc3jCBWs5knXcL33yqUSYqRb3
	 q9Cy4CBsRt8jQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D0E5DC41613; Wed, 10 Jun 2026 10:34:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221633] thunderbolt: hard system freeze from repeated DP tunnel
 activation failures (LG UltraFine 5K dual-tile + active TB3 cable, Meteor
 Lake-P)
Date: Wed, 10 Jun 2026 10:34:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: allan.petersen@vocast.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221633-208809-R3UlOOSefA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221633-208809@https.bugzilla.kernel.org/>
References: <bug-221633-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221633

--- Comment #4 from Allan Petersen (allan.petersen@vocast.com) ---
Created attachment 310294
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310294&action=3Dedit
lspci -nn: host TB4 controllers + display's Titan Ridge bridge/xHCI (working
session)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
