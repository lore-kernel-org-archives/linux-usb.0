Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6950271A94
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 03:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792033331; cv=none; b=ZjY3FzM/MB/xrnzrox6w6XRi8tj+Za40g6gxBc2p6olScmIKlHmkWogHSkPUpaQQDzMXwX5uL0G4dFATgEtVaCP+WKhegHUKDHUaDI+P8W0EiWAewaAlaVKVG5+0RKN1WbOKCyMGHUSG6DHgI1rEI9tq7zD6qGFEmbqx+jN8Ko4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792033331; c=relaxed/simple;
	bh=ERrjaMqjEtnuyHeC1l1csmOFlk+OUKuUNB2QUP9uyk0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R0lYG8VoX9ooJ4LqbwnYJMT5LNcaklV+eVv8fPf/Tl6z4Jgw4LF0YNotG6Ora2D2H6lpZkm3mojAuQtukpB416WFNQoaOQDLwUia/NA1B0vG13eITd5oIK8/VBQregS8xXEi//zk5akWSQmXCVv6mABvQ0I5PwzyCeTyjD6gSs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hspXvKw/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hspXvKw/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A1E0C2BCC7
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 03:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792033331;
	bh=ERrjaMqjEtnuyHeC1l1csmOFlk+OUKuUNB2QUP9uyk0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hspXvKw/N6aKPkNDlIMBYeLaF2esAgyjTXF+y8zCVx+k98vBWb5Dd0ig9eKeUkcJY
	 VTnrsEJAojP7pR4TYk8XrsB4IIF3Jiu1a0wQi4JV4SmOFVZCIbYJ4tJioCDjBUR1bc
	 66MH3G0OubxS0T4h71Mwb2HeDH287/AcJSKSrlbMPj2Z9Eu2jVuNE2hPHcJ5TOPj3s
	 WifK/CeJUUJH8rVrmPNYlZf8z6IQppb22/b4ScDHWZ9nUc0gZZpDGK5WBPkPy8fj2x
	 P3QnZQLIfX56I6N2omk0PtoEMKjoWwgDxBpIPX7FX4fAy9vGIqmbzKv4uQQGRqU9tO
	 SXXYwGXcI0b0A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 25616C41616; Thu, 15 Oct 2026 03:02:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220193] PATCH 6.1 082/167 which adds support for Owon HDS200
 breaks functionality of Owon VDS1022
Date: Thu, 15 Oct 2026 03:02:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: daway320@163.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220193-208809-Mr8tmm38xB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220193-208809@https.bugzilla.kernel.org/>
References: <bug-220193-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220193

--- Comment #7 from Wei Huang (daway320@163.com) ---
Hi leStoppe,

No worries about the delay - and thanks, the dump is exactly what was neede=
d.

Quick summary of where this landed: the interface tuple is what distinguish=
es
the VDS1022 (class 5, subclass 6, protocol 0x50) from the HDS200 series (cl=
ass
5, subclass 0, protocol 0, per the HDS272S dump in the commit message of the
original driver). So the fix is to match the HDS200's full tuple, which lea=
ves
the VDS1022 unclaimed and lets your libusb tool work out of the box again.

I've submitted the updated patch (v2) on the linux-usb mailing list with th=
is
analysis and both descriptor dumps as evidence:
https://lore.kernel.org/linux-usb/20261015025456.3927808-1-huangwei@kylinos=
.cn/

Thanks again - this settled the last open question from the review.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
