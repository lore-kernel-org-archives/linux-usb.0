Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D443DD501
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 23:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777938868; cv=none; b=jCRaaewsEW8vRXuJ6hvATybsAFcbBAIP0YxoHWLgmCJC4kK+z7bkMkGuSGGbAIt/zJNO/I+2FHAz0j0SGHH5C0RMd8g/YZ1PXMIHCsjSEVDqAfUc73BzArjlONOBZ+LUHkUPyH9WWKhs7UwomuQkhw4A3oD0pkn5i8PkjLUeX2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777938868; c=relaxed/simple;
	bh=JTNU6YLjZMTEpFkkdTyLSvZGQsgAk900ylnpBwcf1KU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BCr9xrTbZ/McFYCh8YnwENn3tuEi1m/9boPdlRRs54LsdM4TXQpBH5YgICKLTbNopFYxR21Bn2iS+kD52Q+ZIcjdFkSzRZFaZPLjsx6jc4bWWYi6pxNRQm8B+Dza9i5q6Fd0tdYQMefNcSLDQMqOkHKPgwZfhQXeCdcaAW2hYIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t3L+Vwb2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t3L+Vwb2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50A63C2BCFA
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 23:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777938868;
	bh=JTNU6YLjZMTEpFkkdTyLSvZGQsgAk900ylnpBwcf1KU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=t3L+Vwb23Hl1Ufgu58qiKrAOGCOfBb0yqZ1Wp+zG8BfQyWBY+XIAkWLT4RCVDNShh
	 4pu0Rj0JXKuc2seNVGKLXPDceYuSKIkDTgV93x8/yoysx0pWED8X/qON3ghJ/XfdCq
	 hQOtr0iqatikGFX3IFp1BCFGvsdpreYF6rD4jn3/XXsdlX7M8TcjJTQgVT7Q6y7KYu
	 iBTJT882i80GZF83GnDbu2gFinRyw2VXBHM35bDtjXlLGp7J2XpiOQtJUJWBw/6mIO
	 4cQI4nfUPtlP66aeVCodjjdKjZsUpqPeTdzHFDMUH+SRD203qW0rsNQnCQC6A18Z7L
	 HgPH+JLat7hzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 480E6C53BBF; Mon,  4 May 2026 23:54:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Mon, 04 May 2026 23:54:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nick83ola@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220748-208809-7RP35836NJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220748-208809@https.bugzilla.kernel.org/>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

--- Comment #19 from Nicola Lunghi (nick83ola@gmail.com) ---
Sorry better link

https://lore.kernel.org/linux-usb/20260504233143.10242-2-nick83ola@gmail.co=
m/T/#ma81ee2dadce78c645d1a4320e0f5f55b5b58ef8f

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
