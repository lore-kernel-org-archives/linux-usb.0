Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E430A344031
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 18:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773080468; cv=none; b=p05+VVbPbVijeWrlugLLsJBHr3v1JisY92rFx5IjKdU1bRBkh47rsGwDWR9qoZlBi5qJD5hoo55/5Pqkwp/ZYq+kMaWBwHf45hiL8qUg3Q8zlM+buqNG3FH7FeuHhYyOz3nByn+pP4EYB9OYNlcumif6wqsaWV86BtjqIIMhD9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773080468; c=relaxed/simple;
	bh=7ygRV/78VoZbXtLC3286bB63RhrVnQfEGpg8DoMhp5k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E0OBSs+c0ESKU2PBrcMx04gslA9o3POvzLneiN24dhUzBqiJ84OYVCuOUgbStALw5PrFdc4fhRoqrZwuxV9ubhI1u5k1lrlqg9keKaBmLl9Ud45I53HCw+sPIjrKFh4VPDL0iszzb1dHHbcCKMXJnFHsSCLPq2R/EvJJJJuAIpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPEkSTaR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPEkSTaR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78709C2BCB0
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 18:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773080467;
	bh=7ygRV/78VoZbXtLC3286bB63RhrVnQfEGpg8DoMhp5k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kPEkSTaRfmTZteBs/L0at81peHtexvejmlXRYsMV+bPKrycLXsjizC/IX/J2QrLjQ
	 O1RmQ8QWaO6hR+CChsERNsGOUmh5JzXf+iDCTd3/ZmVok8sGOmRofzzFnEG8yQJ+96
	 cttVXpKZs909kehCY2z8LgvNBALly7mUTKTwBnTRb8PefrPy1XXiu445+odzOqv0ER
	 UKwca6cYPqar7veAILQ0K0MWsVUVMd5I/sitMDBWlkHXjUrqdmv3htWC715Kv+uCil
	 SMtCTNPwWENKbcVQpTCxEotpY7I/zki0hKhtjQaB40ofeMsVux5WqS9f6dHFaD7VBp
	 ofp3kQEnuprRA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5E466C3279F; Mon,  9 Mar 2026 18:21:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220936] ASMedia ASM4242 USB 3.2 xHCI Controller gives command
 timeout
Date: Mon, 09 Mar 2026 18:21:07 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220936-208809-DBqyaYXwqs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220936-208809@https.bugzilla.kernel.org/>
References: <bug-220936-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220936

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #3 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
That's some bizarre behavior. The CMD_RUN timeout on suspend probably occurs
due to runtime autosuspend, you can disable that with

echo on > /sys/bus/pci/devices/0000:77:00.0/power/control

I wonder if this would improve anything? If not, try also

echo 0000:77:00.0 > /sys/bus/pci/drivers/xhci_hcd/unbind
echo 0000:77:00.0 > /sys/bus/pci/drivers/xhci_hcd/bind

and maybe check if power/control stays 'on' and doesn't flip back to 'auto'.

If any overclocking is involved, try without it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
