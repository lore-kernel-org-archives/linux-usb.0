Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B483638E8DC
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 20:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784926365; cv=none; b=chuwaEblRzVNrKcOpSshPLuxpAxRTHhm69IL7VtfkM9s0bNYcPbmN727d6hLYOTMghjYnOb65mVmwsff/Fd4r4zN44FQ/vYFb/R/F/8tY3pSESi+WEUUQR19LEvA1keXLXTlctJ4/c39R2kM9UlaUruOiLF7DoT2aJf0K95+VwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784926365; c=relaxed/simple;
	bh=JRbBy49yw7xAOlwIHctIgvKcMSH8z+yTFmBaYr34+CA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t/8Ls/ahKGtiO+SwnTkwSHVa25Yc0x0dT/l2IHHe+Ka2xICw8cN2sM+cEZfkoFl2NwUnRBYk0E8CiDJmblqJ0By3Q9CitJQo63X4Him+qqHRCuQzzL04DkSiOzig/3q9b+4kgD2vprBNHH0Q+DHZLHet6awnj6sgu8VEtL8Ijos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXqcK4CF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXqcK4CF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 409EAC19425
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 20:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784926365;
	bh=JRbBy49yw7xAOlwIHctIgvKcMSH8z+yTFmBaYr34+CA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MXqcK4CFngS9kPDHunqld6Zw5uQkUmTJE6MbnqpgDSzVa+PINFwFUacAXg+tbd9nl
	 JmhPioKtQDUcTffWGMkV+wPdy5ZbNi8gRky+UGamZC3sahU8aDBh8anhZOs893zsWu
	 y0OiHt7AbrF/oqTpmknl4mjgLj+77pAfrC//nhGmfwhA5LeHyOAO5GBMoYdodP5yB/
	 N7xPH241IYoBZ4tgVlzsWL6DoSQdgCMP78s5i1R2PzMeZFfOca8tqyQ5Ma0aimCrdb
	 2ed4rqN3v/KM1afcxbF/kdf3NTgN8MdX93FgLIs0Uenvi+nAX9jfRak+kgqiM8A2w7
	 9GLwcy7tyspVQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1D7EBC433E1; Fri, 24 Jul 2026 20:52:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE3ODVdIEFNRCBTdHJpeCBIYWxvIChBU1VTIEdaMzAy?=
 =?UTF-8?B?RUEpOiBUQjQgZG9jaydzIFVTQiAyLjAgdXBzdHJlYW0gbmV2ZXIgZW51bWVy?=
 =?UTF-8?B?YXRlcyBvbiB4SENJIGNvbXBhbmlvbiBwb3J0IOKAlCAiQ2Fubm90IGVuYWJs?=
 =?UTF-8?B?ZSIgeDQsIHBvd2VyIGN5Y2xlLCBnaXZlcyB1cDsgVVNCNCBsaW5rIGFuZCBV?=
 =?UTF-8?B?U0IzIHR1bm5lbCB3b3Jr?=
Date: Fri, 24 Jul 2026 20:52:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lkorcm@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221785-208809-aPjFOsPLHB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221785-208809@https.bugzilla.kernel.org/>
References: <bug-221785-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221785

--- Comment #1 from lkorcm@gmail.com ---
Created attachment 310500
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310500&action=3Dedit
uname -a

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
