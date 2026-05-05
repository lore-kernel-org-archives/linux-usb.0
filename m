Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849CF49550A
	for <linux-usb@vger.kernel.org>; Tue,  5 May 2026 17:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778001034; cv=none; b=Cd9fcTAWpKNhoo+vH/Zryhgiiymm+UalB/X0efrZsKPjH+jCxkyUHwkA8BMylnqkGI2yq/xzm2/UezioZXsGeFKjBagfq+N9CIYwKlQ0rSBG50smicdlRnZ2RmtoeJwv6JyjVXZlUPBLCrZ1AY2d3IZspkiULPie9FTBSYjTDYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778001034; c=relaxed/simple;
	bh=StsWVpiR0iB1m18vetkqvr0MhE0T1D4v9cDNeEAbxxw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fmn36b8aRQgnrHju07ErPb4MPZ8Ak9jxWI77wOYGmDEWMdMxtwBohtwtloWnXmQOqFljl7eClZ+8ifyaKNe5RT3xJtXss8O9P5Ta+V2s3PrGPMq0it5yTV033hF66Go+Yv3MQVsq5SDiTnE/YK3j03CbaKqBQIbVZzIFEzs8i1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDdo963S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDdo963S"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E2ACC2BCFA
	for <linux-usb@vger.kernel.org>; Tue,  5 May 2026 17:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778001034;
	bh=StsWVpiR0iB1m18vetkqvr0MhE0T1D4v9cDNeEAbxxw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nDdo963SYtn5EqpXUpEm1nvTRsUEfC0ilZQBq//QDBQ2j8kFeutERf+qP8czPAakG
	 PZVCzkZnQHMXKFWpbA77yopHIPgRzIYTexliyAxVCUz4iSw6jm11MyaLYDiE4ZYTR9
	 IHoLD0MwG0eu3QouZvHsEskMcflqHMskEZMLiypOJ/doPy5qnDk9C6sexnyLkVC2f6
	 JxRm03tvtUfor4k+BoGnuVDgC9pznkStyM552z6WTF9/AeSz13XRjeJmt1WA+/D1ky
	 BwbE7Qb3epKFcNR0bf1rcqMM6+NVa6PiJz6hUu0MY4QeN6EGymJs9lWt/uA3rcpIIk
	 VQNKCmlHZgoBQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 17563C433E1; Tue,  5 May 2026 17:10:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Tue, 05 May 2026 17:10:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nick83ola@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220748-208809-IfOxgvqTpK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220748-208809@https.bugzilla.kernel.org/>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

--- Comment #23 from Nicola Lunghi (nick83ola@gmail.com) ---
Created attachment 310037
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310037&action=3Dedit
first utility patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
