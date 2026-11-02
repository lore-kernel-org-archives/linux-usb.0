Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640995;
	b=XK3g8+t54kjB3R07oTn88nrUCTR62B3NYdk8rwzgmeOcmphEky6/UnAbzZilj8T8ksHN
	 zgLGfk+pzpGVllcCzcx2fshr3nnBnWqpxo9CX5RjimUQezmv+UFLxkPEoTarPPHpgVaGM
	 SHtdnR/7o2sTyudoLgEpcJ4EPDw6EpRuoF5kE5zCZ5hRnIxgY6xI+6RT0Qig/I9gci1oV
	 VWBneJpAbEINzRKFlnCw21/4NRceCRD7LhqkLMpsWhirQ/pCpQ35hoqwVheRK40F51CZS
	 vqqXTzMhHOgGZ4/Ym6aSLREfchDWCqrAwbogUwHl8S+vBuvdYMJXUetkYxPBulxE48A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640995;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zEJyC4Hy1K8qtGKhmiWtfD0oQILD6fwcoWFHpGK6kho=;
	b=MvtATlPtsxFFI1ipdD+TNvPdMNaULmNru2RsDzLJJCQF/MLnmguzrtfVMgrh4hjwO6UL
	 tPTeI+FvnJyZO9CIXu6JJwgk+Zy4IH2LNtqo+BSQDRXcB3WYf3KBRJL07Ub1pQaf3Zv2b
	 aFWPKD0vnyXvrgTZcWwDPGuY67CSFhvJ5dr1dOC1c40nL1yF9dSfMzKpHIdwW+1I61s61
	 tCXy4GNDV2s1zXKbM3wGhrJQIwJmsaSOPdDLrvJW/PZImLDqamRhAvUiQupx8nSMj9bER
	 lXGnFHCOc/MwtofVRadyZ0theUuMQNuCA5APNV3CGl1oRhQVWonyKZ+K/PBNbEUdjfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=RIl4FCaz;
	arc=none smtp.remote-ip=185.70.43.101
Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A705606A90E
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 17:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A705606A90E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=RIl4FCaz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793640991; x=1793900191;
	bh=zEJyC4Hy1K8qtGKhmiWtfD0oQILD6fwcoWFHpGK6kho=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=RIl4FCaz0SOThWjwsqcH60dmrflhxWbnItcgSsbV3CUxWtAFXcbcRne1T1yTTXj6/
	 SLfXx866p3NDzcFOdbVRwDfUnz2uED4doYf06Kh9LND841OuVrB84QcRQ9cJplXAQP
	 cYLP/vyDJfHKT5o+VzJssoYzHG5jMzgucSRNxyTEUIptsGxf/PVskB5COltgbTGcLE
	 GUe93h/W/3u0ti1t0lTMO1xqKXbhvKzFPb+EB8tCMT8htT3bC3Ox99fqxNOEJAyt0o
	 E+58XHJla73As8Ld/VQ5CGCm1jyFXPqBtnWeIMyRnZP7R18ZW0OfjuI9ptsZ++GKq7
	 cK15c73LrDjYg==
Date: Mon, 02 Nov 2026 17:36:28 +0000
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From: fedora-r9-dev@proton.me
Subject: xhci_hcd 0000:16:00.4 [1022:15b7] fails runtime resume from D3cold ("Controller not ready at resume -19"), followed by hard system hang
Message-ID: <IpUbEUggp59J8uinYUedXtOUexshGrH2yT0NUYVDOG1flaE9kBpyOEffelXH0qFGqIBBrTYTur93b33dBTfUVaHdujiA-tN7G58zX6_RIRs=@proton.me>
Feedback-ID: 232314576:user:proton
X-Pm-Message-ID: 4c3018b4ec957ef32e297eb2088acbba5fc2ddb9
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

On an AMD Ryzen 9 7900X desktop, the CPU-integrated xHCI controller at
0000:16:00.4 [1022:15b7] intermittently fails to resume from runtime-PM
D3cold. The driver logs the failure and declares the HC dead, after which
the whole system hard-hangs: display frozen, no input, no network, and
nothing in pstore (hardlockup/softlockup_panic enabled). The log below
was captured via netconsole.

Hardware / software
- CPU: AMD Ryzen 9 7900X
- Board: MSI MAG X670E TOMAHAWK WIFI (MS-7E12), BIOS 1.L2 (07/02/2026)
- Kernel: 7.2.14-200.fc44.x86_64 (Fedora 44); hangs also seen on
=C2=A0 7.2.12 and 7.2.13
- Device on the controller: Logitech StreamCam 046d:0893 (USB 3.0,
=C2=A0 uvcvideo + snd-usb-audio), on the rear USB-C port wired to the CPU

Log (netconsole)
[ =C2=A0153.788740] resume-cycle 24
[ =C2=A0158.001608] usb usb8-port2: Cannot enable. Maybe the USB cable is b=
ad?
[ =C2=A0158.018346] resume-cycle 25
[ =C2=A0158.042692] xhci_hcd 0000:16:00.4: Controller not ready at resume -=
19
[ =C2=A0158.042706] xhci_hcd 0000:16:00.4: PCI post-resume error -19!
[ =C2=A0158.042709] xhci_hcd 0000:16:00.4: HC died; cleaning up
(system hangs here)

usb8-port2 is the other SuperSpeed root port of the same controller.
Nothing enumerated on it at the time; the same "Cannot enable" message
appeared shortly before each of the three hangs that netconsole captured.

Reproducer (hangs within a few minutes on 7.2.14)
=C2=A0 dev=3D/dev/video1 =C2=A0 # the StreamCam
=C2=A0 st=3D/sys/bus/pci/devices/0000:16:00.4/power/runtime_status
=C2=A0 for i in $(seq 1 300); do
=C2=A0 =C2=A0 until [ "$(cat $st)" =3D suspended ]; do sleep 1; done
=C2=A0 =C2=A0 echo "resume-cycle $i" > /dev/kmsg
=C2=A0 =C2=A0 v4l2-ctl -d $dev --get-fmt-video >/dev/null 2>&1
=C2=A0 done

In normal use the same wake-up is triggered by applications enumerating
cameras (Discord, Firefox), and by libvirt's nodedev scan reading the
controller's config space while it is in D3cold.

Observations
- While runtime-suspended, power_state reports D3cold (on both 7.2.11
=C2=A0 and 7.2.14).
- Possible regression, but not conclusive: 7.2.11 survived 111 cycles of
=C2=A0 the reproducer, 7.2.14 hung at cycle 24 (single run each). The camer=
a
=C2=A0 was first attached on 2026-10-27, the same day 7.2.12 was installed,
=C2=A0 so the two changes are not separable from the hang history.
- Workaround: power/control=3Don for 0000:16:00.3 and 0000:16:00.4 (a udev
=C2=A0 rule), keeping both in D0. Since applying it and moving the camera t=
o a
=C2=A0 chipset USB port, no hangs, including 50 cycles of restarting
=C2=A0 virtnodedevd plus nodedev scans.

I can provide lspci -vvv, full dmesg or the libvirt reproducer on
request, but I won't be able to bisect.

Thanks,
Erik Birgiser
