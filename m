Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001BE149C6F
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 00:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774569875; cv=none; b=JmlDpO6F9ksQlYhIuEXcDGx0nC6RB1RsJ4Zlj4ROEdf5PnDW3bEgJ7FMSWbl8C34kAndtcbIz3qcPDo3urkkvDCa17TOlLDf9R+QoI4VI+xe/Nn6fCG/P772IMQAoI/wBNxRl4S1c7JS7mBlst1u7viJYvXTYWyChxcGQWg6cac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774569875; c=relaxed/simple;
	bh=Tr3kxpQkxxgEj9STZnr1eSe1Noa0pc6g3BYid7Q3knA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TCjHW3T56Bk4pwR5u4bGznjzQ2Pyjp15xN0k8iCL+GYBD/j39b3NuNS1Q7Y2+D37Bsg8YrlOjhOq3XA0LPRaUCWVctLLpzBFkbbaEfztvODB+Tzch7kkQpm32L7hy2rVqNVDKBTXg+cZQevXY0d4YopYmJVO9qLgCbR050J7qvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUhGTma/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUhGTma/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67020C2BCB5
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 00:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774569874;
	bh=Tr3kxpQkxxgEj9STZnr1eSe1Noa0pc6g3BYid7Q3knA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VUhGTma/LKxpO9B1h2eDIcgKHsY9HZxSaWFGInW9dTuRi82LV1gox1DXiZOPKJHmZ
	 qwhYtq5Eh8WeVrPgAdDsdtehvARGwfavQ12275aJuBClknxdZM/SsZqMfn/8GYnnN+
	 64RN2NglMSUppxrIsyFKm+WVgI6Xg7u+zcmNu/7TrMmAprQH7F2KP8O6sR6mxjar9J
	 CYYRveUtmD+OydjXpYfZBEJEo/SQsLnO8E9ulWNkDsErA6xNh6CqBKGmE6TAM2YnHG
	 lUPfxqXT41YtQzZzHtYTne6h5x/3OSQBQIrC59q9RtvIiAKrYcCgw6YsZMNTzViACP
	 N648QADlC+KNw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 618EAC41614; Fri, 27 Mar 2026 00:04:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Fri, 27 Mar 2026 00:04:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: linux@roeck-us.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-JOsKIqq7hh@https.bugzilla.kernel.org/>
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

--- Comment #52 from Guenter Roeck (linux@roeck-us.net) ---
#51: ounds good. I'd suggest to go ahead.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
