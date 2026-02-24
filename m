Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998323A1CE7
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 15:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771947760; cv=none; b=Ixt281U5QTb5dtTU3207D5LeMIgmdE4CyZs/MHcowYJq3/YiDzlzbADyKmwgKMHr9IHJanvP3HW3F+GjMYMBKp1nVS7RUmMyAAHcQtHz4hN0QxQ05oCLCGB2vbA2Hunoc1dCcm/XOxkUfEvd8BCdcb11i+vgwqNDhx/+8wD+TA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771947760; c=relaxed/simple;
	bh=LtBuy3+ILhpd9r3A1YFEiLPyBgB9AL/bN0WxkARZHF4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Yk2ItFERi2q+jlhfcUhFD70umA5+De6J5XD69cWbU5UUoh2x9VpoYmLLFphHMovaZE+ZZL/lFvBU+xaSF6HIKfEkbBjZN/WVCqUKaOnPACOAniq2AeLN74BNQrqa45mj5pO/XnnWX9x2HV5+bATuSV0K/qsQEsbBNWKJjPmQI8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVFKOZyM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KVFKOZyM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 402A4C116D0
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 15:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771947760;
	bh=LtBuy3+ILhpd9r3A1YFEiLPyBgB9AL/bN0WxkARZHF4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KVFKOZyMLBYOuKIuGx9Gvg7zRCYY6SsFEHLz7X0oZOU2iSsKfvMrDoG8D6JFdS5tz
	 vqcNeO1X7rbzOZqy9XZokaOy0n27Zut7mv1YASOMPBpVvm5Vf3aHY6B1PR8asa6EdV
	 7ekbax3MiRu/rMm9MhrJ4lhA4WZXCaftWuw9LJt4KEnlsLp6TuzZow4XU5knPiJZ83
	 YnPX2nus+pM8LEKbxx0dVMv/kKe1HZDwkCAD1+dvd6hry4j5XQAasDYxQkUo5h4nlk
	 MvYX6EdIxsfwT+xjxpsM4qAcgoQk6BxbEL/LtuFYXKMEu58u5CcxUr+pHLRe1qbVs+
	 yZI8kUSXskYLQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3AA1CCAB780; Tue, 24 Feb 2026 15:42:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Tue, 24 Feb 2026 15:42:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-wIqbQpUNKC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221103-208809@https.bugzilla.kernel.org/>
References: <bug-221103-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #24 from Alan Stern (stern@rowland.harvard.edu) ---
In view of comment #17 plus the fact that the entire system freezes, this l=
ooks
more likely to be a PCI issue rather than a USB problem.  A broken USB host
controller isn't the sort of thing you expect to take down the whole comput=
er,
but a broken PCI bus or controller could easily do so.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
