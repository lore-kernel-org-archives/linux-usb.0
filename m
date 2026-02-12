Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B617E32C93B
	for <linux-usb@vger.kernel.org>; Thu, 12 Feb 2026 21:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770933546; cv=none; b=hvdYndcV6QVqoSOvUUpAajKsvmHz9lG1I8azOLGyBMFSAolROdeOyFZ/w5W1MedEC7yqqqoKINqaoeLp4HpRPBbSlHGq3StH5wbyR+zbf66hw7WtqGE7Aa1jXVOyBSSTVs7LzhREVzj+XSYaJ6ij9mzVw3Hm8TLXLyihbYZ+aPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770933546; c=relaxed/simple;
	bh=H07f2BHBoYakkKExnkm3+LzROtGMwAZ0gne0/ZLA5FE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jYn3f0AbR2wzFShY5DRN6KKNavjLFZSg6g8+hwZhQuGRAlN6Abyv4uWs0hMNtw1SV32LsYUxgOBZFafNOAikqDNxZn4zL2MaetWAXbHXyXOscTKAncCsV44glCEXWXZ0zlP4A3kSO9jdX2dK3tjCBEj/JPBCzq2XLjdDcld6QbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=do1WPBdw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="do1WPBdw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 512D7C2BC86
	for <linux-usb@vger.kernel.org>; Thu, 12 Feb 2026 21:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770933546;
	bh=H07f2BHBoYakkKExnkm3+LzROtGMwAZ0gne0/ZLA5FE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=do1WPBdwUeb+wSDQstIKEvU867n/WXV2TPlcp2s9emyaxzzQ3V7j+9qwt3aLsk6Wc
	 vwuVg2bRjDt0Zk0V1RcW450E1aLGFj8CAcrlOjK+LVtKP76YFgHdAeaYD6Hsji2jIN
	 w+xvSyZYBFAqim1h8OqIMkR35Wf/+4XqmssTtmCE59PVOK7ukVelldt2W26V8eo3aU
	 A/VajFG1W37TgBIeJWE4XFusc1VXM69fEd6MUIAhXrCgJFllX2PlvbCemYKjrGGpja
	 8XfQuegAYKTG2D+/uzs+h9+BErTVBXfyb7zECIgdvXIxfkoVTrXhhSntVoREOfWrv+
	 W0C1LvGJRYvXw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 47996C53BC9; Thu, 12 Feb 2026 21:59:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220027] USB 3.2 capture cards using incorrect USB speed
Date: Thu, 12 Feb 2026 21:59:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nuvandibe@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220027-208809-Um65O7Znjo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220027-208809@https.bugzilla.kernel.org/>
References: <bug-220027-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220027

--- Comment #13 from nuvandibe@gmail.com ---
This issue has actually been present for well over a year. I have no clue h=
ow
I'd go about it fixing it myself.

As someone who needs to use a certain 10gbps USB capture device professiona=
lly,
it hampers my ability to use Linux in a professional setting.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
