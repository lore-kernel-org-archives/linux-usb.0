Received: from mail-07.mail-europe.com (mail-07.mail-europe.com [37.187.220.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CFF312814
	for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 02:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.187.220.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790388419; cv=none; b=G7kLh2X9u8oA7ld65ACYPMWAZxlX4i7cwRVhtqywFo4H6bHnij+9hd0x4d/MJl8HRtZ/RSE/t/6af1jckmWFKShgogeG5Os3gPeIpCdlPSZZJzMtlo+G38+8GERCttSAHeXhlr0zWaIkn6N/jGeRbMS4Ch99+6CRALC1B0kqc+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790388419; c=relaxed/simple;
	bh=VhyOUNkClTraqDHBN6MTNiqInGIpI8/9xSnb1beTaj4=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eYyRYTEMQPpnpr167dD2hLrIsHAdNRELuq/UHSkgoFoxmjXGxovtHQirgiz+lfmPJKV7iKFDz3blU+FRENm/VbZ/jeX8XAKIDlVupPo00a346iTHUTEoEcRu+MNrQm6GQR29vmCBwRhjZVWPvnlNaUkbGVSYFj9t/p+sFhpEA4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=42fifty.dev; spf=pass smtp.mailfrom=42fifty.dev; dkim=pass (2048-bit key) header.d=42fifty.dev header.i=@42fifty.dev header.b=VHPlOgzo; arc=none smtp.client-ip=37.187.220.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=42fifty.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=42fifty.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=42fifty.dev header.i=@42fifty.dev header.b="VHPlOgzo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=42fifty.dev;
	s=protonmail3; t=1790388405; x=1790647605;
	bh=VhyOUNkClTraqDHBN6MTNiqInGIpI8/9xSnb1beTaj4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=VHPlOgzoZlXg5dImYPsyt1UDhKPpJjeLN2swvitIyVW718a9zIaOZyRErbMSVANHA
	 tm1kbj+OHPsp6sDpOGNDCUQbHsOMOu0OcTQXCKZhYQwmEz6AQH14jNP6hgf9a3/vVQ
	 qw9GuUYUqmsGOWSm0Q9nzj6ZmjdXBpats7qsW96jcBAsyV5YlAAuameboJJACEwYM1
	 Xiz7fPV33RL+YEOihIj7f0RLuVwCN/aPJFSp5v/Kw+2zkdIPODoydfaqYBRxfHxiI2
	 foZCVz6x3I9RlgII1aSHDqL/iWw6Ea0Deal5sJ+RkFcSdPl1TVfRX8NNWv9/9WCqVZ
	 TkdZAHK3Ben5g==
Date: Sat, 26 Sep 2026 02:06:42 +0000
To: "westeri@kernel.org" <westeri@kernel.org>, "andreas.noever@gmail.com" <andreas.noever@gmail.com>, "YehezkelShB@gmail.com" <YehezkelShB@gmail.com>
From: brandon.proulx@42fifty.dev
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Thunderbolt: reboot hangs in nhi_pci_remove() with CalDigit TS5 Plus on AMD Strix Halo
Message-ID: <3jbg0iV8op7Un2K3xLx2Y9Y_m8MbrxhUGm6y7eIO-UhE20lCXE321cO3Vd3IzDkBMy55DMA4A84SBZfOxoje_UHglYaYP9PxfvrstgSZd9E=@42fifty.dev>
Feedback-ID: 145570432:user:proton
X-Pm-Message-ID: ecc79e804e4d99984593c1d0a3aff786a09382d6
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------8f9982a936e726f2d668dc27ffeb655d115b1a196da2568728d7eb993d19feae"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------8f9982a936e726f2d668dc27ffeb655d115b1a196da2568728d7eb993d19feae
Content-Type: multipart/mixed;boundary=---------------------1b382568cab9349818cbe29725f8378c

-----------------------1b382568cab9349818cbe29725f8378c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hi,
On a Framework Desktop (AMD Ryzen AI Max 300 / Strix Halo) with a CalDigit
TS5 Plus attached, reboot never completes. After systemd finishes, PID 1
sits in D state in nhi_pci_remove() during device_shutdown() and the
machine never resets. The hardware watchdog does not fire either. Only the
power button recovers it.

Hardware:
=C2=A0 System: =C2=A0Framework Desktop (AMD Ryzen AI Max 300 Series), BIOS=
 03.06 (2026-07-13)
=C2=A0 Host routers:
=C2=A0 =C2=A0 c5:00.5 AMD Strix Halo USB4 Host Router [1022:158d], subsys =
[f111:000a]
=C2=A0 =C2=A0 c5:00.6 AMD Strix Halo USB4 Host Router [1022:158e], subsys =
[f111:000a]
=C2=A0 Device: =C2=A0CalDigit TS5 Plus (thunderbolt 1-2, domain1 on c5:00.=
6), gen 4, NVM 64.c1

Kernel: 7.2.5 (distribution build 7.2.5-3-omarchy, Arch-based)
thunderbolt.host_reset=3DY (default)

Stack of PID 1, sampled every few seconds from reboot until power-off.
Unchanged from 21:02:02 to 21:07:27:

=C2=A0 [<0>] nhi_pci_remove+0x53/0x60 [thunderbolt]
=C2=A0 [<0>] pci_device_shutdown+0x3e/0x80
=C2=A0 [<0>] device_shutdown+0x169/0x1d0
=C2=A0 [<0>] kernel_restart+0x3a/0x70
=C2=A0 [<0>] __do_sys_reboot+0x22b/0x270
=C2=A0 [<0>] do_syscall_64+0xaa/0x690
=C2=A0 [<0>] entry_SYSCALL_64_after_hwframe+0x76/0x7e

The offset lands on the wait_for_completion(&nhi->domain_released) after
tb_domain_remove(), so it looks like the last reference to the domain is
never dropped while the TS5 Plus is connected. Unbinding the NHI via sysfs
(echo 0000:c5:00.6 > /sys/bus/pci/drivers/thunderbolt/unbind) before reboo=
t
blocks in the same place (unbind_store -> nhi_pci_remove).

Reproduction:
=C2=A0 1. Boot with the TS5 Plus connected to a rear USB4 port.
=C2=A0 2. systemctl reboot
=C2=A0 3. Machine hangs after the last systemd message and never resets.

Current workaround: sync, then SysRq-b (emergency_restart), which skips th=
e
device_shutdown() walk.

Thanks,
Brandon Proulx
-----------------------1b382568cab9349818cbe29725f8378c
Content-Type: application/pgp-keys; filename="publickey - brandon.proulx@42fifty.dev - 0x5945A321.asc"; name="publickey - brandon.proulx@42fifty.dev - 0x5945A321.asc"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - brandon.proulx@42fifty.dev - 0x5945A321.asc"; name="publickey - brandon.proulx@42fifty.dev - 0x5945A321.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgp4ak1FYURtYVpSWUpLd1lCQkFI
YVJ3OEJBUWRBSFBwS1R6R05wUVRFMlZyUlkzUVNBRFhRalRpOVFVT2EKWlRBUGxNUVRIeXZOTjJK
eVlXNWtiMjR1Y0hKdmRXeDRRRFF5Wm1sbWRIa3VaR1YySUR4aWNtRnVaRzl1CkxuQnliM1ZzZUVB
ME1tWnBablI1TG1SbGRqN0N3QkVFRXhZS0FJTUZnbWc1bW1VREN3a0hDWkMvV1hjagpMUU5GTFVV
VUFBQUFBQUFjQUNCellXeDBRRzV2ZEdGMGFXOXVjeTV2Y0dWdWNHZHdhbk11YjNKbk9PWjMKWmhG
TUlrR3BJVTJjYW01bXhQMjBFUis0MGFNNnFjSndiRWFDSU40REZRb0lCQllBQWdFQ0dRRUNtd01D
CkhnRVdJUVJaUmFNaFpMTTBsWGw2TlorL1dYY2pMUU5GTFFBQXZBQUEvamIyYzJ1ZHQ1b0RoMkkz
VWJYQwpVdkxVNWM4ZGJUMDVjS3VmSmFWS2x4cjBBUURXenNQNC9RMG9sNmNQZktSME1KamJObjFS
MXk4Q1RxL1IKUjBHcnVCMkNDczQ0QkdnNW1tVVNDaXNHQVFRQmwxVUJCUUVCQjBETEVJM3J0TENt
RjRGeTQxbFZjazluCkhVeTFRTGszM2ZReXlRUTdyeTliSGdNQkNBZkN2Z1FZRmdvQWNBV0NhRG1h
WlFtUXYxbDNJeTBEUlMxRgpGQUFBQUFBQUhBQWdjMkZzZEVCdWIzUmhkR2x2Ym5NdWIzQmxibkJu
Y0dwekxtOXlaeGZoT0taWW94a3QKRUUrRDlqS3gxWkIyQ3ZvVFpLY1hLanJ4a0x1MTFhRk1BcHNN
RmlFRVdVV2pJV1N6TkpWNWVqV2Z2MWwzCkl5MERSUzBBQUNDbUFRQ2NPL01ydmJDZXJZOWJUenZG
WGxtS0tWeDM5ajJibmRHTGpjYW5leUNuM0FEKwpJK1AxYnpkdDJJZmZ1dFdweXdsQUdmNVJTT1NZ
UUNYRUhMdEg0NTV6QkE0PQo9Q3VNUAotLS0tLUVORCBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0t
Cg==
-----------------------1b382568cab9349818cbe29725f8378c--

--------8f9982a936e726f2d668dc27ffeb655d115b1a196da2568728d7eb993d19feae
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0Fgmq3KKMJEL9ZdyMtA0UtRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmeQmwy35GR9nnnaGLnKuHckaaEPXIHTmQ2AAxUg
LFSFBxYhBFlFoyFkszSVeXo1n79ZdyMtA0UtAACvgwD/RP+wmhzv4Ezvg6gZ
/uiPhO6KLHi7/+yTH+7coX2TaDgBALuDSdMh+2Mpz3KCU7saF4gLsoRPuazQ
MD3z+8iuVGAB
=uq9G
-----END PGP SIGNATURE-----


--------8f9982a936e726f2d668dc27ffeb655d115b1a196da2568728d7eb993d19feae--

