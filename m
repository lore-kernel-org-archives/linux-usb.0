Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4214C145B3F
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 12:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778156351; cv=none; b=MMXVDLiQiY/mVA0Veem/ur13EOolwYecR7NPqjdPObpDkXc7OHVuhdGJLlXJL6nsgZs837Ae7fW8Xh0JM0gjFpUGAVNVhO4JGZXdn09O5Ub8fIcHVKHW/rtqLi8298e9WMl0NDHzOt0VByPHSOnJ+26sJ5JMEMm2D3Fb6iLYSU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778156351; c=relaxed/simple;
	bh=ldW+IYpR9HwD/2YmkBSbYCmD5hDgyVK1fiTLqXdsEv0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WSb1r8XsleKoK3hG81Plv0co9nCIs+36g8eOOwDZQDuZh49R07AZ8dgQYlbtIIkbiFVHWKDbk256/c5nqABBk4TVA/A84ykeiv7+uidZ14RQKa8Vx0fryAvg0ArPYlc7YP23Qt/RcOGpnbIO7mCVzRKwDp33PffeT6fEqU4/DBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJBX2xEJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJBX2xEJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7B50C2BCB2
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 12:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778156350;
	bh=ldW+IYpR9HwD/2YmkBSbYCmD5hDgyVK1fiTLqXdsEv0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IJBX2xEJJG0+ddjaWcobwMotJ2fpM9Z7XnYEArYpTHzp0Njt5ik7VlQSj2U7BoKv3
	 Tz7LkXasFLkEaifZpNXaMGBbW9MZDBCmRHhTkVQjixCMkjWT3FvwmMke/4UlS4MpP6
	 YNBpJei0kGJClmHV2MKLKkwOpgSZEBvM2alT9JKpwzDBrbauVM5MTvhpjfsnNV/397
	 GveZGZy9DOZzw5kfV82Jcz8LWduy304X1ae6Wui339lRLN/GdnjEtRvtrvwAunJ2Kn
	 x9o2+E0RWjCS3rI3FbPQEpwwTBbCZz6zch+nTB+68he4SKffku5ZaqFRSC5a4IxCLI
	 7eSk0znLDG6qw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A7B87C4160E; Thu,  7 May 2026 12:19:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221422] xhci_hcd host controller dies on Intel NUC8i5BEH with
 USB audio interfaces (POD HD500X, Mbox 2)
Date: Thu, 07 May 2026 12:19:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hmoller@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-221422-208809-cEkXobzrFs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221422-208809@https.bugzilla.kernel.org/>
References: <bug-221422-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221422

hmoller@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #2 from hmoller@gmail.com ---
This issue has been solved on the software side. Could be closed now.
Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
