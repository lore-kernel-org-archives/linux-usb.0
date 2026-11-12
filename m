Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472584;
	b=Kxr9EVczvm9/teyxh1/PNyBHKkrHUnNc+GfdiZdC3eiWFcMfWqcsGAAxA4FlIBDc53Hw
	 0WwFU2k+B+XiKRy1M5QYPtAAQ1HXPSPO8TXKnMpWP4zp/ImcB46v5Iin8j3x64f8+kC8F
	 GsY8Hhu4cdck1EKrV0XYMdyKMRwawTESjNMYS/MOVwaaLajXKq2bhHMOu+6wkbLcHuPK/
	 5j4VVQIOmT3L73sBZxDbq0LtKoMSi+1QoNVWiMV4iCl/M45WcZvg5pr75iiLmB26X/6yK
	 EmaNA42qymY5WXkSngiC4YyPjfYNS/fviv3J/ZCgdZsjGMdyw/MZk1akNVgFPmevFjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472584;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:Content-Type:Content-Transfer-Encoding:X-Bugzilla-URL:
	 Auto-Submitted:MIME-Version;
	bh=VtC1orjB1qHw4ezPEJC0GB9lnUpwDDaBe89sCeiPdGg=;
	b=Hh4LQnrerUHWGl556jL9sZ7NBmnvilzLoB90xucUXmr4j10uAGo9IkM+6VxuVZvI+8XL
	 y9Za04ihffLI+CUtkuRkl4RI+v4g7tLEk7NemeUBUSLZrGSQC2ZNhOxr5qB+RRR4AvFrm
	 DpG/TjQ8BxtBvC8t+dEIF2oV5h+cHvMc/Xy1VmkhoAIgb45lZtFSq21hk2bo5aSIvopg/
	 sQwDxSxl7eHdz7hp/aCujTAvKP5HOEIKYSyGH6vnUSflwGfyUhul19e2pYCGZM6jSwAXM
	 khacv7WyzAf9SS4WjYymKKXA6cS9IVxct12yztXcxxpujTVCVxhHKuRUDPF6JlqeZQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d3sQUZJb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E85606B3B5
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 08:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d3sQUZJb
Received: by smtp.kernel.org (Postfix) with ESMTPS id 025171F00A05
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 08:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472584;
	bh=VtC1orjB1qHw4ezPEJC0GB9lnUpwDDaBe89sCeiPdGg=;
	h=From:To:Subject:Date;
	b=d3sQUZJbTqmhNVuE6XlYAWOAkDiVlJHjbjJXHdOCIosIRtclIVLr86a3qsd/5n1Eq
	 +trBPmYFTkHfhjDOv8CsEEj0QnOmnGsbj8YwePv0yB7f6cJWWTZeJzStAiPsiA5FRa
	 DaYFxseXFLA3hv80NmSglytAuK1BRCMgCKbjshf7lz6Uo1LbRyguuE/CpTIAQCKlN4
	 /9V7HV2AyfVe00zI2u2VeVEBUrdBUudgPw9NDzjLwr/U4pLUqlF01CKutpXqAzgIwa
	 9jQRaqq16rPFxCxc46qtcGWaYOQ+4K+Qhb2OK/UhgbmE9ZwElvaB/lvLqQtgKxfdGp
	 GhYgNKnoT35WA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EAF41C41612; Thu, 12 Nov 2026 08:36:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222261] New: Regression: ALSA: ua101 breaks genuine Edirol
 UA-1000 ("playback packet size 560 too small for 15 capture frames")
Date: Thu, 12 Nov 2026 08:36:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: londongrad@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-222261-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222261

            Bug ID: 222261
           Summary: Regression: ALSA: ua101 breaks genuine Edirol UA-1000
                    ("playback packet size 560 too small for 15 capture
                    frames")
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: londongrad@gmail.com
        Regression: No

### Summary of Regression
After a recent kernel update on Linux Mint (Ubuntu kernel base), my genuine
Edirol UA-1000 USB audio interface (0582:0044) stopped being registered by
ALSA.=20

The `snd-ua101` driver aborts probe initialisation with:
`playback packet size 560 too small for 15 capture frames`

This appears to be a regression caused by commit `86f86e6fdedc` ("ALSA: ua1=
01:
reject mismatched capture/playback packet sizes"), which incorrectly assumed
genuine UA-101/UA-1000 hardware declares proportional packet sizes across a=
ll
endpoints.


https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=
=3D86f86e6fdedc33c5b8d38b9208b350f8accf57ee


### Hardware & Environment Details
* **Device:** Roland / EDIROL UA-1000
* **USB ID:** `0582:0044` (`bcdDevice 1.07`)
* **Distribution:** Linux Mint (Ubuntu-based)
* **Last Working Kernel:** []
* **Broken Kernel:** [6.8.0-149-lowlatency]

### Steps to Reproduce
1. Boot into the updated kernel with a genuine Edirol UA-1000 connected via=
 USB
2.0/3.0.
2. Check `/proc/asound/cards` and `dmesg`.
3. Power-cycle or switch the hardware sample rate selector on the UA-1000
across all supported rates (44.1 kHz, 48 kHz, 88.2 kHz, and 96 kHz).

### Expected Result
`snd-ua101` binds to `0582:0044` and registers the `UA1000` sound card in
`/proc/asound/cards`, as it did in previous kernels.

### Actual Result
`snd-ua101` rejects the device during probe at every physical sample rate
setting (44.1, 48, 88.2, and 96 kHz), leaving the interface unregistered in
ALSA.

### Relevant `dmesg` Output
[ 2622.796887] usb 3-3: new high-speed USB device number 5 using xhci_hcd
[ 2622.928793] usb 3-3: New USB device found, idVendor=3D0582, idProduct=3D=
0044,
bcdDevice=3D 1.07
[ 2622.928798] usb 3-3: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[ 2622.928800] usb 3-3: Product: UA-1000
[ 2622.928801] usb 3-3: Manufacturer: EDIROL
[ 2622.928802] usb 3-3: SerialNumber: ZT02743
[ 2622.934792] usb 3-3: playback packet size 560 too small for 15 capture
frames


### USB Descriptors (`lsusb -v -d 0582:0044`)
sudo lsusb -v -d 0582:0044

Bus 003 Device 010: ID 0582:0044 Roland Corp. EDIROL UA-1000
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          255 Vendor Specific Class
  bDeviceSubClass         0=20
  bDeviceProtocol       255=20
  bMaxPacketSize0        64
  idVendor           0x0582 Roland Corp.
  idProduct          0x0044 EDIROL UA-1000
  bcdDevice            1.07
  iManufacturer           1 EDIROL
  iProduct                2 UA-1000
  iSerial                 3 ZT02743
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x00bd
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0=20
    bmAttributes         0xc0
      Self Powered
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1=20
      bInterfaceProtocol      1=20
      iInterface              0=20
      ** UNRECOGNIZED:  0b 24 01 00 01 35 00 03 00 01 02
      ** UNRECOGNIZED:  0c 24 02 01 01 01 00 0a 00 00 00 00
      ** UNRECOGNIZED:  0c 24 02 02 03 06 00 0c 00 00 00 00
      ** UNRECOGNIZED:  09 24 03 03 01 01 00 02 00
      ** UNRECOGNIZED:  09 24 03 04 03 06 00 01 00
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1=20
      bInterfaceProtocol      2=20
      iInterface              0=20
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1=20
      bInterfaceProtocol      2=20
      iInterface              0=20
      ** UNRECOGNIZED:  0b 24 02 01 0c 04 18 01 80 bb 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes           37
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Implicit feedback Data
        wMaxPacketSize     0x02d0  1x 720 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1=20
      bInterfaceProtocol      2=20
      iInterface              0=20
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1=20
      bInterfaceProtocol      2=20
      iInterface              0=20
      ** UNRECOGNIZED:  0b 24 02 01 0a 04 18 01 80 bb 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0230  1x 560 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1=20
      bInterfaceProtocol      3=20
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       1
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1=20
      bInterfaceProtocol      3=20
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1
Device Qualifier (for other device speed):
  bLength                10
  bDescriptorType         6
  bcdUSB               2.00
  bDeviceClass          255 Vendor Specific Class
  bDeviceSubClass         0=20
  bDeviceProtocol       255=20
  bMaxPacketSize0         8
  bNumConfigurations      1
Device Status:     0x0000
  (Bus Powered)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
