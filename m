Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E091B305677
	for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 06:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789712229; cv=none; b=EkHGgAyslls7s4hRHMrsJy7fY4YhhLxPb7kgGdL+vBiTEpO33h12salFjWisRr9NlpjplwrvtNWjtqfPbKdxJER+RI7nc62TcftwfkJxwzj1/inxKpnWkixsSV1sqMQ57wUCeeLul3UyD33zOZBLSk7NntroEYrYlg2VuHHcPDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789712229; c=relaxed/simple;
	bh=q3wxHr2/1Zj35N4CwFpVr+pQYUuDjHqcaCyPcpcLXJU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pec0ENccaV2xCPg1Ts6UnscgtBLNHjSYKKGU9KMXIPhdFBqh7J+LLo9uk6IcvxQQUhuXu+bGZzZPz5muyqwam/P89sU16iBjFW7qMSugX5r4JDSjEwgOLQ2EW2R8Zi56ieWfPnnMJP3UYzh1YVG7DtI1CTgJQ+kiKECk2kd8rVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gfcxM8ve; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gfcxM8ve"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65703C2BCB9
	for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 06:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789712228;
	bh=q3wxHr2/1Zj35N4CwFpVr+pQYUuDjHqcaCyPcpcLXJU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gfcxM8veXirrvcDgEe14brPggHKDOiFag5VX0TxhuligbHQRXaguI/cq1EG1oJXTW
	 zDerIxBCUiu9i8v041MaHEcg4+ouq2UbLxTMHIvahbEzachdNfBf14rP3DhAvu5rPB
	 9INkBfWVtBM82Q8WaePLxIjxD6boa7Zi415mMupfzFq4ilTZin3IM8QfFEfPSbZ7RR
	 Qwkf6wo1rECCvCHv4NR+KIrdcNbrqDyQFfE0bhjidhQkeALFjItO3VxJ02bA5Dhtyr
	 uYaV1Yx0nlKPssqChs5kBh03Di7ifmQhbD6KDfTPQ9n/XRxs6ONU/RIi4tsmpm617u
	 IHm4ihXV7/8bg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 421D0C433E1; Fri, 18 Sep 2026 06:17:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222021] Not charging via USB C after Kernel update
 "underpowered" Dell XPS + workaround
Date: Fri, 18 Sep 2026 06:17:08 +0000
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
Message-ID: <bug-222021-208809-WjVRG5BV3o@https.bugzilla.kernel.org/>
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

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #1 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
Please check if vanilla 7.3-rc3 or later is still affected. If it is, attac=
h a
dmesg from 7.3 and a working kernel (ideally vanilla, too); and if no devel=
oper
shows up within a few days with an idea what's wrong, please use a git
bisection to identify the culprit.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
