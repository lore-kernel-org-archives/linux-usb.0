Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B89313531
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 13:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784725385; cv=none; b=Vb5D3imHc10bnryZaygQTyWiZX0YRJzV5sdYrxM+itNql0QkMCKZD3rUqiCixzZuIbCS6Up7S0RCIF1yd0KKg5kuu0rgLXSmcDJ+gC2/sVrjuXMHTae4mnIAWTdPKODe/IeAi/iEIaUPL7IOYCWWxRwPf3eB5kNRJRtoTGOzBRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784725385; c=relaxed/simple;
	bh=5NF7jw7uTlyZ2y7oFaxzoJDKvlLCplFZaxI5VALr1o8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MpytMWz8eJsQhGxfjdkwwLYs6xJJ8IZmFH9/u/261yTSfAkgcHSvCzumMWvWzdfaklLNvuUE2qiwJh7U6tLpfJyqpnahIlsMP655RZMtKRelkZNWMGVSRQtJ9Z6qPTq13nGhlJkTey891/g4RUcgZTHsu1FEhmA8FwVDRPuGy+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WWGnaFQH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WWGnaFQH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3FCDC19425
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 13:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784725384;
	bh=5NF7jw7uTlyZ2y7oFaxzoJDKvlLCplFZaxI5VALr1o8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WWGnaFQHg8ff8qI2BAPCX1QfyKwAZTl2/hYvb6E211MRNn7S6oBzF8J1CZZoTKPPk
	 BDBhw1wjB0+R3qp7SgjglhxioEB0+RZECojMXp/hNHbLf4AMgC4cn3We+8LsjalPsx
	 txQPXuh+IWbYTxRRTKtaVV7RnErD8CKqp8ZaFq4XnwHOLykO0bM/1Bu8xA/0MbpZt4
	 uX2zlwCNoxdbp690CGgdEfIqzrv4vwu1/DtQeFcIPEPEYjWXACxs17Sa8gPxd4vJcS
	 YJH2xbVsZ7REYJ8rDHlGSJ7f12o0s2AhRaiS8Lqvx8tN/+87kwx5UMc+WfYxMlO8Xb
	 Z7XIZQkFQI+Gw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AF1E6C4160E; Wed, 22 Jul 2026 13:03:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221774] hid-multitouch: report ID mismatch check breaks
 touchpad palm detection on ASUS ROG Flow Z13 (2025) GZ302EA (0b05:1a30)
Date: Wed, 22 Jul 2026 13:03:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mayhemandcoffee@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221774-208809-DDEMtjKLSi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221774-208809@https.bugzilla.kernel.org/>
References: <bug-221774-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221774

--- Comment #3 from mayhemandcoffee@gmail.com ---
(In reply to Lovekesh Solanki from comment #2)
> It is possible the commit e716edafedad causes mt_get_feature() to reject =
the
> Win8 response due to firmware returning mismatched report Id. So
> hid_report_raw_event() is never reached and device doesn't switch into
> Precision mode.
> Rather than reverting the commit, which would drop the ID check for every
> device, it may be possible to add a quirk for 0b05:1a30 so only this model
> tolerates the mismatch.
>=20
> I have prepared a patch which does that, but I don't have the hardware so=
 I
> cannot confirm.
> Would it be possible for someone to test it? I'm not sure how to send it
> here I'm not familiar with the process.

I have the affected hardware (ASUS ROG Flow Z13 2025, keyboard touchpad VID=
:PID
0b05:1a30) and I'm happy to test your patch. Please attach it or send it in
whatever format is easiest.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
