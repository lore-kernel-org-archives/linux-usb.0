Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BCF29BD95
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 08:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081816; cv=none; b=oDlA6HfJtvL3xtqfUxilON9sMixoGu/MJly+8UFQyqOWoZrWyjHcb7nvaarn4Utk3+x7tkvBFevM7CviFZ0TuRBY4LubiqF+CsAcw5f8TBzeRIjl6goAGRKw/w8DBe0jxS949WKh6be5fW1cjuYtp0kiV2kNqXia5M1tcryIAGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081816; c=relaxed/simple;
	bh=VNcKs7/9TAELc3XDSq7Np6LpYzk2GQzmF1dMecNyc+o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PYnW9DYIXLooyk80a+KPPJMEG1ViDRU3ZJ5qgM7q7+7dk5AeqoqiA7ocrmwLUvpL8rm9xncPszMjmaWG5c7/dgvdydEseNRg7ktG1zwii0WIvVDL3gHNkjdkkVE0cQgYd1nSDxgWllFNF5poIDm4TJBJ+rc6mowl1KSCeR2G+Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pxnrScNQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pxnrScNQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A1C1C2BCB8
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 08:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781081816;
	bh=VNcKs7/9TAELc3XDSq7Np6LpYzk2GQzmF1dMecNyc+o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pxnrScNQ+p+uXy5I7z6hbosNWE4BEGwZzN6relzRQNKswuaRTb2lrr+dMLiAoE2iQ
	 cg+UBN1RkqwspQwuy07HpKmmdit/HmFW7zo/QI1PgXoP41URx3mguLEQW/+3a6RZEv
	 Zr7lH2wVEAUJpXyB5RQ5cwKGY6Y82seoOSgbB+A7dGoKN9FrPtFXY9NSQ55VEcZhMw
	 d9BOOCGXe4sAlY78waM5VwAGl26xb2cphg3kSfEnvT+DTrCWPTQKfI98rsD2FWi9ro
	 EAK8gDQYKBX37F5qh/0NCRplGZpX2SDKBfuuNVEbXtYXeNzmREl+1rzh5OO+4h5j9o
	 +uafAmS+w9MfQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5D541C41613; Wed, 10 Jun 2026 08:56:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221633] thunderbolt: hard system freeze from repeated DP tunnel
 activation failures (LG UltraFine 5K dual-tile + active TB3 cable, Meteor
 Lake-P)
Date: Wed, 10 Jun 2026 08:56:56 +0000
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
Message-ID: <bug-221633-208809-ut9CkOKJ89@https.bugzilla.kernel.org/>
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

--- Comment #1 from Allan Petersen (allan.petersen@vocast.com) ---
Created attachment 310289
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310289&action=3Dedit
Full kernel log, freeze boot #2 (mainline 6.19.14, incl. tb_path_activate
WARNs)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
