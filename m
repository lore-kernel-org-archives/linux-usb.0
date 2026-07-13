Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA76A29BDB1
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 21:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783979662; cv=none; b=VWMdnaM92bCm/uW4f4pW/wWafO8vIvPB+IwWOs2+7IDqjgsdAM9DqlIPWalmSYfBRjXGx5ulRT2wD+s8W9IVnlwW3nYJ31Hf63Nzb//L5vHqMP9JO2wwPZDF9DtpsJQIBsL0yBBTVqrwYom+SKZTropFG3SuvAXBiHsZEkAbUjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783979662; c=relaxed/simple;
	bh=uLgMEeD8jMQalVmin4k0fbAk5BVDAi4b/spDaGFvEEE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XujMpUydy+/QLCGIqOsQqWAJYLMZl41Cgu0Ahdrdqp8SvNtl4mD3xnjI/eCKWU7TDZxISITjWcHVYiyyAB2rXQ3YSebBAwegKvrYMXHSokymXhfjRfc7FR7y0JR/qchctYnX+GAPhtv3+JnRT40Evf8RoF08NQnzcBGI+kNXuvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CSVk2FkC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CSVk2FkC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56AFEC2BCFC
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 21:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783979662;
	bh=uLgMEeD8jMQalVmin4k0fbAk5BVDAi4b/spDaGFvEEE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CSVk2FkCacoYcLHdMHIVamnx9CgZs37ekdm7iLRfDmiTsSuEeMfpvP7aL5rNE82WA
	 oCMflVtmGWjq2O7ARx5tAEvLrQ3fmD/vuNn4vD7C94p8wMXzl1FbERkeNBsgZ3BKgw
	 JNYHBdmYPqar6Jku9fIa/YAOSSiQgyZq4wr/qwZrQlSPQTP0K1roIw7RDz1tzpN9ug
	 rebpTiXOeEn3XPE/jJ47KmWBiqmTKl6li1ihkSwzzlCs8CUs36zbh/HejCfd7e58nv
	 qH3Fsl2RxrQT4c3iXcq67lxF39p4janD0tq9QgyMJcNij27IIDnOhyMqpU8DyOaUJN
	 PCw5nmeiiy/Gg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4791EC41616; Mon, 13 Jul 2026 21:54:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Mon, 13 Jul 2026 21:54:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-sxkkxr2etS@https.bugzilla.kernel.org/>
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

--- Comment #64 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
When you say rapid - how rapid is rapid?  Less than 4s?  I ask because
stressing to less than 4s is more intense than what we test internally on
reference hardware.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
