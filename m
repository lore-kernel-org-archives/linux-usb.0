Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA72046AA6B
	for <linux-usb@vger.kernel.org>; Mon,  5 Oct 2026 11:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199686; cv=none; b=OMq/ONNn60ooENVQGKPW3k8uNuaY9g5zsEp2tgzPoHyKQAsDsXpnUgzm6ZKeQjKbj0PHNTT2AUCd3TAqJgdgx+i3xF8OSTlvO2ZbJGPmDdBELM4/SfLQm0ILhLsBM8sPMCyRNfe8BzG96U5sNyvJD4b6jk8/eqkl56XrN59c38o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199686; c=relaxed/simple;
	bh=9Losd5BLjqMV5vnvHSc15y0j4XjQurO9q4HWmyKI2fk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kTVc+6wzscGUK24NenKK81pCHLkwHWIRFjf82QlF6SIOSkM7CtcpFmLFyKoUPiifgKcvgF9pYXrJkotYm5lLOobp2tjApkhn7wTp3VNpPGg84aNyZq9+ddv9DT9epPFe0cVxlXBtNcF4HC+h7s2k8cFUH54MlyAVcDDTXacPgCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tOfoJ7tr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tOfoJ7tr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 586F0C4AF0B
	for <linux-usb@vger.kernel.org>; Mon,  5 Oct 2026 11:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791199686;
	bh=9Losd5BLjqMV5vnvHSc15y0j4XjQurO9q4HWmyKI2fk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tOfoJ7trTG4BWAzZEWrLpbSCH/Q7bBsMuqabttmzQ/fzkO7rgME4fI6MKIk++gBkF
	 eM/VuZIVbONfcJEDbsGzh0A0I8BM+MB29cUFwnddcarTNwdVVge9X+QhhSDaF7omcM
	 Zv+U/GLXtzuyQHBxnccDe82oWLKX6JIWylTMDQ5MRfHwqJlQOCjFFR+/YoOjeUVbg3
	 kRVCj/rEf2f3JpJOpOYAPjMzs8N4fdQSmvzC3bQGBB0qlnzUaZy8mqdyAN4Ip9lc0H
	 aGmuN0Hkr213g8M4UF9fjCwLu6oJnKOe8kbIk85bs2bKgIBuDVXGT/PkgQVgMB4xRP
	 jJBHBFkVPYnJg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2FA3DC433E1; Mon,  5 Oct 2026 11:28:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjIwOTFdIFJlZ3Jlc3Npb24gNy4xLjEw4oaSNy4yLng6?=
 =?UTF-8?B?IHBvd2Vyb2ZmIGhhbmdzIGFmdGVyIExlbm92byBVU0I0IGRvY2sgKDQwQkYp?=
 =?UTF-8?B?IGNvbm5lY3RlZCBkdXJpbmcgc2Vzc2lvbjsgc3RhdGUgcGVyc2lzdHMgYWZ0?=
 =?UTF-8?B?ZXIgdW5wbHVn?=
Date: Mon, 05 Oct 2026 11:28:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-222091-208809-9zOWaGZnI6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222091-208809@https.bugzilla.kernel.org/>
References: <bug-222091-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222091

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Could you please bisect?

Any LLM can guide you through it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
