Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E01036E498
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 11:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142923; cv=none; b=mDKCo5MtU7zq5OfS9JsbThfbNc09zYPGfI95XlowudRIiVcVpiqtv2gQk9PSWxQ6zPKK2rucXSsCcH3aWp7QNfX9k9dBxUGI1k7NI3ye8yOaFzH7mpzfmc8hibtbtd1E8umGhNgiLaIIq0Vcrc+dthOHmeU08RHikrc1kpwfiJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142923; c=relaxed/simple;
	bh=2cf+UL6Gh4cVoHawfXVpgthPtoanHd8EPSaXiDl5vOw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LCbk8zUJlyt28nE3tdaBEu4r7Hg9vC5G/e9mpc++r5P1pLYx5DO2hxGJYRRxeWiBkeQiyQW/y5paAKvKmLcf2UySDCFQeSf+Bfg6MoYCZtVl22EkRTrk9ZtT6mgkV2PR8t3Z2D2eZP6TOpATdyfY1y5FvVt6/oL3IcSqCKHpx8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4HVawAL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4HVawAL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08227C19423
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 11:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773142923;
	bh=2cf+UL6Gh4cVoHawfXVpgthPtoanHd8EPSaXiDl5vOw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=a4HVawALy0hK/2+2d+EF6vkHIwYF0yHKvHPIAWBLU64tK2fnUi5JCaBCKaweg37zW
	 d1YHLrwcaPRWZqQFoLs3VUT7gY7JexQm6fQBOJo719P324SzObm/zdkX28iIwigyKI
	 VLh68nfXSrc/e5X/tTJ5WS2SAAh258xAHBmOKLAxXYF3RxT74nI2RdatoDY3u1qf+S
	 lkLXXKWbnHVOVumN+k6xqmfDdqxPU3FExn114uN+jQJ4DFowZP2DUcFqp1B4n9iEsu
	 KrM0Wn4n4nkwlwE5MqMSmifQA8z3HGOWB9TiJsfIrL7zTjI6/SRLCgVNUinsp7ID5I
	 SGjgutjiZcVjw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E7C37C433E1; Tue, 10 Mar 2026 11:42:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217475] Foxconn / Hon Hai Bluetooth adapter 0489:e0cd stops
 working on ThinkPad T14s AMD Gen1
Date: Tue, 10 Mar 2026 11:42:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: berto@igalia.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-217475-208809-Yq3KyTymwf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217475-208809@https.bugzilla.kernel.org/>
References: <bug-217475-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217475

Alberto Garcia (berto@igalia.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |berto@igalia.com

--- Comment #6 from Alberto Garcia (berto@igalia.com) ---
Created attachment 309604
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309604&action=3Dedit
Proposed patch: add USB autopm support to btmtk_usb_setup()

Here's the patch that I'm using, I haven't been able to reproduce the bug a=
fter
several reboots and suspend / resume cycles.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
