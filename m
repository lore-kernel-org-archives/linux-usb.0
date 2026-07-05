Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A891D36B044
	for <linux-usb@vger.kernel.org>; Sun,  5 Jul 2026 10:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783246309; cv=none; b=hOAVP9d+so1nopLyzcXPUOVdpgWUZRaT1yaim85YWmG1TEgYyLo9olr2ovpneHJtF/lvHysNc95UNR5husX3lk8EMvxnJ226o5pHiwvyzRQIUW/3t8DXg2iJ9S2IuLzr5/9x/uiqlaiy5WCx5H0fqqN9M+9PUbMCvxYCJYmRNfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783246309; c=relaxed/simple;
	bh=HgQBLMYlETgEts4XuKc3uT48Of1lWTJacp4ZvSc5w/s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zl3PvmcPGzD9XO3AXyXBYAz30ei5JuPNoQqRjZMIRlayqBVsUdmM9oGadDLMQl9jH7i7ddMOyPj8Tx9iCyn2YlZMBKc12Q1hjvA1y2+ngykcPqnkUkv8K4NyQl8jh6CC6xqkR6UtgWMmBq4SXfdihs4uRjd5WoJ12nzlYuyafCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lDjK33Ep; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lDjK33Ep"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49502C2BCF5
	for <linux-usb@vger.kernel.org>; Sun,  5 Jul 2026 10:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783246309;
	bh=HgQBLMYlETgEts4XuKc3uT48Of1lWTJacp4ZvSc5w/s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lDjK33Epm5g9CPxmHCO56zn3vol5I5fAgBaGdfqH16rOFeOKGzCsarvJ+utrNrbfk
	 T77G3lQfozuX94JZ9CWOf6zCRYb80haVbMQEG2Dy2qGeFnfNne2IE64HlAxVKH+w5q
	 rjvspx4HZBO5DjVTmow0JZVEWiVFFqre+um7Uj+0082mWnKdrUxR62CT7T2szQJQln
	 ROupKIy1caWu/s8JfpS8rVwkC+47UYJY2kNZpG5jYNETN1wwLkFIWCcZerCmGszJBE
	 bicua6q5mh0qRa04RIYQSGo99MI5olGMKIK3/xQJ9xk1cG3VzxdJRqW4Tr4oPhHbpo
	 p8hb3mRwwugvQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 38287C433E1; Sun,  5 Jul 2026 10:11:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221721] prom21-xhci does not allow to use USB keyboard in
 plymouth
Date: Sun, 05 Jul 2026 10:11:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221721-208809-FsCoRD2Cv0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221721-208809@https.bugzilla.kernel.org/>
References: <bug-221721-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221721

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Jihong Min is not on this bug tracker.

Please send to LKML and CC them.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
