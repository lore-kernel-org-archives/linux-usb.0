Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE714F85A9
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 20:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790627413; cv=none; b=rJxetM71kc88QtwEzmqvdsRwEKIk3A59dIDeffXf0QYe1ssc3hE9SOqXR71/ZQivWqt78TEyhTgOruWsixuML+qSZxnrkvvBkQdGKw4035IqcnEAigNpxOw/HzG5wCZUd73nb/LLzT6P0irUyIvaM6iu3R1mEC7zSMRrYwvfHtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790627413; c=relaxed/simple;
	bh=fIzBN1gDpzE53N2u2vf4wKY9whhgP1arEbReroV7aHU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cJbSdfRcWZRsmQu3tk1IS8lTUA8dz9KXgUkSBNEQFlB9lr0OCXcRWKr/SyGFfaOgsoMBflcZxIQDgNISDpBL/7q96HQpLN0NcZaDYMW0Y01uY7XcL2dfvbgG7O8FyhHECg5+AQzpvq0TzJe2uh8U6XkeEmnTLmV1jDOl13Z6tWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=42fifty.dev; spf=pass smtp.mailfrom=42fifty.dev; dkim=pass (2048-bit key) header.d=42fifty.dev header.i=@42fifty.dev header.b=tTThW1qU; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=42fifty.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=42fifty.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=42fifty.dev header.i=@42fifty.dev header.b="tTThW1qU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=42fifty.dev;
	s=protonmail3; t=1790627401; x=1790886601;
	bh=AFpVUOY4FY6xTsrgVyDDQXNL1tAiWbPK64uy11P33hU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=tTThW1qUR7IKLeF2aYMUIA0sucG87byro3RGO+tEXalvHqt7J9Z2/w9SsVBSEFQdP
	 gsz/v7Vrk8qA7U/+cIPjdzqO+5rIs/82v+88AeTjuxq7gkGpk41PkbWhRIt4Z66qZy
	 B7+wrtk9fEXDtn8YiRGIhPInlDo7pg0l1YLzCnNTUxawRPp32YEEyl9DIpnlT92+ec
	 0Q0928qev+N5jBNKQNNQnMgK0PnPsV7TIhR8DGeZQKHOag36mdbvU8yT/53RFQ3t1n
	 TAtoZw6G+GYKTXa4ITxvA6E/8MPuQ0vScO94HmWow9SU04h6Y8x30CkGvQyGxysHpk
	 cMWCn/7rqvhdA==
Date: Mon, 28 Sep 2026 20:29:55 +0000
To: Mika Westerberg <mika.westerberg@linux.intel.com>
From: brandon.proulx@42fifty.dev
Cc: "westeri@kernel.org" <westeri@kernel.org>, "andreas.noever@gmail.com" <andreas.noever@gmail.com>, "YehezkelShB@gmail.com" <YehezkelShB@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Thunderbolt: reboot hangs in nhi_pci_remove() with CalDigit TS5 Plus on AMD Strix Halo
Message-ID: <nxr6GV-FbflB2r0-2kRJbGFFyhMIfL7FKPuvjeV2X_vzpxf5SRcLoS-DTT2022-tzGIegm3GxbSXLMAF9ri8frabpjm4KwTw9MYRekLmRuA=@42fifty.dev>
In-Reply-To: <20260926101309.GC106095@black.igk.intel.com>
References: <3jbg0iV8op7Un2K3xLx2Y9Y_m8MbrxhUGm6y7eIO-UhE20lCXE321cO3Vd3IzDkBMy55DMA4A84SBZfOxoje_UHglYaYP9PxfvrstgSZd9E=@42fifty.dev> <20260926101309.GC106095@black.igk.intel.com>
Feedback-ID: 145570432:user:proton
X-Pm-Message-ID: 4efa33743024324de8dca759b86da890446c9fd7
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------06812bf968c14dc0c59a017c4f9460b9bac92d689cced29a2cfe2309515e72e4"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------06812bf968c14dc0c59a017c4f9460b9bac92d689cced29a2cfe2309515e72e4
Content-Type: multipart/mixed;boundary=---------------------131c2ebd1ef7e3437422e4498610ea1c

-----------------------131c2ebd1ef7e3437422e4498610ea1c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8


Hi Mika,

Yes. Those fixes clear the hang on my system.

I could not boot the fixes branch as-is. It is based on 7.3-rc1, and this =
system runs 7.2.5-3-omarchy. I applied these four commits onto the 7.2.5 t=
hunderbolt driver and loaded that module:

=E2=80=A2 thunderbolt: Fix domain reference leak when DPRX read is cancele=
d
=E2=80=A2 thunderbolt: Don't access a DP tunnel after its DPRX read was ca=
nceled
=E2=80=A2 thunderbolt: Mark discovered tunnels as active
=E2=80=A2 thunderbolt: Tear down inactive DP tunnels when the domain is st=
opped

Before that, unbinding 0000:c5:00.6 with the TS5 Plus attached blocked in =
nhi_pci_remove() at wait_for_completion(&nhi->domain_released), and reboot=
(2) stuck in the same place until I held the power button. dprx_timeout is=
 12000, but the wait lasted many minutes.

With the patched module, that unbind returned in about a second and the do=
ck came back on rebind. A normal systemctl reboot then finished: systemd u=
nmounted the filesystems and the machine reset, instead of sitting on the =
splash.

Thanks!


On Saturday, September 26th, 2026 at 06:13, Mika Westerberg <mika.westerbe=
rg@linux.intel.com> wrote:

> Hi,
> =


> On Sat, Sep 26, 2026 at 02:06:42AM +0000, brandon.proulx@42fifty.dev wro=
te:
> > Hi,
> > On a Framework Desktop (AMD Ryzen AI Max 300 / Strix Halo) with a CalD=
igit
> > TS5 Plus attached, reboot never completes. After systemd finishes, PID=
 1
> > sits in D state in nhi_pci_remove() during device_shutdown() and the
> > machine never resets. The hardware watchdog does not fire either. Only=
 the
> > power button recovers it.
> >
> > Hardware:
> >   System:  Framework Desktop (AMD Ryzen AI Max 300 Series), BIOS 03.06=
 (2026-07-13)
> >   Host routers:
> >     c5:00.5 AMD Strix Halo USB4 Host Router [1022:158d], subsys [f111:=
000a]
> >     c5:00.6 AMD Strix Halo USB4 Host Router [1022:158e], subsys [f111:=
000a]
> >   Device:  CalDigit TS5 Plus (thunderbolt 1-2, domain1 on c5:00.6), ge=
n 4, NVM 64.c1
> >
> > Kernel: 7.2.5 (distribution build 7.2.5-3-omarchy, Arch-based)
> > thunderbolt.host_reset=3DY (default)
> >
> > Stack of PID 1, sampled every few seconds from reboot until power-off.
> > Unchanged from 21:02:02 to 21:07:27:
> >
> >   [<0>] nhi_pci_remove+0x53/0x60 [thunderbolt]
> >   [<0>] pci_device_shutdown+0x3e/0x80
> >   [<0>] device_shutdown+0x169/0x1d0
> >   [<0>] kernel_restart+0x3a/0x70
> >   [<0>] __do_sys_reboot+0x22b/0x270
> >   [<0>] do_syscall_64+0xaa/0x690
> >   [<0>] entry_SYSCALL_64_after_hwframe+0x76/0x7e
> >
> > The offset lands on the wait_for_completion(&nhi->domain_released) aft=
er
> > tb_domain_remove(), so it looks like the last reference to the domain =
is
> > never dropped while the TS5 Plus is connected. Unbinding the NHI via s=
ysfs
> > (echo 0000:c5:00.6 > /sys/bus/pci/drivers/thunderbolt/unbind) before r=
eboot
> > blocks in the same place (unbind_store -> nhi_pci_remove).
> >
> > Reproduction:
> >   1. Boot with the TS5 Plus connected to a rear USB4 port.
> >   2. systemctl reboot
> >   3. Machine hangs after the last systemd message and never resets.
> >
> > Current workaround: sync, then SysRq-b (emergency_restart), which skip=
s the
> > device_shutdown() walk.
> =


> There are bunch of fixes for this area in my "fixes" branch here:
> =


> https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git/
> =


> I wonder if you could try those and see if the problem goes away?
> =


-----------------------131c2ebd1ef7e3437422e4498610ea1c
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
-----------------------131c2ebd1ef7e3437422e4498610ea1c--

--------06812bf968c14dc0c59a017c4f9460b9bac92d689cced29a2cfe2309515e72e4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0Fgmq6zjUJEL9ZdyMtA0UtRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmf0vZ/1gVQtrLUvFTU5/qdthQb1thjVYlYahkc2
VphFbxYhBFlFoyFkszSVeXo1n79ZdyMtA0UtAAALzQD/RsHjByk6L/t7+aOY
NBj5MZc+BIyR9iPkpAlhQeqiVXUA/iHaclkdPTZhqJuet0f+nK3pcla+lpgg
RRja9L/hJKEP
=at/r
-----END PGP SIGNATURE-----


--------06812bf968c14dc0c59a017c4f9460b9bac92d689cced29a2cfe2309515e72e4--

