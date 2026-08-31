Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04668376A19
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 19:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788204779; cv=none; b=TpGGV69cD/keiUr2Z9W4z96KeE7UHiTon5lABuYyKvEkWlwT6UmY71Aa7G3GWXqQyHHLm8bcFTzs74KC3tH1ybGcxSBshV024lcJp4aThYvlSS/DOX6YVer8Ix3xchBs+dGSERWlBDgHFCYR6LEgCPT/Hoq9ezDzUtVJcev4ZIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788204779; c=relaxed/simple;
	bh=/MqpCyzDCITgI/1kPlYANem8LboCmY2/oEEcGhB83cQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lbGZFkGnf2aibR+uIWX/kSqrDX5MXWK57/k1wYfz8Hy9y+KV5/Hfbw0VBgOG06yyzv7TuoAyvBy1srkyDsSAs49zC3SrutuscANmru61xk3s5oTGBzhheWSHnxCKJG0olfScIW4J2AODXeL6BSJ+s1DD8O73Z6x6O9P3qV/vQLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NqzPgnbc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NqzPgnbc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CF88C2BCB8
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 19:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788204778;
	bh=/MqpCyzDCITgI/1kPlYANem8LboCmY2/oEEcGhB83cQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NqzPgnbcRnoiBs6gZ+emc5Zy+DAUyd3miMq5JsMNz18A5KeqJdDzskx3a55T1OBp6
	 vVRXBUTkBUZvmiVSjeMOAFEXdxVTa4h8INFuwcNWzvCTLnU3hsIZAF1be9Ftevyrd0
	 O+QQEigsikJNu1/GXwqyY4M/t2X0bluEDyeLQMl8oH7saTUJX4Kms4oWDzMgA1a086
	 ydPTcgGunz27aBmN9k7tTC+u/mlvZBGAluylxx5Yq78p5BcKwUNUiF0m26gMi5aoLT
	 qtVP7nEAOh4XlfC7LTEgvIkeQ9hU9lCg77Ag6hYaNyWYJAaloRH9UBxdwov/9vNjks
	 rUAH6JcegXFEA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6D2C2C433E1; Mon, 31 Aug 2026 19:32:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Mon, 31 Aug 2026 19:32:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lovekeshsolanki00@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-5TRopCGCle@https.bugzilla.kernel.org/>
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

--- Comment #36 from Lovekesh Solanki (lovekeshsolanki00@gmail.com) ---
I have posted a patch series that addresses
https://lore.kernel.org/linux-usb/07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leem=
huis.info/

It should fix your issue.

Link to the series:
https://lore.kernel.org/all/20260831190349.29590-2-lovekeshsolanki00@gmail.=
com/T/#u

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
