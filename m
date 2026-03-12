Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C524E382367
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 06:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773298150; cv=none; b=fjPv4KUyf8AUOtMaJzNCL+W/jc3ab+e2AUxeZBsxO7r+8xYUL8ko2mC0H0OwXa3z/JSk18W5EJb2HzL3K2kh4Bm4OkhSdGCbqJbRMLk7sgQUvq1Y/02Ji9/zkbOFG9pQiAsPg2mZltTdPFIvrisozGQR27v43DZ6uuO2m1bGTMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773298150; c=relaxed/simple;
	bh=K6uCAEIrYkuQ3jatPBiclj7ye7x7LDgNSBPP4TMsj4Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t8yQNCiP6Gmi/RXMXzdPb8IisgOJxk8adBLqTaGhVGS4zlSQ1AN1EeZLJCEsMnhi95nzE5YXVT7x9tSyCH+RhfTbXUL/1BI6B0IPby8kLkJ7JEmftYz54eiJV27rufGKEivltTJnNf5Ry828+sMGm8lYZEo7EfCugEUXrStOuEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qIJ59+Tp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qIJ59+Tp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42DADC2BC9E
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 06:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773298150;
	bh=K6uCAEIrYkuQ3jatPBiclj7ye7x7LDgNSBPP4TMsj4Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qIJ59+Tp1sNULlqhL6PfNbn2nUeeAutWu6LYcaRyrd+XjCyd1gk2Vggk5f2H4KvrR
	 SGewIsFufEAF8hGy/WxnkvQCzpbG2zB4fWpnkv2SJCmumjd8lNrFWy1LTW5P8iQLDz
	 TiTVaY5rbgDuZ7VTzJfZ/GkKqE86eZE5EJw86gehhgD1wFNuHctVkfKl1OavRO0iec
	 bA9YnSmCNYTg0e6OIshoBMOkOcBlVrbr6szpeGtWh+Mbmg5IptsdSHC4pSHTNB1Lkp
	 SRsyvTCBtfEjgQAuKccNFxownys223mDTCYN/N/ufQi2F1r1extgt/36T8D+ixOnFK
	 qqvUqrdnoUC9g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3A0AACAB781; Thu, 12 Mar 2026 06:49:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Thu, 12 Mar 2026 06:49:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-mXcTH4RtT6@https.bugzilla.kernel.org/>
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

--- Comment #37 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Can you try this magic trick which solves all recent problems with AMD xHCI?

echo on > /sys/bus/pci/devices/0000:c4:00.4/power/control

You log shows the PCI device being runtime autosuspended and resumed
immediately before suspending again for s2idle. The above disables autosusp=
end.

Other than that, nothing really stands out. Suspend clears the RUN bit and =
INTE
bit (my addition), on resume registers are at their defaults and get restor=
ed
to pre-suspend state, INTE and RUN are enabled again. A timeout they are st=
ill
the same, except for sts/erdp flags indicating that interrupt is pending.

(In reply to Alexander F from comment #35)
> So I returned to vanilla-sources-6.19.6 manually built kernel and 20260110
> firmware, patched the kernel with the register dump patch. Interestingly =
it
> was a little harder to trigger than before, but I didn't do enough runs to
> say definitively. The files are klog-pecio-patch and klog-pecio-patch2.
Maybe it's a race condition and logging slows things down. Bottom line, it's
not a matter of xHCI interrupt control bits being cleared.

> >There are some error flags set on DevSta=20
>=20
> These flags only appear after the "HC died" occurs. (That event also adds
> (warning) taint.)
The warning is unimportant, it's just USB resume taking unexpectedly long. =
We
know it already :)

I think all we got is just more evidence that it's a PCI or x86 architecture
problem, not USB. I would mail linux-pci, or at least reassign the bug to
drivers/PCI (but not sure if this subsystem pays attention to bugzilla).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
