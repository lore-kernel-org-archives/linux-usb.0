Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FCD153BE9
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 11:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775475346; cv=none; b=Mu++BpjDRryvWKdgcCKr9meaNMFVuFExiJqHMeDeLjjFWm4L2ge8tCoExqQzGDFtr4m+dS+k/4MkysRL8BU97ehyE4hpDY7qpimpryPnxbtFfZWfW/+FdrevSztcJ0fuIcXHsuOiu/HfdRW+HBc98rFjkBKJ5UeXzP4eDozwIuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775475346; c=relaxed/simple;
	bh=9p1ucewIoTl0RBDc5xFt4zMvb32S8LQZk103SteBhLo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ue1uTYR6o45gA3JIvWIy9ekqjpaSBUU5cTV2tV+wqNuXizTM2dPLw1e60s9eBB4IxnGgoaE/kBCUzSTuAYtBUXiV+vcVapN3W1h0/KfJjekr+yeVxX1p3CjwkF+IFtHVZBdw9xMgdv3iY8B0tjnrJQoLd3r2G8+2BmSlpNoc6aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JcMnRR8V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JcMnRR8V"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C36DC2BC9E
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 11:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775475346;
	bh=9p1ucewIoTl0RBDc5xFt4zMvb32S8LQZk103SteBhLo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JcMnRR8VFMGp9692Cfwbd6LqRxNdApN0Smez7O/e6yVrvUpfp5D2E6FAsakIsPRtC
	 P7r+UpHKNNBdX6Ig+uI6VxOsyNuCGQSix6MBU0Wu8cxJ/0F2UdjBs1AfiOzx0ALjGA
	 R2wKMm+Uy+CPu9KGUXRoZ2kwLO+uY/FQz5Eb8ovWI8c+udNXst1TjxR1ENNpH7q3X0
	 LxRBrUGOCsYDeSzpE9RwzbhRBdvZ892f9PpntBkhNcHNCciaOfGtf0pBjXQwdYyHi8
	 qOrLVdKFqfB5g+QfAabU2VGgzhIgP2aSZMDuNCg+iQap17DxN2N1O/DWYbmVBWVvwh
	 V8RoFaGjdtMzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 439C6C3279F; Mon,  6 Apr 2026 11:35:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221318] mice behind ASMedia ASM1042A via Thunderbolt 2 never
 produce input, most likely due to interrupt pipe idle window during
 enumeration
Date: Mon, 06 Apr 2026 11:35:46 +0000
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
Message-ID: <bug-221318-208809-6i1Qn0e5Ls@https.bugzilla.kernel.org/>
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

--- Comment #12 from manauer.uel@gmail.com ---
Created attachment 309832
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309832&action=3Dedit
dmesg -W with connection through Thunderbolt 2 udev-rule off only

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
