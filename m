Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48ACA47CA6D
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 19:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290073; cv=none; b=iH+ABDfggHtDkCfjQEDP9Op429KEzkHK7TbETyhNOdX1R9s2ZFXohTwLA2TCyS9wNVEPjZdrGpduPbBpIzjiDElIc7ubkglGh6oiwGFQZpiMcP5Cjaj/6PaKMRiOdHqO8nNn/q5IlEux5+Qynud9VUg1EQ7my58Di336vjbTAyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290073; c=relaxed/simple;
	bh=RgIsImcAGfdNM05FEnOn8hEdr1nuiPF/N/CNPErWKJw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lo9VcGM3VlK1mbQ1G61ccVaFT1VGqaZBpnrRlyeq1xterxZ8zYAfXlcde/upI9hNj4uWBiUgZHdA2LcBat9zMs7b8mDeET1HYm6zZFKlfgU5GHRT2ugLVX/XtAYiEgoyiWYHLXBXMNBtZcqQlkiByLDubJzu7JRqelCUUGRxKNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C518Gi6u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C518Gi6u"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9D0EC2BCF4
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 19:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788290073;
	bh=RgIsImcAGfdNM05FEnOn8hEdr1nuiPF/N/CNPErWKJw=;
	h=From:To:Subject:Date:From;
	b=C518Gi6uF9s5gWD0bw41X9/rnIMS3DgZHlHqnGYlOnpHroVNfYhKcBHql2Xvwj7am
	 zHJz8TqhPYsOSLvJOTRFsq7sxo7BHYlhsHSIeb3SxWvmeEAABgfQIw/wQ+waPrldat
	 fyYLpnpmkg1DzXg/1lgbzT41ZwQAzJ1s7D9p2XHJSG8irJHEorZOhBf9iEsInIFtHS
	 248PnSIL4NqP9Kw1muDgo5PiJrGmDoKixtpT6kRVqBzl3WDAaSUTh9+Y0l9ynwmC8i
	 Qh7DO5u0qV1SQEXukbBYePYHid8w6a2HyNcBp+SvRw3qABV5j5vQFg2vdK8rdQTBbt
	 soIuQtfY6/a/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C4399C3279F; Tue,  1 Sep 2026 19:14:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221954] New: ASUSTeK ROG OMNI RECEIVER (0b05:1ace) handshake
 timeout and power management failure on AMD B850 / Ryzen 9000
Date: Tue, 01 Sep 2026 19:14:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: waldem2020@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221954-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221954

            Bug ID: 221954
           Summary: ASUSTeK ROG OMNI RECEIVER (0b05:1ace) handshake
                    timeout and power management failure on AMD B850 /
                    Ryzen 9000
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: waldem2020@gmail.com
        Regression: No

Hello,

I am reporting a persistent hardware initialization issue with the ASUS ROG
Keris Wireless Aimpoint gaming mouse, utilizing the ASUSTeK ROG OMNI RECEIV=
ER
(USB ID 0b05:1ace) on a modern AMD AM5 platform under Arch Linux (Kernel 6.=
x,
KDE Plasma 6).

[Problem Description]
When booting the system from a cold start, the wireless receiver is detecte=
d by
the kernel during the early boot phase but fails to process any pointer
movements or clicks once the desktop environment loads. The mouse remains
completely unresponsive until a physical hotplug is performed (unplugging a=
nd
replugging the USB dongle forces the port to wake up).

There are two distinct trigger scenarios for this platform:

1. CPU-bound USB 3.2 Ports (Ryzen 9700X):
The kernel initializes the USB stack too aggressively. The internal ARM
controller inside the ROG Omni Receiver requires a few hundred milliseconds=
 to
perform its internal self-test and establish a radio sync with the mouse.
Because it doesn't respond instantly to the initial host handshake, the ker=
nel
cuts power to the port/hub via aggressive runtime autosuspend.

2. Chipset-bound USB 2.0 Ports (B850) and MediaTek MT7927 Conflict:
Initially, when using USB 2.0 ports, the mouse initialization collided with=
 the
onboarding of the MediaTek MT7927 (Wi-Fi 7 / Bluetooth 5.4) module. The
Bluetooth firmware loading routine threw 'Failed to load firmware file (-2)'
errors and triggered a 'A stop job is running for Rule-based Manager' syste=
md
hang, during which the shared internal USB hub was hard-reset, dropping the
mouse HID handshake entirely.=20

Even after completely disabling the Bluetooth Controller in UEFI (which
resolved the systemd hang), the mouse still fails to wake up on boot in any
port due to the aggressive runtime power management of the USB stack.

[Workaround]
The issue is currently resolved locally by implementing a custom udev rule =
that
forces the port to stay powered and listen for wakeup events:
ACTION=3D=3D"add|change", SUBSYSTEM=3D=3D"usb", ATTRS{idVendor}=3D=3D"0b05",
ATTRS{idProduct}=3D=3D"1ace", ATTR{power/control}=3D"on",
ATTR{power/wakeup}=3D"enabled"

[Requested Action]
Please consider adding the ASUSTeK ROG OMNI RECEIVER (0b05:1ace) to the glo=
bal
USB quirks list (drivers/usb/core/quirks.c) to prevent runtime autosuspend
during early boot stages and ensure backward compatibility on newer AMD
platforms out-of-the-box.

Hardware Environment:
- CPU: AMD Ryzen 7 9700X
- Motherboard: ASUS ROG STRIX B850-E GAMING WIFI (Chipset B850, Bluetooth
disabled in UEFI)
- OS: Arch Linux (Rolling, up-to-date)

[Technical Logs and Device Dumps]

1. lsusb output:
Bus 008 Device 006: ID 0b05:1ace ASUSTek Computer, Inc. ROG OMNI RECEIVER

2. Boot journal logs (journalctl -b 0):
kernel: usb 8-12: New USB device found, idVendor=3D0b05, idProduct=3D1ace,
bcdDevice=3D 6.25
kernel: input: ASUSTeK ROG OMNI RECEIVER Keyboard as
/devices/pci0000:00/0000:00:02.1/0000:04:00.0/0000:05:0c.0/0000:0c:00.0/usb=
8/8-12/8-12:1.0/0003:0B05:1ACE.0006/input/input9
kernel: hid-generic 0003:0B05:1ACE.0006: input,hidraw5: USB HID v1.11 Keybo=
ard
[ASUSTeK ROG OMNI RECEIVER] on usb-0000:0c:00.0-12/input0
kernel: input: ASUSTeK ROG OMNI RECEIVER as
/devices/pci0000:00/0000:00:02.1/0000:04:00.0/0000:05:0c.0/0000:0c:00.0/usb=
8/8-12/8-12:1.1/0003:0B05:1ACE.0007/input/input10
kernel: hid-generic 0003:0B05:1ACE.0007: input,hidraw6: USB HID v1.11 Mouse
[ASUSTeK ROG OMNI RECEIVER] on usb-0000:0c:00.0-12/input1

3. udevadm info -a -p /sys/bus/usb/devices/8-12:
  looking at device
'/devices/pci0000:00/0000:00:02.1/0000:04:00.0/0000:05:0c.0/0000:0c:00.0/us=
b8/8-12':
    KERNEL=3D=3D"8-12"
    SUBSYSTEM=3D=3D"usb"
    DRIVER=3D=3D"usb"
    ATTR{authorized}=3D=3D"1"
    ATTR{avoid_reset_quirk}=3D=3D"0"
    ATTR{bConfigurationValue}=3D=3D"1"
    ATTR{bDeviceClass}=3D=3D"00"
    ATTR{bDeviceProtocol}=3D=3D"00"
    ATTR{bDeviceSubClass}=3D=3D"00"
    ATTR{bMaxPacketSize0}=3D=3D"64"
    ATTR{bMaxPower}=3D=3D"500mA"
    ATTR{bNumConfigurations}=3D=3D"1"
    ATTR{bNumInterfaces}=3D=3D" 4"
    ATTR{bcdDevice}=3D=3D"0625"
    ATTR{bmAttributes}=3D=3D"e0"
    ATTR{busnum}=3D=3D"8"
    ATTR{configuration}=3D=3D"Default configuration"
    ATTR{devnum}=3D=3D"6"
    ATTR{devpath}=3D=3D"12"
    ATTR{idProduct}=3D=3D"1ace"
    ATTR{idVendor}=3D=3D"0b05"
    ATTR{manufacturer}=3D=3D"ASUSTeK"
    ATTR{power/autosuspend}=3D=3D"2"
    ATTR{power/control}=3D=3D"on"
    ATTR{power/runtime_status}=3D=3D"active"
    ATTR{power/wakeup}=3D=3D"enabled"

4. /sys/bus/usb/devices/8-12/uevent:
MAJOR=3D189
MINOR=3D901
DEVNAME=3Dbus/usb/008/006
DEVTYPE=3Dusb_device
DRIVER=3Dusb
PRODUCT=3Db05/1ace/625
TYPE=3D0/0/0
BUSNUM=3D008
DEVNUM=3D006

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
