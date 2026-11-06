Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986355;
	b=emgFURbPLjJtVm6y6R6oJVKa6FOEDfJ/HWZe+rFGFZfPTTysmH509xNkBy78/yeftCyV
	 Qkv2tzfKFBISGaAMIui+Xr5qXZj3N+lgnn12KDrfl4PZce3Re7CWCFwXapcM3bGkEpHbC
	 pUKTvxaKi2hOoWT1kGB1Q0dLCV6lSewJKhyoYQZNW4Y6porRXWYxYI6pX7uWdBKC2ZOY7
	 rqS8OOynCmUTE3mIKwlmQtSXAn6O67wCCMYGr4c79rPClVOpjxNqLVSx1FKyxkr5uEY3m
	 eGc4hdDoHeYndtMLpW1PfborngcLZSxxN8VC9upQ866sk1jGIuOBf5DGj9Ye76nxk1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986355;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:X-MBO-RS-META:X-MBO-RS-ID;
	bh=Lh4YP8lWADeMBED/q61/UBMKl+zBA3dG6sO7ypHbuMw=;
	b=RTlRFe4bZccE3QB/SevfNdzJIkg4kz/WL6C3sNEE0h1ukhQDZtNxvZrFFEq3HkaLphKM
	 zRzvjXQHvaFceYvcLqCPsD+Lly/SOdF37IRWJT4MkoDQ37BhmnKKC4qwuqPJY+zpn792T
	 RGqehPx2L6/G6FrC3wDd9zGrxkhVwtplUJ2o9WXQmSuYUNIoRihjyyThOtT5BLcKa5OQ6
	 8sIPmzpIjSLvvdSwSdVcVCSOO6cqi2wEbM/+3+AIXxE4a6DcfD3DR9Jb8ZuyCbGgr0i/F
	 GgsYUQrRScSbx2juVauHnWwuAlnVW+iTsyXclcdNf73B4sQb/d/lcLk+2LV5+yUUdKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b="LgcIaT/n";
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6779A606A32C
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 17:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6779A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=LgcIaT/n
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jLmTV4nNXzMlf9;
	Fri, 06 Nov 2026 18:32:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1793986350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=Lh4YP8lWADeMBED/q61/UBMKl+zBA3dG6sO7ypHbuMw=;
	b=LgcIaT/nniA368rcJXSra9hPWOLI+45XBSdI82CiqtPc5MuOc7clfCVqdlo1ZjD1CRCVCe
	Hi1JAdnAjn7n0CfeDE/nav39hm6BfdffC3x2ZaQtMYxEjNjyq1tLFF6Uu5BxttdW4asOFN
	rtabW2ps75L8COHdu8HiNQOju2udPK1lz9HL2bGnMtzGrYTVj4i5C+Qs4enfL1syE5nXwI
	pzM2F0YloelNldChlsaGU9l5oBR/7aaywWnt03jldtxCNv3+4EKnN4lEO0HFUav9svCWBx
	ir8CMYypc45D7cab3w0NawleD65/8VxpJgeqi+mEAiD1IluAWYuvzTmJjLdf4A==
From: Martin Seidel <mseidel@mailbox.org>
To: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, oneukum@suse.com
Subject: Subject: usb-storage: SP MS60 (13fe:6500) needs US_FL_IGNORE_UAS
Date: Fri, 06 Nov 2026 18:32:28 +0100
Message-ID: <Awi1hYscTjW0LIJAzTtqDw@mailbox.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart0FsE1oOXTWCfaeie7Cg0WQ";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-MBO-RS-META: nojxeag7hroyms3zdg9zxw1c7rb7f6mr
X-MBO-RS-ID: bf9f09f72eeafa74098

--nextPart0FsE1oOXTWCfaeie7Cg0WQ
Content-Type: multipart/mixed; boundary="nextPart1YwLOdJMSQK4skt5y5KrLA";
 protected-headers="v1"
Content-Transfer-Encoding: 7Bit
From: Martin Seidel <mseidel@mailbox.org>
Subject: Subject: usb-storage: SP MS60 (13fe:6500) needs US_FL_IGNORE_UAS
Date: Fri, 06 Nov 2026 18:32:28 +0100
Message-ID: <Awi1hYscTjW0LIJAzTtqDw@mailbox.org>
MIME-Version: 1.0

This is a multi-part message in MIME format.

--nextPart1YwLOdJMSQK4skt5y5KrLA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hello,

the USB SSD "SP MS60" (Silicon Power, 250 GB, idVendor=13fe, idProduct=6500, 
bcdDevice=1.10) does not work with the uas driver on my system. The partitions 
are detected, but reads time out and the device is reset, so the drive cannot 
be mounted. With the uas driver disabled for this device (usb-
storage.quirks=13fe:6500:u) it works fine.

Kernel: 7.2.12+deb14-amd64
Distribution: Debian

dmesg excerpt:

usb 4-1.1: New USB device found, idVendor=13fe, idProduct=6500, bcdDevice= 
1.10
usb 4-1.1: Product: MS60
usb 4-1.1: Manufacturer: SP
scsi host1: uas
sd 1:0:0:0: [sdb] tag#8 data cmplt err -75 uas-tag 1 inflight: CMD
sd 1:0:0:0: [sdb] tag#15 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD IN
sd 1:0:0:0: [sdb] tag#15 CDB: Read(10) 28 00 00 00 08 00 00 00 20 00
scsi host1: uas_eh_host_reset_handler start
usb 4-1.1: reset SuperSpeed USB device number 4 using xhci_hcd
sd 1:0:0:0: [sdb] tag#15 FAILED Result: hostbyte=DID_ERROR 
driverbyte=DRIVER_OK cmd_age=54s
I/O error, dev sdb, sector 2048 op 0x0:(READ)

I attach the output of lsusb -v for the device.

Could this device please be added to drivers/usb/storage/unusual_uas.h with 
US_FL_IGNORE_UAS? A suggested entry:

UNUSUAL_DEV(0x13fe, 0x6500, 0x0000, 0x9999,
		"SP",
		"MS60",
		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
		US_FL_IGNORE_UAS),

If this device is already handled in a current kernel, please ignore this 
mail.

Thanks and regards,
Martin Seidel
--nextPart1YwLOdJMSQK4skt5y5KrLA
Content-Disposition: attachment; filename="lsusb.txt"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; name="lsusb.txt"

Bus 004 Device 005: ID 13fe:6500 Phison Electronics Corp. MS60
Negotiated speed: SuperSpeed (5Gbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.20
  bDeviceClass            0 [unknown]
  bDeviceSubClass         0 [unknown]
  bDeviceProtocol         0 
  bMaxPacketSize0         9
  idVendor           0x13fe Phison Electronics Corp.
  idProduct          0x6500 MS60
  bcdDevice            1.10
  iManufacturer           1 SP
  iProduct                2 MS60
  iSerial                 3 07083CD58AADBA20
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0079
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              896mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     80 Bulk-Only
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               7
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               7
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       1
      bNumEndpoints           4
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     98 USB Attached SCSI
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               7
        MaxStreams             32
        Data-in pipe (0x03)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               7
        MaxStreams             32
        Data-out pipe (0x04)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
        MaxStreams             32
        Status pipe (0x02)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        Command pipe (0x01)
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x002a
  bNumDeviceCaps          3
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000006
      BESL Link Power Management (LPM) Supported
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000e
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   2
      Lowest fully-functional device speed is High Speed (480Mbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat        2047 micro seconds
  SuperSpeedPlus USB Device Capability:
    bLength                20
    bDescriptorType        16
    bDevCapabilityType     10
    bmAttributes         0x00000001
      Sublink Speed Attribute count 2
      Sublink Speed ID count 1
    wFunctionalitySupport   0x1100
      Min functional Speed Attribute ID: 0
      Min functional RX lanes: 1
      Min functional TX lanes: 1
    bmSublinkSpeedAttr[0]   0x000a4030
      Speed Attribute ID: 0 10Gb/s Symmetric RX SuperSpeedPlus
    bmSublinkSpeedAttr[1]   0x000a40b0
      Speed Attribute ID: 0 10Gb/s Symmetric TX SuperSpeedPlus
Device Status:     0x0000
  (Bus Powered)

--nextPart1YwLOdJMSQK4skt5y5KrLA--

--nextPart0FsE1oOXTWCfaeie7Cg0WQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSxiKu8/PyQCDpXgkqKZLelKt9O7gUCau4PLAAKCRCKZLelKt9O
7nBsAP9i1J9nunoNHdaFW1CyOEHJqjekV4lKyKFigIiCl9DPsAEAo6lWoy6epZD8
yin637CJv3QRK9OabqNc/XMdYHe7BAM=
=JX7o
-----END PGP SIGNATURE-----

--nextPart0FsE1oOXTWCfaeie7Cg0WQ--



