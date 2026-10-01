Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9313AFB13
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 23:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790897371; cv=none; b=H6T985o+qaj9+1P2kNcLw4GRvn5/ddlnWQglPFu2gpXV/qc3/D0oYcfbuj4t09BhFHI1AiJ9tVT9kJ48AJnBJDIjE2hdwdYarhoPjGtpKzRAaPjfX4DQ/IpZ4HgmX+nUCVpgBqCgR9HraxNlT8orwGzpEQQK4cN83VNSeOQVfcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790897371; c=relaxed/simple;
	bh=+69R0X22rs5gzCAP35zbLeWPs1yt5ijdwvLJRji/jjA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sYLHmmTx8p/viCCCIdBU6eSALw8WuIompTWz06/oyc58GUSxNaq+rFt1AipC+lsfavJ+RyKB/a13gsYHxW3ui5/4l9CiUz1MFcoa4ptshv6ONLAi1q7eXjAdksnj9WvMPXESzAn1u7sexyDRBhxwNOMaHKL/1wluJEBtG9C8P8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qWfzxXiS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qWfzxXiS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A18E7C4AF13
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 23:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790897370;
	bh=+69R0X22rs5gzCAP35zbLeWPs1yt5ijdwvLJRji/jjA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qWfzxXiSC85U2RuoHoOj+iXYxry8sTWKoAtxFI1iua2/fXAcQRUXnUD/trKz+Ioig
	 DgDNRS7KLGmuWVK+J99fg6MBlU54bRfdRe6I8dmnYVffUvrokgkgUW21GnXWff2A7J
	 V/oP+z1G/gtOXKk9v0zFt1dgCP5a8UB4ZDF+mRaRJ6dNQ1bHdYk1XBPriaZDoN6Zcc
	 SK5/yr6mPHrmDWqHI29m4ZbA2aSn0pxJ3qxgvMVJxq6HjYqOyRnAMvjdfbDsNvkw+r
	 c/l6Vl0xV/ViWhLpRAel5s97Ax01L63iNsRPxgJ4G8UsnsECGo198IWWdldPCrsDFY
	 lZ2+QXQF5XjFw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 84C3AC4160E; Thu,  1 Oct 2026 23:29:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222071] [Bisected] [Regression] xhci_hcd: Resuming from
 hibernation fails with "Not enough host resources"
Date: Thu, 01 Oct 2026 23:29:30 +0000
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
Message-ID: <bug-222071-208809-TuxhVog0mK@https.bugzilla.kernel.org/>
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

--- Comment #12 from Harald Judt (h.judt@gmx.at) ---
Thanks, with this test patch applied, 7 hibernate/resume cycles in a row ha=
ve
been successful.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
