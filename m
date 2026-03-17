Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E600F3E868B
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 14:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759177; cv=none; b=UC6iXK2T85030lQ2EfagiXRR4xlXjBnb7JuiaDCM+8/NC4X8TQLaVtqMpg6//3rHYWppr5HfpXlYHOQTn0tTlOy6orHcKv9TwuVVntx2eW9RGx8EmkAAyw+8uRJcxCdj9E/lIgR5dkPTL77MaVpWmUmDIw0P5HiCo8hA5fKeJdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759177; c=relaxed/simple;
	bh=0//teAos5q32em+J7BmxhzJT5liAu4otqVIQbfqjRpU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mqhKGvZM47S0Ui5CE/SjsGfrDMt5EcHlHUjBa19iQ8KeMZio0UW8mr0RB+OvbkZUts1RFLrJ3kU1NEt74dmDGIh4HMdO1ebpFP84rK3LhgBD3JbqXeMB5hX7CGhL+TsE9JQgeCTNFgi/QsFxLhP6QmrUgxgpcdAhX/kkhMYvrHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HxigWma+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HxigWma+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89A19C2BC86
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 14:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773759176;
	bh=0//teAos5q32em+J7BmxhzJT5liAu4otqVIQbfqjRpU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HxigWma+3lSpCVf6dQY4/nnzEg3uBkDBlQ4kk0tm0f2aoMoq6XmuMRLXthroa0QKy
	 lTW9q37KlAkalqhve7JP9F56VByMWiNBI28w+XSrvCC/UStbaWIDfHcr3X8NnHRJYC
	 JFyCICsQpXyq60wsqVC+Wp14z+fzR/1JEHOowmAMSmj7ej6Umu/y1x1uOeTJYSWsur
	 uN16F8+yAc9P2r6slvz/XDwsY6hmKlFtH8FfyLDzPPlN1NaeFTKHEl3mmR7gA2IkgR
	 DBjCVZ85Y5UXka1dF1X2pHkPF/IuFXs5aVEcY1CAd2EUP/3hxbvqwYTX7/x5qdOG1u
	 CHuNGwLuHwNhg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8211EC41612; Tue, 17 Mar 2026 14:52:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Tue, 17 Mar 2026 14:52:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-e3C5VyopJp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

--- Comment #48 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
So, is there any consensus which solution should somebody try as a new atte=
mpt
to fix this?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
