Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3523B2F12C6
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 09:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777282253; cv=none; b=POgZ1DijRmE6DeXi7m7o0Q6u6J4kUup8KpoAjv3+znaFxw6Hee7ZXevz7A4Q+ICsC1kyg29jcsOWkhdyILmyNmDTSCk2L9rmsGYErwQpXVirK2etOoke+xHmGG5Th9iG+u6olPL2f7jSRoyuyiDHNy1wKESOebxe4apnqHdePGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777282253; c=relaxed/simple;
	bh=c83iVeeBNDrqMecbmGxvaVuY/w25fMbRx/tLtGOO3Ak=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N0KwLozM0L5++xOBZWq07+LgmTrddHe5v8kSqjc3MRoRCG4apkc7DWcXU4Ot50IY7EI7N0RfvS+W26XMUzlNvs5oGrd3Z8KGdslRe/oxdoQRPCpRcaL3GYdrecyKDvv4JB7tbwxAveagFytbFhqAYuV5DemLYWscuJr7NAZH3gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pj117qms; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pj117qms"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F4C6C19425
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 09:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777282252;
	bh=c83iVeeBNDrqMecbmGxvaVuY/w25fMbRx/tLtGOO3Ak=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pj117qms/SJKSeEhQT6CT8e4Lsn8M6wnyHaqt5O9RcwAWAmKA6inUP8LdftUTgj9A
	 q5J09fUrZNsHFMsB4KmszCXH/v3HB+zWFD7i/BPHlGCavrEFSWsj+o8EsDuhsdvel7
	 o8F5VJSQXAwE4MvOUZG0VF/l0mRrO0g0+NGSpqSJsn6oGuTNM4Xn52MghHjnVWGx9s
	 uNLr1lZmg7qllMmJolj1ZjtChubOejUaGJU3NjVZo9OnU2qL27Vwd8Kdg+e6En4Eka
	 duNCfZRTdDDwWSmmHCRsEwFjv4hth/1HSHYAtQ8RkvKWg50kL0F/f43XVLVwwbH/fE
	 JoLv7apqZ620g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8E27AC433E1; Mon, 27 Apr 2026 09:30:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221424] USB auto disconnection
Date: Mon, 27 Apr 2026 09:30:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221424-208809-eKQKdCGwEl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221424-208809@https.bugzilla.kernel.org/>
References: <bug-221424-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221424

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
Can you test Windows on the same hardware?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
