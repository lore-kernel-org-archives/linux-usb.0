Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3753631B833
	for <linux-usb@vger.kernel.org>; Sun, 12 Jul 2026 15:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783869820; cv=none; b=tRG/MHKkmWEkxjQmigRCcR9a5423ydA9wJj378au9Jbt0F/wnZPoT+/Vhvs7hxAkeKRfNWOWZQ7cV6ilAhNhz43GxWE7eicdUrhs7do9Oaq9FMkK/3ITW56J++Nx9qBsSi6feoIznm0HHpRdRHmb6+Sz0Dy31bJFpNnpw8DPfQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783869820; c=relaxed/simple;
	bh=a32gyje3VNhuaBNzcg4W07Eaci0uG04Sw+Bq4aMt2wY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CXSZJl3ZepCqGECZskj+bXwKbeDWz1zp/cKX6OXn5mOFhFLQdnfZYsEJ6rugRg61fKsO8MYVmHHX2NnMVAfEtosVP3JLOCYNfk4rAKSrTqnDymyAf9gaeGYSNzbG+fEg6tYONTJXk8dV8lxgGI4e7MczG//ekEfEA7pi6BVcFaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYz+n5VI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYz+n5VI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B728EC2BCFA
	for <linux-usb@vger.kernel.org>; Sun, 12 Jul 2026 15:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783869819;
	bh=a32gyje3VNhuaBNzcg4W07Eaci0uG04Sw+Bq4aMt2wY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QYz+n5VIFYX7U4vJLKOcnU52jBSmtTlIf7ZMWYIvHF20azCopgg0PDhXE6urbDtCh
	 Mkm9y2nyJhLXTiBZlvuL+W8Gxifv2L4poxTHAbs1y717PcnAMR0iF13NRrD1YuSJmL
	 fiNqnKx9v4fdPwcZv9FyICbiE65kVkaLwEmvyAvunQDGIjfKCYX7lvODO5oA7+oF1W
	 mPmfUaa1txQMhQlGFdeRPE1xw9UAndxaxw7GtH9zIzwZ/avpn/eV7ovYT6gDw6HY2B
	 meCXPCYAE69iIf2s+BSIPhNZqcMEkk+QJHX7Nw67o8Uapgq/foccZr0HPbb7Z/tXIX
	 TKIrU0YmjY/Rg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A1A79C41613; Sun, 12 Jul 2026 15:23:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Sun, 12 Jul 2026 15:23:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: superveridical@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-CEGjiu3jc7@https.bugzilla.kernel.org/>
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

--- Comment #50 from Alexander F (superveridical@gmail.com) ---
Kernel version: 7.1.3 (Gentoo vanilla-sources, localmodconfig from 6.19.6)
linux-firmware version: 20260110
BIOS: 311 (haven't changed, no new versions)
All other software: haven't changed

First I established the failure rate baseline on the new version of the ker=
nel.
Got "HC died" on the following number of sleep cycles with reboots in-betwe=
en:
2,2,15,3,10,10.=20

I used this command for testing:

while true; do sleep 5; rtcwake -m freeze -s 7; if dmesg | grep -q "HC died=
";
then break; fi; done;=20

The patch didn't apply cleanly to this version, so I had to tweak this part
manually:

1357    /* Mandatory transition delays; see PCI PM 1.2. */
1358    if (state =3D=3D PCI_D3hot)
1359            pci_dev_d3hot_sleep(dev);
1360    else if (state =3D=3D PCI_D2)
1361            udelay(PCI_PM_D2_DELAY);

Unfortunately it still failed. First on the 2nd cycle, then on the 8th.

I can update firmware / other things if needed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
