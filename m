Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A713D5661
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 18:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707583; cv=none; b=MsKuqnu2IsP0x6b3jZ5c2xrxaKh7ogZb40N5DgC3l0Il7cpxoYy1qiTufAaBunEvDmvA8hXjtCW2Y/ewmg/gk59/o9LW7Ev+rFYNNEifPzV+538qArXZwlAZS7D5ZJo4SrIGoSCzK/LFOt/6L0+VLWXT0E9myRZZnwCs4sWwL9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707583; c=relaxed/simple;
	bh=nOVP74RbqXc1MHHyhrttvw+t5JnTiOmId6lebAgieNQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ABQm25Zxj1ENXr9e4Zio+P/cgQH3Ecigmkba7+PtNOHWtUqVhUwVmflOuDYpMGtQLsy2Imf8Bc0tc/0yaZfc/HEbTIFR37NlaYSbe2HODW2ShaDkt2nohF5zVwnWm+hVPWlmQwMu9CVP04bogqWhuGgY3lMExe8Zxhz5/42K0fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tv/ASudB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tv/ASudB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D8AFC4AF12
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 18:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790707582;
	bh=nOVP74RbqXc1MHHyhrttvw+t5JnTiOmId6lebAgieNQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tv/ASudBdQez9a4ho7l9ZfnwTR9u3cU1SxwHF+FxbYFKvLTYohU7HloYxjkrAh+P6
	 FBu0V/YPlgnSXEZN0b3pGNibMmGyavg5t+zruT9iIP5N7ZxMaliv6EJjk+vi0kcuPV
	 jxgSmlNGCdLLb51NcyutAMXSrsm0ZLVMC7zGQQtA3jRJLb9RewV7rMKqaM+6zjiWPJ
	 WL6dCbcRLy1znfQT7dchbrHZITd8U0kUyJaikCGdee1l0PcZxtbtim7DMn48jGb6No
	 JYlQaCTY0cCGlxXShUpfAEWPnAhX1sUWGV1iEFjs8qPyXF2eN2biCrcbwGYTAjR8QF
	 L/sRnU+SAufLw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 81606C433E1; Tue, 29 Sep 2026 18:46:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222071] [Bisected] [Regression] xhci_hcd: Resuming from
 hibernation fails with "Not enough host resources"
Date: Tue, 29 Sep 2026 18:46:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222071-208809-zQ84J9JKJq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222071-208809@https.bugzilla.kernel.org/>
References: <bug-222071-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222071

--- Comment #6 from Harald Judt (h.judt@gmx.at) ---
I also wonder why I do not see this on my 3 other systems. Could it be rela=
ted
to the USB hub attached to this machine?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
