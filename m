Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26F73A4505
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 08:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790669971; cv=none; b=u1+B/EsLUa2HslA/Af2+jSbq0mlv7CCvJzJPdM4APIE6+qZh03g6QhmVk6epZH1Su5qe3bYYRZ7iSi1XvBKCKruMhpCuIklRj/fmc+3LEED6ncXbTNS1QQcO8ZT+66JWk926i9vEWlFAJDj0Y1o+PidKLOncYgrR/wtTwUvLs7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790669971; c=relaxed/simple;
	bh=fS4N8nPZxa8/bwe/GYUMeelNMO9vfJHdyPwNVbhmkZQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bM2I45AV8JhJE3QO2oOUU4tUqSSLmCZjuNWpbpyfqBaNCi2w69CYRhjF9a6SBLC39ckfIILLmiFu9BtWCF5S4RzRbNjBJAGUw34S6NlUbkNTpc0xPX9cYShcNqIV6TNjhfp1/Xk0dIZa+dh1onOimYa3WpwQ6K1LG04rmrg/p1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKJp5YHX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKJp5YHX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A7ECC2BCF6
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 08:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790669971;
	bh=fS4N8nPZxa8/bwe/GYUMeelNMO9vfJHdyPwNVbhmkZQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KKJp5YHXQS6d3WQbKBOCFarZdmoCuYhN07DsZlcwYa6joK2ANqL2n+beW15MYoXNu
	 q+rfKRn+UFxmeIxYwvUXRIQ5RDicEd5MVTrCwRmPpwCQCkzJbFk17Rqses8uWyrLsr
	 +YtcBPkr4oaaF9Hs8ee21JcQoPHlJojUgANSXSXjfJj7ZjwjuXoLE7t0iaoyeXusvy
	 WjMf55WZvvBfVr/5h0430dF9vx99wTk0VPvezZs/nYirQFIO7/yxP/3W09eYI0Xgdt
	 1Fzq7jRpW8Rp6vGnWyn4mGlZlllk8yCltoC1tlcLubH5Qn1cJSGv80VPSQkaW42Plg
	 ETwJ8fxAkHktA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 72625C41614; Tue, 29 Sep 2026 08:19:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222071] [Bisected] [Regression] xhci_hcd: Resuming from
 hibernation fails with "Not enough host resources"
Date: Tue, 29 Sep 2026 08:19:31 +0000
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
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-222071-208809-bt38hb3Kac@https.bugzilla.kernel.org/>
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

Harald Judt (h.judt@gmx.at) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |h.judt@gmx.at

--- Comment #1 from Harald Judt (h.judt@gmx.at) ---
Created attachment 310956
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310956&action=3Dedit
dmesg-7.1.1.bz2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
