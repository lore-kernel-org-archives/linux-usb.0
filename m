Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8047D18C008
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 03:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787716538; cv=none; b=biYCiJkkcPElkMpZoYkiUlG9XT/sobaGWGkb4HoBimKwge13ri+olhdTANz3t3AeEEj10ZaBXBMexgFCd+hMxzn3LxxMH2SkNGXWaRRxxjdxTAjXvjjEQ1JfMdY2U+AimOdAo59Nvap8afz+4L4lEdMm19zH647ygC6HJJK/2w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787716538; c=relaxed/simple;
	bh=JyY6JGr+jPbcAP9NCmiZu8QgkqL+g/U8FWK9cX4+dgQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uVYgWbsl2fBbItM9fHPqUyNj8J4Fs09nenHne0pXu5q8m1HhoYUVu2tlAdgL8MHlfGgxtCtT4tHJ2p5c1CtcLvKHh2dAaftUQMZmGE/QITiSZdlrjvRyIvJCR7e//rqvVLxow6iq0GwLaPEpWCrR/ce41BNupcbfaJoWg9GTQq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7ddYzib; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7ddYzib"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 049ACC2BCF6
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 03:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787716538;
	bh=JyY6JGr+jPbcAP9NCmiZu8QgkqL+g/U8FWK9cX4+dgQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=c7ddYzibAkm8ixV1QoGvv+jnez0E5evRudq+pCKWZPkgjDYewcn7w5KdEigIMnUiB
	 Urw7Rz02+pr3u6O7mWB8v4Xij9tvUF2OHrQZjAJw+B/NyEFUb/CjoKU8rs+AzxrwZZ
	 cWInRiZoWEkQAOGXJiB0TYmIWQGsj+UoFSe59OX8QyFhkThHaYKBJ/kIO1NG6ISjY2
	 FCU2yrj7BGoJStHR8SP6049OUxEkCVBhA8x2w7XVcf65DwI4BNGQs+xwScz/W69c6L
	 7cChVZH3ZcpR81adMESF6jq/rHSqn0E3SlWOG8bJlH2vE/g4M09n7Odi5zrIPLQNn7
	 mjTy/LQ9/DMtw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D5B4AC41613; Wed, 26 Aug 2026 03:55:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221142] ucsi_acpi actively breaks USB-C PD charging on Lenovo
 Legion Pro 7 (Arrow Lake)
Date: Wed, 26 Aug 2026 03:55:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: trivial
X-Bugzilla-Severity: normal
X-Bugzilla-Who: huangwei@kylinos.cn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221142-208809-tgSbbsa8BS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221142-208809@https.bugzilla.kernel.org/>
References: <bug-221142-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221142

--- Comment #3 from Wei Huang (huangwei@kylinos.cn) ---
Hi Alstergee,

Thanks for the detailed DMI info - and for the note about the AMD
sibling (83RU). I've kept the quirk to 83F5 for now, since the failure
is only confirmed on your model; 83RU can be added once someone
confirms it there.

A patch has been submitted to the linux-usb mailing list:

    usb: typec: ucsi: do not register UCSI on Lenovo Legion Pro 7 16IAX10H
=20=20=20
https://lore.kernel.org/linux-usb/20260826034658.2170407-1-huangwei@kylinos=
.cn/

It adds a DMI quirk that makes ucsi_acpi skip binding on this model,
which is functionally the same as the blacklist workaround you already
verified - the module can stay loaded, but it will not touch the EC's
UCSI mailbox.

If you have a chance to test it (build a kernel with the patch applied,
make sure ucsi_acpi is no longer blacklisted, and reboot), the
confirmation I'd need is:

  - a dmesg line like:
        ucsi_acpi USBC000:00: UCSI implementation in firmware is broken,
ignoring
  - normal PD charging restored (voltage_now non-zero, chargers hold).

If that works, it would help to have a formal Tested-by tag from you,
which lets the subsystem maintainer pick the fix up directly. Just reply
with:

    Tested-by: Alex Bartz <alex@alstergee.com>

Thanks again for the quick and thorough help!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
