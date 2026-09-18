Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EA84973B9
	for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 16:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748322; cv=none; b=lUNybSqm9YlBVjKpqxEznQyF+UQYLgfy7xNg6oh1e89Jpud4bUwoNm4YB2ASLBWaSWuwAoM6gx2slMromY8f85+CZNxlMPzwqRjRgg1WqZFNF4thjdjS3oguJA4ib2Mi+W3tb4icZYLQ1+j1ECzWKgogqxr2XXQw8cg0KsJwaoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748322; c=relaxed/simple;
	bh=CCUANnpKttaaNTX7hENnDQD1zyXnCKxCHGdoDTu6PLQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O2PtqkHw8rKuwps2KicDQl633C7K48qF9fOwHogPFcFCUmPbeVwpNYHsW7lInRFKIUb5u1wAD9sadAEA6QfuFXS3zY+gW3uPsPFn5vI8okmEpL7Ujz1kiSBGhycMSHNXiNNmZza8xwRV734LyhPQOJei5Ony04lEnRSEIsHi4/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ed/XSlJa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ed/XSlJa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DCFEC2BCB8
	for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 16:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789748322;
	bh=CCUANnpKttaaNTX7hENnDQD1zyXnCKxCHGdoDTu6PLQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ed/XSlJaS9cJ3SOmzS869LvLOemd85O2ugWLwxHYPkrlnoUQYOAscAu31/DjSO8lO
	 XqxG5ZuWz5ceY+RSs0TDMqbklq99Q5rW0q10u2k+VILvheNVX405lN585QiO/UZjUU
	 mRTbNo7wd/AhKa2MUK6Mu54oVJ7HsoNo8OS/WwGm6NCVrOjnzzsDoDUDGskPqUSuAO
	 qkKV0VzpWtwIDZ3X1t46RZHYYn0tCKagC+Fda/94UYYXCG9Damxc2payvikzV2/nKn
	 8J7W5080/P9YHSS71PNFjHO7dFlhVueK12O/FD3Jb4AbqAtiDaRTOrE2RYPs34+j4w
	 Dn1i9vnHzm5Zg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2A8C1C3279F; Fri, 18 Sep 2026 16:18:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222021] Not charging via USB C after Kernel update
 "underpowered" Dell XPS + workaround
Date: Fri, 18 Sep 2026 16:18:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lovekeshsolanki00@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-222021-208809-VFMe2YHq0a@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222021-208809@https.bugzilla.kernel.org/>
References: <bug-222021-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222021

Lovekesh Solanki (lovekeshsolanki00@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lovekeshsolanki00@gmail.com

--- Comment #2 from Lovekesh Solanki (lovekeshsolanki00@gmail.com) ---
I wonder if this could be a firmware side issue, but you said this started
after a kernel update so I guess git bisection is useful.

When you do test mainline and bisect, could you also test this attached pat=
ch?
I suppose when UCSI_GET_PDOS fails  we could reset PPM and retry the read o=
nce.
Also, did you perform a firmware or bios update around same time?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
