Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE430224AF2
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 20:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792096561; cv=none; b=Nu1OC4HY6CtUmZ5YuPz8StcS2VQEZbj+puL85t7UILQLPtGdMgCgVhZuYaKOE9puk3HGFmjZWtA2VcvIElmrMPNzgm5gSzF/PPLilfprhWSMxPsyjbEmWFXownVSkgJIHTIAM4KKjxM6XLM4NTwzMC95nbaMuxlxkaNsoKITams=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792096561; c=relaxed/simple;
	bh=BFhZM7IsvqFpY+a6ZrUa/ZeBScZu49qCu9L8o/Epk/E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Du34TvkpjohnPoETvOeCmr7rwdrPNkDHDC0TB7aZdLX/c3jgZXcpNczBWMXIQQFmTUJac4tEA9gYo1MbtVFukLZG9MYA4TdAaF72QV5Z6vRXW0g8h4ff2TuhGvbuP6t+THBN/LXfT2boP7SopfiGrDldv1foku0tg/Kkq7EXIO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QUZWHRxP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QUZWHRxP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D9D9C2BCFB
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 20:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792096560;
	bh=BFhZM7IsvqFpY+a6ZrUa/ZeBScZu49qCu9L8o/Epk/E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QUZWHRxPa4t76gn77v3hTAGc2qFX7ZBWJOFqaoU8Nn3Tp31hftjqCXLWUCde94iaF
	 7h+lztsiWzXhSg67HAHEwgBwEtfsUqMPpu/MFCDbRkm13+Y28un/EQLrzLZrGeWOLd
	 Yna9Z4nNEtG7+0s28zrBcqah6IYtSRM2uSsFrIv5WRg+VzTx3aNj7iLeh5ZzFkfSCe
	 SOBkotubvTdKAmYV6E7YRtZzHGpQzrV+Gyx81MjG/sgW9rETgSPvy4P4ciHOyCP/hZ
	 B1nHTIwbr0YMjHD1BLlm0TGLbe/lklx7MLZjMJKVaPInhuBZ8k7PhG3f1olJBz6f/L
	 OmGRDlUSNN6BA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 13E05C41612; Thu, 15 Oct 2026 20:36:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222047] [REGRESSION] USB xhci_hcd boot timeout on ASUS ROG
 Crosshair X870E Hero since Linux 7.0)
Date: Thu, 15 Oct 2026 20:35:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222047-208809-kuXQjyRfEi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222047-208809@https.bugzilla.kernel.org/>
References: <bug-222047-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222047

--- Comment #8 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Does it help to downgrade to a kernel version which worked in the past? You=
 are
on Arch, so your options are local pacman cache or the official package
archive.

Does it help to disconnect the PC from all power for a minute?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
