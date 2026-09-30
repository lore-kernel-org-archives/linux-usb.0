Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8446C448B9B
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 07:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754561; cv=none; b=khAR3WP8yQfr3KUoETXUjyGTchYh3KxN+mbl/gHt7VCEigT/mFZyiFDSJit6gt/NvDYXDbUL4xv36+2B8jpSRKJSoJL2enU1B03DWks3AmpfUpmMZWub4sy/Uvq6E6hbYs7glqcl81Z8NnspDONNH+fCSefoW8BxBXCkwHCwrWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754561; c=relaxed/simple;
	bh=etq+Inu/2s+Tx536Ni35WwliWjEbrm//s79L+2xuF/0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oEpYJNpJTTh8J1pdNKyWyFQFlA3o5FP8qzBo57tTHJ+jNPeMOEgSUsK9Uq5XQPX1/F2HDSMWmxTfjJx74QOYNdKL+gSfw/ieTyyAFnMUdhJGWSDR+AnX2D8KcpeHTAEN5ZOtb4IyjkTJglJUxHu6Tjx6rPIN/+JNv9Lt5ic5BY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GY91py0g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GY91py0g"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85B72C4AF15
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 07:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790754560;
	bh=etq+Inu/2s+Tx536Ni35WwliWjEbrm//s79L+2xuF/0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GY91py0gcHpI9ll8B58IehTVPPcDsDJKA+EBJWIfqoX5pA+4qAoHZRjF0FrmKKp4b
	 YVpIJ4/4/3Y1CPd67Gc9lSTYn866QlLKhaoHRe+xmmm0cdSEvSK53MIeXEiS1yY5iU
	 ekBM7IngYSyMmtK7XZyOzjY6L7NTWDZzZM4mjbFv2QMJ5F+Pnj+Vi+IPRciTQW0Y+0
	 ym9DxyHxbo5YbD8DGVS1JkVlOnvhMpTzOSR21a0CZ6mRGsG3ceERsVurmmZcJ41yn5
	 WN5ir1DnI2vYWllgpCBbu9bO20M+G/oq3Cpoi/hyCiIhh+o0KvOYtod/9KtQoqVti0
	 486FgKW+Q/mMg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 759EDC41614; Wed, 30 Sep 2026 07:49:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222071] [Bisected] [Regression] xhci_hcd: Resuming from
 hibernation fails with "Not enough host resources"
Date: Wed, 30 Sep 2026 07:49:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222071-208809-DxPTJGBjDc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222071-208809@https.bugzilla.kernel.org/>
References: <bug-222071-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222071

--- Comment #9 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
On Wed, 30 Sep 2026 06:45:29 +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D222071
>=20
> --- Comment #8 from Harald Judt (h.judt@gmx.at) ---
> Is there some quirk that makes these controllers reset themselves
> like they did before that commit? Reverting the patch helps now, but
> is not very future-proof.

The problem is not with HW but with SW - "optimize resuming from S4"
broke bandwidth calculations which the driver performs for old HW that
cannot do them itself. That's why new HW works without issues.

The driver obviously needs to be fixed, maybe Lovekesh will find the
remaining issues (already found one), or if not, I am alerting the
original culprits right now.

IMHO reverting this in mainline would be fine too - the "optimization"
is negligible while it costs bugs and copy-pasted code.

Regards,
Michal

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
