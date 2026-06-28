Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A65C28690
	for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 02:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782613209; cv=none; b=cOe9qsEE/aPWAs6/65Q0Ml5dm1h02pc7HthdP2P2IxGavuOLLh1OODKEx3Km5cMftW+NokzjNG69I5SQ2WqEO3sLrBLQUILQ8DKmRzb9tg7h0dl7f4or7CSp5XiBFcYBXHEpJ4vvot0jakIPrgGiZ7o9jVpKrfMd0NZxBvg3HH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782613209; c=relaxed/simple;
	bh=cgaaqUuU64HkUOefdWhh6u7ZsrdID6G99sYkU6gnd2g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BIMG2YxdpKhUHGKhcVP2PbgxXJbQHwZyQeaRH9g0NtSLGk0EsL8I96OjhzMJ/jYu8Idr6OrRHRKmhHz+6Ax33JXtW0L4J4QZyglu1cHoIzKZ2jnZw0HMEutLObbbX0xb/ZWWpG+B1PsjXuVDG++F54bC1kXI30H0/rcbtvfTpiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQqOGdkf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQqOGdkf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1FA4C2BCB7
	for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 02:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782613208;
	bh=cgaaqUuU64HkUOefdWhh6u7ZsrdID6G99sYkU6gnd2g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BQqOGdkfiHU9TLYAC/G2fDNbQcYe6pDg79LQUAvEZI3Fth/yhPF3RuKXLWfuHLM/2
	 u+w+tSssW6JA5+J1Jwy+Hc1HfUrWAqlPSAbU/GDsWg+uzaOQeMVH9A8No2mr6H7iyb
	 cnPzYoHwF8CtJ6JDsjREJXd8uJ7AwJwWBiQJfx3hnTcetpDTPfX1G3N1X9hR7rw6S4
	 u7t3CiZLVBQcRYAdvV2JsJn22y1jhWFWLmhCMbe0pqbtHHec554pdUgyfCPL0BpDl2
	 fEt2pH9C4EMqIkaj6zO3yGLcUo705PuyKK14BqX9DJREp4NldQeGA9/fKPHze8FHd9
	 vQ2ovwBbDllPw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D29B0C53BBF; Sun, 28 Jun 2026 02:20:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221340] uas driver hangs and causes usb reset
Date: Sun, 28 Jun 2026 02:20:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: DaisyTheFoxxo@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221340-208809-OlpmXFVFBm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221340-208809@https.bugzilla.kernel.org/>
References: <bug-221340-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221340

--- Comment #20 from DaisyTheFoxxo@proton.me ---
What's the status on this?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
