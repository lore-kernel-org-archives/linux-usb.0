Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F12377003
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 14:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772549738; cv=none; b=f7W1LcOp4krsugx2dSV8BNPEssBoRLXvRbI1mWK3+2/kpCJRdCJmv6UBXhCzzWrnZoovCK+J56AIsHWhj2f2AGapSZ6qh5bHf3YiuimYihWHDIyXsFHHyhInNaMbv1LQsA++uMfq36iyXcjcmLD4O9jrxcY9LAvHVNs2B3r22N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772549738; c=relaxed/simple;
	bh=dM3+weOR1lvj/sB7+Ey0PWdez7y4KcWB0Oc0h7fiViU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jOIVSH6dWDLmMzvswGNeGqCVUFzfm4vVyJecKCtBfUGilssPgFGUSnIggWygcY8iSPhvkW8b3XD/IeluyZN2L+CJ1BVsbuS/VO6wAB0PAeTEkJpuSjyZjMXYqx9DDy3E6AQY8aaCs491rexe86SSQtpoMmZphzeE/sqVNfHIQKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dEoopcOK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dEoopcOK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2740C2BCAF
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 14:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772549737;
	bh=dM3+weOR1lvj/sB7+Ey0PWdez7y4KcWB0Oc0h7fiViU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dEoopcOK3FMhmagjMCvQTqE4MpuNBgBAYXRDODUkDAdBcb/FOHAQ5cDauO7OmoEQK
	 lZxJctEaNHUIMnhtlVmFKq/SVbPU5mZfeZ03Jjl0yrREPY7a+jz1tqOLIHj7DB8h35
	 HyFkavub/uUp/z0rwxt3+VY60M0GoJPYtKmqH2CLAHI4qvk/t2VYShYe0svkd61qd/
	 ZKZVsa6pBxk7o2mH92RCAhtoUGCjqTFHPyloaxAJrG61/9j61yVqd9v96SgBgvbZRV
	 EyNAV04NiKZ6kF/Vpu9GcA4R4KoiWGxQ1d2u5xnSAQcTpsm5DNJRH/ybLRz1aZW4PX
	 EkIRtNPmqc/Bg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9DA87C53BC5; Tue,  3 Mar 2026 14:55:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Tue, 03 Mar 2026 14:55:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: david.c.hubbard@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221073-208809-KCyMuQzTNU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221073-208809@https.bugzilla.kernel.org/>
References: <bug-221073-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #22 from David Hubbard (david.c.hubbard@gmail.com) ---
Created attachment 309525
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309525&action=3Dedit
comment16-dmesg01.gz

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
