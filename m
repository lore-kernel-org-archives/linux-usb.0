Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E131F43932C
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 04:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783572405; cv=none; b=jGmPwC25aHxYBzwVuTSOBABb8lmXlPgigx+l6hexArxmmvBE+KV5nDAdEkth9EVK1AFZfd3m6+H7WuxyPGsgPGPGOArn/ppZMX1FNTkF3SpQTznzCFZd7sMbUS9IINfl931m4RTyK/mefpY5RlW44nvW5URNdRZg/ltjJmKWAgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783572405; c=relaxed/simple;
	bh=ADdMl63DMkQxJCAZPkZZhOu+qXIGFWaI14LLAokMtxA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S7lq1HdKgyM11QKEZxNRgkceq4/1tm/bGB/xT8BGijRpCGsIg8Vqc/r3UdLfWg5iFYXPS/9FgLjNcG5D6DDn9qoqxO/D1DVyZFq0TtAnMKAxxChBJPWvqJ6dVax6x7ghgOGodMjhjdUvSpt+GjDEHe7vcgUp5hnwnLIEw+fWliA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQqzivSH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQqzivSH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82261C2BCF7
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 04:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783572404;
	bh=ADdMl63DMkQxJCAZPkZZhOu+qXIGFWaI14LLAokMtxA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OQqzivSHYAxahxRbCQAId88h2UbfWX6qGBRgLIzgE2LImddjWBg6dirCmwsf0eayr
	 /RorxwsUGwLQAIe4x/eF90nnLQilsLKYrg3yYW9OFQI/bOzvCSGGoutX7HRCafHcvL
	 fIxwtlDvwK6xzEDDVRCOn6pO+IlN5yL7Z174X5nEFQrbTJD8QfgrAyNZNtoM8WFo2+
	 LUHeL5HL7zDWARcwKPenbvdqGn8fJlENnIha/hOGy+vFC19zURI/6ohmHM8l/WQQQU
	 QSNIeILhkRpX7MM8E3iTb0yTAxij5ITZ8CdmCiTS2sr4PzSo2ctdAq5+LBJHle37ji
	 hs5pI0C7HANgQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 66D09C41614; Thu,  9 Jul 2026 04:46:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Thu, 09 Jul 2026 04:46:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: david.c.hubbard@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-vFgz8V5nhL@https.bugzilla.kernel.org/>
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

--- Comment #47 from David Hubbard (david.c.hubbard@gmail.com) ---
The patch fixes the issue for my Framework Desktop, AMD Ryzen aimax+ 395 /
Radeon 8060S

I tested first without the patch, kernel 6.17.7, to verify the bug behavior:

4 attempts to reproduce: wake fine, then 3x xhci bug

Then I applied the patch to the 6.17.7 tree. Hunk #4 I had to modify to mat=
ch
6.17.7, removing the braces in the if block.

4 attempts to reproduce: 4x wake fine, no bug

My test procedure:

1. Reboot into the BIOS and change the iGPU config from Auto > Manual, and =
the
iGPU reserved memory from 0.5G > 32G
2. Boot 6.17.7
3. systemctl suspend
4. Wait about 60 sec
5. Wake the machine from a keyboard connected to the specific USB-A in the =
rear
that corresponds to 0000:c2:00.4
6. If the bug appears, I save dmesg and reboot. dmesg shows these errors:

kernel: xhci_hcd 0000:c2:00.4: xHCI host not responding to stop endpoint
command
kernel: xhci_hcd 0000:c2:00.4: xHCI host controller not responding, assume =
dead
kernel: xhci_hcd 0000:c2:00.4: HC died; cleaning up
kernel: usb 2-1: PM: dpm_run_callback(): usb_dev_resume returns -22
kernel: usb 1-1: PM: dpm_run_callback(): usb_dev_resume returns -22
kernel: usb 2-1: PM: failed to resume async: error -22
kernel: usb 1-1: PM: failed to resume async: error -22

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
