Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393F13655C4
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 20:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784926612; cv=none; b=aNHMtxlyKCs7reITADK/IhD9Wy3qun5elwE3mGbWcO/0mtHdhfY0nu98SOaKrOKb8bzccJRvOhy2/Fd7OHQ8hLdUJcDgDHUTLt1nAXpjEv9zGa98M6hW0DKQHiFXxqe6Sd3/z7Z6Nc7PCtwZ+gwLHTTt7FTN7nZM2buNMovAxZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784926612; c=relaxed/simple;
	bh=Tmk/rcwFT+/vUaVyLt426NsK4tFollFeauIWKFQvpt0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uksfgm1LIthwCUlnXMDm+MR1feztT+98aJXSvVBoEYFPzbp7x9tBLhSi1DiqNCer8HNkWi/IT1eOCMW8UgYL3iZGZnCARvFFlwcHCB+tpd+LlzzLHYU57HR9mEbxZy0Y6P0OFiOEps1FzDWWlfUPud0z9TC49jgjOFC51LFP8RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cyYOwPz5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cyYOwPz5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7913BC19425
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 20:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784926611;
	bh=Tmk/rcwFT+/vUaVyLt426NsK4tFollFeauIWKFQvpt0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cyYOwPz58niECre90o3Zuqw/F+HgDSuMz3B+XV3b6wZDhkARwrUEGSczjn/BaQeQ3
	 rCr6ShuXEpt54cDgmFNCiUwj4TxOMRnkMb7sQmFL1D4HxKS2B9Kxngla2F+x9TxGzg
	 kh0UphWpr8R47djTjsBhlncokpD6sLY60p0fC2Tc/UiSxciM9ui17PCFn02Izyu5jZ
	 6FoNbWNSff4iLCjVIEKBtyFBOiPXS5TuCqdZrIiza5+8iQHxlMLNlLdstK5htIIb55
	 LPyaokBdQuuY2ywOXFKucE+4TlRrINXNI4y4vl9JcZmY4grm3WkkY2oeAJEQ1Poidc
	 oka3Ct2A+TSXQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 66BD4C433E1; Fri, 24 Jul 2026 20:56:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE3ODVdIEFNRCBTdHJpeCBIYWxvIChBU1VTIEdaMzAy?=
 =?UTF-8?B?RUEpOiBUQjQgZG9jaydzIFVTQiAyLjAgdXBzdHJlYW0gbmV2ZXIgZW51bWVy?=
 =?UTF-8?B?YXRlcyBvbiB4SENJIGNvbXBhbmlvbiBwb3J0IOKAlCAiQ2Fubm90IGVuYWJs?=
 =?UTF-8?B?ZSIgeDQsIHBvd2VyIGN5Y2xlLCBnaXZlcyB1cDsgVVNCNCBsaW5rIGFuZCBV?=
 =?UTF-8?B?U0IzIHR1bm5lbCB3b3Jr?=
Date: Fri, 24 Jul 2026 20:56:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lkorcm@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221785-208809-SgY6XpjzyZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221785-208809@https.bugzilla.kernel.org/>
References: <bug-221785-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221785

--- Comment #3 from lkorcm@gmail.com ---
Created attachment 310502
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310502&action=3Dedit
dmesg =E2=80=94 full boot + all plug cycles

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
