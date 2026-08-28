Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EB43101B2
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 05:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896321; cv=none; b=b+Z95PzbJYtU1EefvkffNeJ4upy/+Gq8q5pX/JW5DLwoHF2/Z1lbbijBO+f0ZeD0dvTKS4LuupVoKih7mFf2CJCCwb0b2cvEjKuRUk2LAnDgsO9zptIO299aYvSg+FXyy76GXe7+7MqJt17jje5FQ5wuv72rWKO6vtaA4C+s5bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896321; c=relaxed/simple;
	bh=mhO40c1ipJKGhmU1oEMgT0Ag+GKapa4oSRv7NTVXgAw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Yd5yJQ5nxpu3Q83dClm1JH6Yw+ETLFxE9s5/0nfFg416L++tuPYUhMuY7i1g1p0v2OZA+YgkyyDntU7xhGyZbIQcqmfI6dCd3ThJQDmLd0uTTlXA9uj8/EwJIpcgZ0/w38DjX/j9eYK2FUxhdL82BVY3iIVC1MyBhi8WZUUoRRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbTvfizt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YbTvfizt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D7B1C19425
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 05:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787896321;
	bh=mhO40c1ipJKGhmU1oEMgT0Ag+GKapa4oSRv7NTVXgAw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YbTvfiztChEQWfGBSZDqM3U9a2NeocE7eg8afTbyF2+nqvuY0ARUrycEjE2WUfIBg
	 9Nk13vKQSylgqy3/hB7bK2ihHKe9Z07+lvN2CdjfnwwtcxpAAzxP238Ldb3d/FDaDu
	 J1zrBdZSIM7ftgdars+EsfwLjaswqsrgzgHHhr9udNxCojfgmXL9q1uuv/vfd20yZX
	 tst9snijht1scnYZXl/SPWiTQNbP1UwNbu5hs2Q6GKQTWvjRrWXKyqpzNpPlrCNnDV
	 naaJus/LF0/r/kfbJv5XEnLMZCsTzHwnIC+7BdjlyZg4y/T/Ee+3L6aGJcqDNutxFQ
	 XzOA3IhltyxZQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1DB2FC433E1; Fri, 28 Aug 2026 05:52:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Fri, 28 Aug 2026 05:52:00 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221103-208809-SIVtOctUKa@https.bugzilla.kernel.org/>
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

Lovekesh Solanki (lovekeshsolanki00@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lovekeshsolanki00@gmail.com

--- Comment #28 from Lovekesh Solanki (lovekeshsolanki00@gmail.com) ---
It may be worth getting full acpidump from the affected machine, could it be
possible the xhci controller is left inaccessible or in some weird state af=
ter
power state transition?

and also output of lspci -vvv?

Thanks,
Lovekesh

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
