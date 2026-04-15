Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E2239151C
	for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 22:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776291409; cv=none; b=E+sA0pcByGkOWc2l7/gSkPAuFwgV6lHqsPoGqNmr8Kg5xVDK5kXW/in7m1nYscdZFHx/fO17qCs5qcisRR3t/fXPWg4U5B+gayQdLFZfQNhCdvCVwMEau2FAjFemmDXVeOJuJNE3oJpN/P/ElaW3v8dT1NI5oNo2Y+bnv/2iG5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776291409; c=relaxed/simple;
	bh=ZdLnVT/AWjlaCGwv0Fg9FbCFwiriC3PHHqkoeefs+RU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ED1YCkYdjF942oPF6/VpbLq6OfOvKW6BH02ac2VxspeXBKWAzD0dNXXKuORLzre7dMEgJ6bWZ1xQfJqnGpXMrvtLyerszl0q773mBYQErFXXU4xFol7cnpzOPWmuFAKZwqxuMwEvepo8CvHC/AX/zR267JFYKAj9N4rWRyceWxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pUE6kP4x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pUE6kP4x"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 621E4C2BCB3
	for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 22:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776291409;
	bh=ZdLnVT/AWjlaCGwv0Fg9FbCFwiriC3PHHqkoeefs+RU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pUE6kP4xqMmtiqSg70/q/7ZTl2xumQbypJslRUPZshCUvioWSDvA5mBLmuKN6Bp6n
	 p43so1a99YtK7c4paRsAfQsXbPRuKR2KzqR72iESDp3NGzsLrtj/9JUG2AZECLZzrc
	 enWhYXmS7Cx5wrPhP82CGRBfIZyDSHY6L+fjQxEMmV7wt1AS5DAncHZWpweLYzc9dI
	 vJLcPq3FNbB3o1YM1UVyh03pEXPymFmrlG0ZMAzlryXSqhcALI7C98if/yHAoN+uHq
	 uqJPEu6Qn26aRm9tqklb0TwPOS0X6SdEVkpP0DUhsZq6XlMKR+KqeKFarB4Qz4AMlO
	 cBCIuDwBQCSKA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 554EBC41613; Wed, 15 Apr 2026 22:16:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221340] uas driver hangs and causes usb reset
Date: Wed, 15 Apr 2026 22:16:49 +0000
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
Message-ID: <bug-221340-208809-lgiRmKgQGX@https.bugzilla.kernel.org/>
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

--- Comment #8 from DaisyTheFoxxo@proton.me ---
Is anyone working on this or is there not enough info?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
