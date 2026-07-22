Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0366A34B437
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 06:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702563; cv=none; b=bSV5sHxVYZWGmtE4kvnR8n9Bs44Qk3dRSA6sbgJoS/eQpNpsbYN7EDtZSkU+53iqqKb5/YDep1EUhTdJwD1vDbKiS3qT2Kp7mTTcLzXEnGttQF9J62yfEwPjVgo1FBGh599ZsV6eFurk4ZDD73gtMcc1rG/V4GJWeAubPqzbUHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702563; c=relaxed/simple;
	bh=0Sm3/aM7XwI30HGUpwC1DepherLFsX0mfWsZeMv0u5Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iSKvbIZgp5QLs2MBTECMHRc7lyEDsLyI+nSQ3/6uoMHt7DpjhVHmg7QJUKFoF2CGo63kpm/7ccz3hkHqWqy8r8FjM2mlpvYTWt7usNqcloGj8vJg4r71XsSJspqdRNYRadteWE1SZrCu+1GmtZuQGyfOdBMcjF5M3Kcmo1bvj38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKJIHRHf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKJIHRHf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BAB1C19425
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 06:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784702562;
	bh=0Sm3/aM7XwI30HGUpwC1DepherLFsX0mfWsZeMv0u5Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OKJIHRHfg4mkXk/Klx8+7yN2z+3TIkw3X2CW+VrAmEte/eLD1Telm/VQ+/sP92A92
	 EEdWTNQjoOFM62bu22x35nmU00NW7LAHU2ZxhO32e1G65AbAS6RAP1BK2QJxFo1FHI
	 HVgtzjzCWOyG1nwn+S6cYc94luy6rE5Z8j0MqfNrP7zVYUet9B6VxXn1bQgIdbcw5C
	 kdOWyVwc9C1s8PhlZtOmUlSnMHP2f74TsUibrPcMEvhFesJr71o9qqFbyg/zSrPpfY
	 1o9fsZu8P2Sl6g2c2mZqFSK03e+UMzrHhspDZ8vifwZUJKD0oduzPLQS8sWVggN5J2
	 dywQLc5s2zUHQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7E87BC41612; Wed, 22 Jul 2026 06:42:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221774] hid-multitouch: report ID mismatch check breaks
 touchpad palm detection on ASUS ROG Flow Z13 (2025) GZ302EA (0b05:1a30)
Date: Wed, 22 Jul 2026 06:42:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221774-208809-rUlPUfOij9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221774-208809@https.bugzilla.kernel.org/>
References: <bug-221774-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221774

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #1 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
* Would be good if you could check if latest mainlin is still affected
* Have you tried if reverting the change helps?
* Can you please attach a dmesg output from an affected kernel.
* This likely needs to be forwarded by mail. Can I CC you on that? This wou=
ld
expose your email address to the world.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
