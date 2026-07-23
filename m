Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62059470E89
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 03:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784776992; cv=none; b=rxp+nEZYsctWPQjTBPIhxLZH9dOQuF1BoEo48SYOHY7xqOt0zf3Z2JMEINht5nF9p+X+sxFwArc8cWqj6daYH4mHOmcUz1ScWmj3hJamTFTErGzuVtRUZEIBijw5edR9YFYtbm5Jr8dcacits69hBbVAUq8yKUDXlj7YY7uuxk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784776992; c=relaxed/simple;
	bh=BytQ6Fu4/sVWXP6IfpgucZvG07mkFfdB34bKWEurnQQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UBhO/v/zGWTybCrrQWyGrnqu2qV69FV/ywq+LdMaHABDueLglyId+/6/o6H04/t8C+xypbA1G44L5eZ5gcxCpkBQ1h5L5wP97LXRvIAmHA8iWf0pKxhz6feynMjxKVzQXqRojyZkvY4gIllFa4r5BPKIKUtc6buXbkTkc9JJ6ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jW0bR+a0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jW0bR+a0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E163BC2BCB8
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 03:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784776991;
	bh=BytQ6Fu4/sVWXP6IfpgucZvG07mkFfdB34bKWEurnQQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jW0bR+a0uvlDKHgTR/ZOCEQZntA5eYmrwg912L88vi7gcG960HxccIYGTlMICu/GX
	 CIvRLvZsNy5DPcKH6NcuPzdgerKUDdOuj7Pl0LDcbQ8+cIM06PmdLE/7lIoYCIlg2F
	 DK/J2Sy6dqYNtTMtwlKjmBPvT25Qm/nA8H2bihOqMF1PrNGYXsw2rBQ5fWSOLtJ3NN
	 Bb0xLLQIzrB4iR72/4ajeAOBk47OiEyNYo4hLqew0P3zsFLs3Zbds6GBIyRT+VGYDK
	 0EIMR9pvfSNziegvBeLtm9RfHIC49EQTYZzHUOAEezN2Lb9T+Qi1lu4DWsvlpl78fD
	 l0UUkEKN0eT4g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C526DC41613; Thu, 23 Jul 2026 03:23:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE3NzhdIFtSRUdSRVNTSU9OIDYuMTLihpI2LjE4XSBB?=
 =?UTF-8?B?U1VTIE4tS0VZIGtleWJvYXJkICgwYjA1OjE5YjYpIFVTQiByZXNldHMgfjEv?=
 =?UTF-8?B?c2VjIHVuZGVyIGRHUFUgcmVuZGVyaW5nIGxvYWQgb24gUmFwaGFlbCB4SENJ?=
Date: Thu, 23 Jul 2026 03:23:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: m.langas55@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221778-208809-6Pq2oaAQIY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221778-208809@https.bugzilla.kernel.org/>
References: <bug-221778-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221778

--- Comment #4 from Miguel Cervantes (m.langas55@gmail.com) ---
Also I am in one of the packages you mentioned, hence me being in 6.12 at t=
he
moment and me posting the bug, I feel a bit stuck in here. The driver choice
was me debugging for a while to figure out what was wrong and it's what i e=
nded
up with, apologies for the confusion.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
