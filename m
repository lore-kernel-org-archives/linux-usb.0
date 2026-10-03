Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CB8392C2F
	for <linux-usb@vger.kernel.org>; Sat,  3 Oct 2026 10:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791022451; cv=none; b=TliEt8I4PBXI/0ugwRd9CXlrbm8seUfbbM2/ciHsRifB+XVKwwe3Gyt5BRjRuJ5eqbMxppnxFLaxNhaWIJhS/pTFd4iVfEUbVd2dyRVshuUNRmyu+uXHfjgBrMI+N+BN1jMDmKP3lshsrxz3OXt/Hr0i3wGs4SVmtusnOXs3SMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791022451; c=relaxed/simple;
	bh=MKfxGSFyTUPXh5GV1RcGgfE9P9708dA6S3Fg13+Jt9U=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VBuoSIEWF4EWYNlTJkOOBFRoUhdXb2/kJc2+79C1M8gF+iT1+bzTwe1WFPxN3TGsyzM5yXcxW6gI9jN+HB0136HM32NsYAkIS+bx2ELPp2mXpt86621Y93B7NpV0/R6tyjfxk2qx8oAPit9orfXR4uEWTxW+ZvcMmrhXOcKTe9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch; spf=pass smtp.mailfrom=protonmail.ch; dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b=EwGCgYhK; arc=none smtp.client-ip=79.135.106.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="EwGCgYhK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail3; t=1791022444; x=1791281644;
	bh=MKfxGSFyTUPXh5GV1RcGgfE9P9708dA6S3Fg13+Jt9U=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=EwGCgYhKYofxwE1yHHztAaj2T7xl9mRzeqTUb20PhB4kQsR0PJCOW08OS/3UhiBEd
	 DsptsQ/2Jrf5V7H2aM3dMLOczhjBUUdVCObvhchKpaK/XT/pflr2FYdM/hd0L+5MR7
	 rNFO9Jjtg/b2GFSAqKOS+uCE0np3xq438l0V6VqITIIlFmdCy0X0zr4hAgZTUcEfNq
	 tuwqDinN3Pa0mapWfISDvgC/TPT5XH1d6sZEZSv7EyeTo+RIMCzpODgqTulEzJfVan
	 vcU1OQTA9j/2adIjCc8ZAavVMdW01YeyOVhh+oH4dfSupew5Gg3pqNZDHIM2fzzCss
	 VVulJrjPij4Eg==
Date: Sat, 03 Oct 2026 10:13:56 +0000
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From: Thomas Hornik <thomas.hornik@protonmail.ch>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mathias.nyman@linux.intel.com" <mathias.nyman@linux.intel.com>
Subject: Razer Basilisk V3 (1532:0099) cold-boot enumeration fails with -EPROTO on AMD Matisse xHCI
Message-ID: <HHq_OCxl9RI-5ZzRAxURVsf30En7t418EeJNcfCR9WFSf5EFK2WKxDHfzCTo1_8ifuH60WiBNe9env2XOLmaFdlePVioseIIWrP2-du5Mss=@protonmail.ch>
Feedback-ID: 343131:user:proton
X-Pm-Message-ID: 7ecea854ae57f5a77c4e2ad2f7bd310f421498aa
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Dear Linux-USB team,

A Razer Basilisk V3 (mouse) fails to enumerate on some cold boots. The fail=
ure follows the device across ports and across two AMD Matisse xHCI control=
lers. Other full-speed devices on the same root hub enumerate during the sa=
me boot. A later connect of this device enumerates on the first try.

Hardware:
ASUS ROG STRIX X570-E GAMING, BIOS 5044 (2026-01-04)
Legacy USB support and xHCI hand-off are enabled
CPU: AMD Ryzen 7 5800X3D
The xHCI is the X570 chipset, 1022:149c rev 00
AMD Matisse xHCI [1022:149c]. 0000:06:00.1 subsystem 1043:8808, buses 1 (US=
B2) and 2 (USB3)
0000:0d:00.3 subsystem 1043:87c0, buses 5 (USB2) and 6 (USB3)
hcc params 0x0278ffe5, HCI version 0x110, quirks 0x10 (XHCI_SPURIOUS_SUCCES=
S only; no Matisse-specific quirk). Device, once enumerated: 1532:0099, bcd=
Device 2.00, USB 2.00, full-speed, bMaxPacketSize0 64, 1 configuration, 4 H=
ID interfaces, bus-powered, remote wakeup, 500 mA, quirks 0x0.

Kernels: Ubuntu 24.04 HWE 7.0.0-31, 7.0.0-34 and 7.0.0-38 (all 7.0.14). The=
 signature is the same on all three.

Over 33 boots from 2026-09-18 to 2026-10-02 the device failed on 8 and enum=
erated on the first try at about t=3D1.0s on the other 25. Failures were on=
 usb5-port1, usb5-port2 and usb5-port3 (0000:0d:00.3) and on usb1-port1 (00=
00:06:00.1). On the failing boot below, usb1-3 (Kingston HyperX Alloy Origi=
ns, 0951:16e5, also full-speed and 500 mA) enumerated at t=3D3.13s, an EPOS=
 dongle at t=3D3.57s, and a Genesys hub at t=3D3.91s. A Logitech Unifying r=
eceiver on the sibling controller 0000:06:00.3 started at the same t=3D0.68=
s and succeeded.

xhci_hcd owns the controller before the failure. On two boots the device ne=
ver appeared for the rest of the session, one of them about two hours. On t=
wo boots a later connect on the same port succeeded (t=3D44s and t=3D74s). =
The log has no disconnect line, because the device never enumerated, so tha=
t later connect cannot be separated from a replug. I do not have a usbmon t=
race of a failed boot yet.

Log from 7.0.0-38-generic, monotonic, 2026-10-02:

[ =C2=A0 =C2=A00.440060] xhci_hcd 0000:06:00.1: hcc params 0x0278ffe5 hci v=
ersion 0x110 quirks 0x0000000000000010
[ =C2=A0 =C2=A00.446076] usb: port power management may be unreliable
[ =C2=A0 =C2=A00.683470] usb 1-1: new full-speed USB device number 2 using =
xhci_hcd
[ =C2=A0 =C2=A00.805501] usb 1-1: device descriptor read/64, error -71
[ =C2=A0 =C2=A01.035503] usb 1-1: device descriptor read/64, error -71
[ =C2=A0 =C2=A01.250606] usb 1-1: new full-speed USB device number 3 using =
xhci_hcd
[ =C2=A0 =C2=A01.370316] usb 1-1: device descriptor read/64, error -71
[ =C2=A0 =C2=A01.593663] usb 1-1: device descriptor read/64, error -71
[ =C2=A0 =C2=A01.698701] usb usb1-port1: attempt power cycle
[ =C2=A0 =C2=A02.077621] usb 1-1: new full-speed USB device number 4 using =
xhci_hcd
[ =C2=A0 =C2=A02.077718] usb 1-1: Device not responding to setup address.
[ =C2=A0 =C2=A02.282692] usb 1-1: Device not responding to setup address.
[ =C2=A0 =C2=A02.490609] usb 1-1: device not accepting address 4, error -71
[ =C2=A0 =C2=A02.490673] usb 1-1: WARN: invalid context state for evaluate =
context command.
[ =C2=A0 =C2=A02.602611] usb 1-1: new full-speed USB device number 5 using =
xhci_hcd
[ =C2=A0 =C2=A02.602705] usb 1-1: Device not responding to setup address.
[ =C2=A0 =C2=A02.810696] usb 1-1: Device not responding to setup address.
[ =C2=A0 =C2=A03.018608] usb 1-1: device not accepting address 5, error -71
[ =C2=A0 =C2=A03.018674] usb 1-1: WARN: invalid context state for evaluate =
context command.
[ =C2=A0 =C2=A03.018720] usb usb1-port1: unable to enumerate USB device
[ =C2=A0 44.019328] usb 1-1: new full-speed USB device number 9 using xhci_=
hcd
[ =C2=A0 44.161779] usb 1-1: New USB device found, idVendor=3D1532, idProdu=
ct=3D0099, bcdDevice=3D 2.00
[ =C2=A0 44.161789] usb 1-1: Product: Razer Basilisk V3

The descriptor reads return -EPROTO in about 120 ms. initial_descriptor_tim=
eout is 5000 ms, so the host has completed the control transfer with a tran=
saction error. "Device not responding to setup address." comes from xhci_se=
tup_device() on COMP_USB_TRANSACTION_ERROR. The WARN is xhci_evaluate_conte=
xt_result() on COMP_CONTEXT_STATE_ERROR: Evaluate Context ran while the slo=
t was not in Default, Addressed, or Configured. That warning is on the Addr=
ess Device failure path. The first failure is the GET_DESCRIPTOR about two =
seconds earlier. hub_port_connect() then gives up and calls hub_port_disabl=
e().

usb_detect_quirks() runs only after a device descriptor has been read, and =
these attempts never get one. An entry for 1532:0099 cannot change the fail=
ing transfers. v7.0 drivers/usb/core/quirks.c has 1532:0116 and 1532:0e05, =
and no 1532:0099.

I can capture one failed boot with usbmon, or with xhci dynamic debug, if t=
hat would narrow it down.

My second OS, Windows 11, brings up the mouse on every boot.

Best regards,
Thomas Hornik
