Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452424499BC
	for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 23:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783726379; cv=none; b=D1fjNsR+CWHGWYObSw/qzwpAQE4qKxq5Nh74He0Uwa+y8sw3RQfEu2qnnTleMsBZUoOsz4T6BA15bGcFhLhNESCmicAIQnPttl1dG3BAAbYYxX8fM2drXiUnlJ1WfZhul22FkGjkBZrl8NF2kBIEtHHITWVVkVihH43/s2eESF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783726379; c=relaxed/simple;
	bh=Z+2uHXTfJ2THp72hidaR51lcJXgvD+5YeO509VkT/bE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VctcxfmR6eXbppJC4SlCBf5GTLCoKkcZgM7YWjKb2gJuSIbnx1+RpV5Sz9HvoAjRGTqtw8i0SiPDPlAaWW3FT/yuUtq7s8dcEEWUWE8nHXb1r0gKQR+BWw08k92Fjrd22Upr7bDrPnQfigqbmilcnZvtd2sK2FoQLeySSvYpMWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pai9tCZo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pai9tCZo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCDCDC2BCB8
	for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 23:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783726378;
	bh=Z+2uHXTfJ2THp72hidaR51lcJXgvD+5YeO509VkT/bE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pai9tCZoa9SPA8os6Dapok/+rKNOPX9rNFTKpVloyET+GMNdRGdWtoJL3d5uXsEzc
	 qiE4Tz85f9CLH90m8rMBf9PtHAbPpAL3pDAUiik4/Dn0FhY1FfL/xUu5D9PpiCWMUe
	 uxCz5S9JTjc5Rl/VemhqKm/bSxs36O4wUvAAYEQEhP7khMChjzXHVrqpxcEcFpVX0t
	 KfT0ZdrbR2beXA1bx5gKt5NCp4U23zJDgL7U2rudf4z4mt6m52DcDgA7taY7+wrXYD
	 4aLZSHD9cuGhhSBZHwGgJGcAPTZHc/8M+ZTrjPNc9CmLnoZrcnUdo/e/zIBLFXAzCe
	 7TqDUjwq0kwMw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 984E4C433E1; Fri, 10 Jul 2026 23:32:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE2OTldIFBDSWUgbGluayBkcm9wcyBkdXJpbmcgR1BV?=
 =?UTF-8?B?IEJBUjIgaW5pdCDigJQgTWluaXNmb3J1bSBERUcyIGVHUFUgZG9jayBvdmVy?=
 =?UTF-8?B?IFRodW5kZXJib2x0IDQ=?=
Date: Fri, 10 Jul 2026 23:32:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: foss@morgwai.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221699-208809-7kv6ACZKCQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221699-208809@https.bugzilla.kernel.org/>
References: <bug-221699-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221699

Morgwai Kotarbinski (foss@morgwai.pl) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |foss@morgwai.pl

--- Comment #3 from Morgwai Kotarbinski (foss@morgwai.pl) ---
Hello @Artiom,

Recently a semi-successful Intel host + TB5 + Nvidia + Linux build have been
posted on egpu.io:

https://egpu.io/forums/builds/2023-14-lenovo-thinkpad-x1-yoga-gen-8-13th10c=
u-rtx-5090-32gbps-tb4tb5-gigabyte-aorus-ai-box-linux-ubuntu-2404-lts/

It is a result of community work and investigation documented in this NV Gi=
thub
issue:

https://github.com/NVIDIA/open-gpu-kernel-modules/issues/979

It required some drastic workarounds: reducing link speed to gen3 and only =
the
compute part is stable. Although these patches and workarounds were primari=
ly
intended for Blackwell, we were wondering in the follow-up discussion if th=
ey
could possibly help in your case also (you would need to at least add PCI I=
Ds
of your card to the patches, from what I understand).


Apart from the above, have you tried NV's proprietary flavour modules with
disabled GSP firmware? It drastically changes the situation in case of AMD
hosts and there was also a report from an Intel host user on egpu.io:

https://egpu.io/forums/thunderbolt-linux-setup/rtx-40-series-egpu-on-linux-=
mint-check-this-before-you-give-up/


Please consider creating a Work-In-Progress build on egpu.io, so that a wid=
er
community can chime-in without spamming the kernel Bugzilla.

Cheers!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
