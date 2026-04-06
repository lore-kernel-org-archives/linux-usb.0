Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE04326D51
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 19:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775505375; cv=none; b=bUTiGtJ3s/IJga89xwgE9mt60EALvHzG/NlK7/Q4U8kLYh0o9nh4xSstEe0KZNAEDKPsaSoQJWflNMFvranmlI7h+183j4kMUKzdEHxoS6Hl2ler9S9s4Nqsr6bSypsZNtd/3k0f82xabSp2qbPjHLHgkCxpxC3SnuBUqkt/9Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775505375; c=relaxed/simple;
	bh=iPnmirm1jzVsxlo/ClyDdu9WDNMJS+mLDhlUsQ94ydc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Djdf3JER2eOLM5thefcf5nw0miHRRckWTWPqyEAhIc10rr5wF+6vXqXGehTBJAghWfW+71pE4vJ8zkIW8xHnwnG3OZ3c2dTpNRuZwhqlOxoiY6eGk/HuvefRVrDBjA2wmz4LS7y2XxoJlSoVMR7vnzanMg2PUcp9rDowtdNsNN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cGYNg0Hx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cGYNg0Hx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E219C2BCAF
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 19:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775505375;
	bh=iPnmirm1jzVsxlo/ClyDdu9WDNMJS+mLDhlUsQ94ydc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cGYNg0HxlUPOQPNvWs0mOWo/Pah7Hv0O9npUcgtOSlg9rYmRyolPzQrh/f1N50uft
	 Rius8h6ch4wY/ioa833h4CLDCiGdfHOYMjCNqwxSXrU+OdDbzwUVfSQA+iKtYtvwWD
	 onaC9JrVDRIxriWt8vGS/MxsY802fIvYptYX2+4X7ebOvMDIHDLycdWMKhpUAp+fHp
	 t+BFV8h4B6zDKQMjX8MjFMK6xzAMgY0NEgH63fqOWnqXuSaoikLOVWo2cUr89aetIh
	 OHGOk1lHOXr08HB8Y+ZNCGcBS4fOmL8uH0usIaNbHDI/ZHbXOdAj7y3So8NXnXhxGD
	 z7KUCl51TQCrQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4C8EAC433E1; Mon,  6 Apr 2026 19:56:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221318] mice behind ASMedia ASM1042A via Thunderbolt 2 never
 produce input, most likely due to interrupt pipe idle window during
 enumeration
Date: Mon, 06 Apr 2026 19:56:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: manauer.uel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221318-208809-kh79F1O2I7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221318-208809@https.bugzilla.kernel.org/>
References: <bug-221318-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221318

--- Comment #16 from manauer.uel@gmail.com ---
Created attachment 309839
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309839&action=3Dedit
ASMedia ASM1042A debugfs state, captured ~10s after connecting non-working
Logitech G5 mouse

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
