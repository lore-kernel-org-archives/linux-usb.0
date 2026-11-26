Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795715943;
	b=hdxPv7ngtKFZUOqJ19ZUy3gAJgw+PbhnxfVx/cmD6L0zWwzjvrmndJ00ZD09zvhaByxd
	 z3mrI73B8n5DUljsBxEhLzS81szfPxdiDx+f8THpWqAm8fPKxP3yAaAW8WIH2zJyy7P1I
	 HwwCp2BeCuc28vnp+tYOlsRAIIM/71VGTQwS7OJfWBWNi6vjCWgPK6Zf/Rb1XyYD5gFP/
	 Ez7vTt0MwAqqc8i3EWrUpSNzSVDbVU66iLXhEejhZxDyZeHbod/DFOzMnLqrz2KofN7uC
	 oRkF9unld8C9rn6EEvKUOnYkGr7nRIgPx0x35BgIZtXfGk6/UNqHhSzf35AxeXDbUkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795715943;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=ItMunvD+uLlMStJ8iLnEA101Op+cgKKT9OdHx5q2CtU=;
	b=ZjJm2Zvwi6OwMj/GF9qnlWWHk/kY89PMBYNlIAFtoYt2GsjgBTxPEI5JWU3JTEpuMzqP
	 uQi8b1r0asbWm2c+RGwtBCUoWuQPimRdab5hE/2pXVxpibS0xUdItwu/3Pr/14jU2a7xh
	 5goPlnwQ1aNS0kAUldYz4LgDV5Dc9UANXr+agDrLC5YXGA1DNWtnknBMk3HgLRLDF8c+u
	 XmL/EIZEWCSRk45FKNOK7U9iGYJWXa6THA9Tx9fphUsqvGDx1i1/IAICoimZAaV/LqQbd
	 0SPWpB+iWyeFtQyl4cVHW1VX6vHl9fIoV1THWPmo4YYYMOGmMuVUvn16b3g47JnRp9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l6ndb5v4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906E2606A31E
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 17:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l6ndb5v4
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E0901F000C0
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 17:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795715943;
	bh=ItMunvD+uLlMStJ8iLnEA101Op+cgKKT9OdHx5q2CtU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=l6ndb5v43G+XIVsP/xPbG7oQ0UcrXQsSxNrzKJn12vkCuJ29eBeYrQ494lDXrAalL
	 d2M4HgdBkEpsIpiFORNYTrTZBbBfRicBSLTyuxbAGB6qypHZQ4sKPx+EpIuUp8LGXt
	 7mZviyyiC1I23Nv3BfDHRaZVTPObNltWwT9Dd5jfCQOZdb8LdkNtnF7s29w09x5726
	 fqjzR6mLmT4olZtnuIADKHAAPY9HynIcNmVR/EENtmAceQ3ZKKRuJzshvVx0b4/Yyw
	 1vcJtbxH2aMDmWNOC5z/MNv92x12/yMB2Wp/XGOx7ZIkHbHtvb+SnNGem0lYqGCGke
	 XsHuLurbGMHfQ==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 18F72240040D; Thu, 26 Nov 2026 17:59:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222328] xhci: ASMedia ASM2142/ASM3142 [1b21:2142] skips
 transfer event for bulk TRB before link TRB -> UVC stream (Elgato 4K X, 10
 Gbps) stalls with "not part of TD"
Date: Thu, 26 Nov 2026 17:59:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: drastic-vivid-7557@shy.email
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222328-208809-GtLcdp4Mqt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222328-208809@https.bugzilla.kernel.org/>
References: <bug-222328-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222328

--- Comment #5 from drastic-vivid-7557@shy.email ---
Tested attachment 311585, and it fixes it for me.

Setup: 7.3.4-ogc10.1.fc45 (Bazzite / OGC kernel) rebuilt from the same tree=
 and
config, with only this patch added.
Hardware: ASM3142 [1b21:2142] on a PCIe x1 card (8 GT/s x1), Elgato 4K X
plugged directly into the card (no hub).

ffmpeg v4l2 capture, 10 s per mode, frames received:

Elgato at 5 Gbps (0fd9:009c):
  NV12  1920x1080@60  : 595 frames (59.5 fps)
  MJPEG 3840x2160@60  : 555 frames in 9.3 s (~60 fps)
  NV12  3840x2160@30  : 277 frames in 9.4 s (~30 fps)

Elgato at 10 Gbps (0fd9:009b), after replugging:
  NV12  1920x1080@60  : 595 frames (59.5 fps)
  NV12  3840x2160@60  : 554 frames (55 fps)
  MJPEG 3840x2160@60  : 558 frames in 9.4 s (~60 fps)

"not part of TD" messages: 0 for the whole boot, across both speeds and a
replug.
Without the patch, the same hardware gets 1-2 frames in 5-10 s in every mod=
e.

For comparison, Windows 11 on the same card gets 35 fps for NV12 4K60, so t=
his
is even better.

Thanks a lot! Happy to test a final version too.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
