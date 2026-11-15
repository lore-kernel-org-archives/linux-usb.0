Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=176.119.200.165
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794766452;
	b=JG8FhA4mffJ2y+sdEnnPSWEHttagUfTcIWh6avbfLKJnndUa3Fo98R6GjpWCtlJahXc3
	 356mgxryv25JxTR6jVGlQ7ahSXuuJXXAsLJfrx1kO+f4//um4rI4zyj8bjajX/qsloqgS
	 lDnfKJoJlOybJi4FEMLZfhAc8asYcZ3JuVuSd2chml/iNR6Nl1X+yp2/nRtp4AqmcaYhW
	 exjtZDxy9ZPK2MEyqVUKECDSsqmkDQ4hDjZyEqObvOXdiE+kSXnA+24bAM4+6/IpfeSuF
	 KUwYjDkS3p4L0wlk8tNZs4UrjQMeZtYW5UZyOv6x2H4DDL/vJYaBta8OMM5mBKSchlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794766452;
	h=DMARC-Filter:DKIM-Signature:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From:To:Message-ID:X-SimpleLogin-Type:
	 X-SimpleLogin-EmailLog-ID:X-SimpleLogin-Want-Signing;
	bh=HhoQtadESQjRHlo+YpadI4CGDGd3NhRHz7UIj5pOHvo=;
	b=WwN6dZbHHd4eJQYBK6VO5lgUPUqJSDD8lGGqQbzkphPgtH4D3XilfMWeksK+Rr67MOhX
	 alTBCYV6lLUeQAypRcNKqSln43mI6eKlUX2nm5L9L3l1ux/Rs9LQYcz9jnEpRRI+rwpAm
	 eGBjhi/9MS2N9sjpPFaSKBgMheqZttxIVKwMe25dxyLAGu0NOw4zm7px1E9W7VO18VfdV
	 zTZXM0LT4yncmsgbSg4PMYmVaJ0k5mswqyRPQhm5dBdeR1ZjTig2Meuw8qQvyaFjCiuZk
	 o3UI0CISUxNJnB86HpCexjKrKtiQyTOXAhELxjKKjQZjLak8y+NjayFJSBNBCiQ5pfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=passmail.com;
	spf=pass smtp.mailfrom=passmail.com;
	dkim=pass header.d=passmail.com header.i=@passmail.com header.a=rsa-sha256 header.s=dkim header.b=qS2g0OhB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=176.119.200.165
Received: from mail-200165.simplelogin.co (mail-200165.simplelogin.co [176.119.200.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598BF606A31D
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 18:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 598BF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=passmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=passmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=passmail.com header.i=@passmail.com header.a=rsa-sha256 header.s=dkim header.b=qS2g0OhB
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1794766444;
	cv=none; b=qRfF3Yepv64D0BhyYq080ezt3Sn0XH703CTtKqiRgmwltlUcn926kdsclE7CUDQ3NgRWaDkrnTvCh+8dvrxdqHTTvs7/wfw3YJJrkM2ZL16cMAj/IaLsQLRFzrWOdhz/Iw8C9wCwTK60c9tKykvoUVSN+IMU2WLCJLaAmVPpCxHbEAYFaZzZWGeOw12DNFqxBLMyZXBs/8Y4NSySNfyCHKCy6m02nudw9UAG4CDKmdqWhzLRoFnOK2g30Yi6F7Rrr+rXIHInpGzGt92BssG595WkuJi4JBG7qQWOZekfNbzvEIXEW9y3ypqAVSSieOReigKG6tNDKryQJ4dNOhMZvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1794766444; c=relaxed/simple;
	bh=HhoQtadESQjRHlo+YpadI4CGDGd3NhRHz7UIj5pOHvo=;
	h=Date:Subject:From:To; b=xzxZCSKHGciSRLrMuLGhcu22wxmarTmgD4aMU3pb0JsYfZIHozqKr2BO6wN4QOArioGtZAF3nbPgDBDq3V8M/wtjbNOsLkWdJrjAO43w8O+iRaJMNXtDBAVSQS+xOHEzi1atRRoPvVoj4CxYgNXJXHRBiYapBUf0CTbUQ+SAZObFGvfbHqaPDLm8jEZ8u3Q1F3nypPk01BOTK1JlQ0E1V+piSEHVQMH3uhyy/lXkcrIHcoWZCRX+SOeqYvty1PJyP1kqUA66qOm/b1fAL9RYh3jXhRTnAWnvEbPVUhog5MikL0GO4GfKZj436g5LdGMBon/UFnbqH/Dcnr4uXPbD2A==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=passmail.com;
	s=dkim; t=1794766443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HhoQtadESQjRHlo+YpadI4CGDGd3NhRHz7UIj5pOHvo=;
	b=qS2g0OhBnycOZZ0b9kX7kSSgRq16iUThIJGAsV+ROnWvWa63blfOw8SnLam+TJAgESOjKD
	IiZBYCklA4/g1cUkce34TjNGOGC8UmTpfBe2AeIDvM6TKrE3OnnVuk4ugj/RhKhcjnuY4X
	0tX3qosR6IVMznfWrINJfS9JNTeALOQ=
Date: Sun, 15 Nov 2026 18:13:59 +0000
Subject: Brother DCP-L2550DW printer causes spurious wakeups from suspend
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
From: joe.drift304@passmail.com
To: linux-usb@vger.kernel.org
Message-ID: <179476644349.6.17132009800067769638.1775001021@passmail.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 1775001021
X-SimpleLogin-Want-Signing: yes

Hello,
The Brother DCP-L2550DW printer (USB ID 04f9:0424) causes spurious
wakeups from suspend-to-idle on my system. Applying
USB_QUIRK_DISCONNECT_SUSPEND to it fixes the problem, so I'd like to
suggest adding it to the built-in quirk list.

Setup:
- Framework Laptop 13 (AMD Ryzen 7040 series), s2idle only
- Kernel 7.3.3-300.fc45.x86_64, Fedora 44 + 45
- Dell WD19TB Thunderbolt dock (all components on the latest firmware
=C2=A0 per LVFS); printer connected to one of the dock's USB ports
- Dock USB controller: Intel JHL7440 (Titan Ridge DD), PCIe-tunnelled
=C2=A0 through the laptop's USB4 host

Symptom:
With the printer connected, the system resumes within
30 seconds of entering suspend, without any user input. With the
printer disconnected it stays suspended.

Wake path observed:
- /sys/power/pm_wakeup_irq =3D 9 (acpi); "ACPI: PM: ACPI non-EC GPE wakeup"
- "PM: Triggering wakeup from IRQ 45", which is the PCIe PME interrupt
=C2=A0 of 0000:00:08.3, the bridge to the AMD USB4 host controllers
- thunderbolt dynamic debug on resume, for the port the dock is on:
=C2=A0 "0:2: USB4 wake: yes, connection wake: no, disconnection wake: no"

What did NOT stop it:
- power/wakeup =3D disabled on every USB device behind the dock,
=C2=A0 including the printer and all hubs
- power/wakeup =3D disabled on the dock xHCI's root hubs
- stopping ipp-usb (which had the printer open via usbfs)

What did stop it:
- power/wakeup =3D disabled on the dock's xHCI PCI function (but this
=C2=A0 also disables keyboard wake through the dock)
- unplugging the printer
- usbcore.quirks=3D04f9:0424:m (USB_QUIRK_DISCONNECT_SUSPEND); keyboard
=C2=A0 wake through the dock still works with this

Thanks,Joe

