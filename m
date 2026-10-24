Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792881098;
	b=4L2eL86cYPF+lT0y5EGWi/6L5WkYec5lP8prbpf6yMuPodHmfXXSrn+2e4Z9SX+TEGtq
	 VmhwrXkbfH8foNVSYc5yCdEFYTQev0WlQIeJIYoEGilFGMpMaIxwk9uAFPL4rNXJPUH9c
	 NavjeveTFx1I6/0UlAiovYqh/ejPrgRao1UtGtsCgj3XmcAMNSbktA/YaTKLTHy0/cOm+
	 X/Bbs1Z13zJyZu0Ww0RN9SRzyYx/cQJ8cIc/M9sCsFqWCJIUtn0QbWpb1TI0Z/GTsrkL+
	 apeGwyd8TdiOdneP2nKRNiTuBlVZGq98d/SGmWd/60p3RPJu/jS+AH/OV9XzQp0t6Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792881098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Received:To:
	 Cc:Reply-To:Subject:Date:Message-Id:From;
	bh=mOQtF8KwLRjX9fFz18yzfhECmDrw7PZVYu+2t0oGNBQ=;
	b=FuiSUi4tlOK1T8ueSLE6Ss6r5kGXdLJdRGqj0PY9KISGAPeb/b3oa7xVeEUDOAeE4ceA
	 6jkW+Mw3+hpliZ4T4AuAZ8p8zHPRQhW6fNiuU47srK9ZcLYoNTAJE1yYujzgjwbhEeXft
	 N9KgIFmtzqkAls+53kab+pAbhVv1lQNwFjJS8/FtKZylXbJO1W0MteJZHTI5D4ED+D7+H
	 yGGLXQqoE8SC0v5XnazkPXMKMFloUHRsBJVCsUwHsmeoQuJQ+Q5OdvCi3/3dA114zTFam
	 YPEnb8LlBdxjqUGFaFNxj3jg2zZiENO+XA/Zu0/7gOD2bSrT0oYPWIMXEPqVVkALRyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SWjMS6mc;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB758606A31A
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 22:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB758606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SWjMS6mc
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7f432ac553fso2138180a34.3
        for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 15:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792881096; x=1793485896; darn=vger.kernel.org;
        h=from:message-id:date:subject:reply-to:cc:to:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOQtF8KwLRjX9fFz18yzfhECmDrw7PZVYu+2t0oGNBQ=;
        b=SWjMS6mcolqBLaZmAXF5Yf9+v4Ozyl28AP4sBAtp4gAEnZPY+KaNH45RunNs8Xwlp8
         zok6mRnP4+Cc2YnFbsGbGfhWul3Vvfy3e9A2SSBrcolmD50++9zCmEiw5o0BLdxXr56c
         TQSEwkODwjhQF88pySytFdY7LDdudmGU74Jw3b3QouuRJkVB9PYKj4YOHpYVEKUoSLKM
         /G6xu3oMMpynq1CtIRMzLrSlox/YvnB75c9g5wVR4Ov0mjfS3cqipxT8j3exF/rLTDtM
         k3771JxAQEzFgbxr0pVmME1zX5QP+PMlru4hbfOB2Vg3USL2p/8dLw+Hm3M4qCD+B1l1
         LQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792881096; x=1793485896;
        h=from:message-id:date:subject:reply-to:cc:to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mOQtF8KwLRjX9fFz18yzfhECmDrw7PZVYu+2t0oGNBQ=;
        b=0NjwM1rXlhquxhUmZ2gt72uDjkcvXBvowPQFOWtSQa0Qq5N/QgZUAysrfF8lzC39ct
         DJoBeMWu5oTcudmC0V96eeN7cJPyYLJ/azbl8Awo3Qn3mAoPLs7UEluqgAI9tFREA83u
         o90ssn6A/WKCeejlcyA27E5BffUuKwsutyiK+rVo3nzvCK2N8tHd4qktmYkQiyuvp0JQ
         jzwUXouiwqdca6/mfTeUZSd+GlzkazgZ9m9l6v9Jkwzt/EnPYJ2WetEm6fpAEdipsaWK
         wmRxppDEiiDujtVJ/UIRGkEySo9jFRpu2S45Atyce3MdRZpBUbfuC2pDyI5HcBqBBV+w
         CU2g==
X-Gm-Message-State: AFq9FYJoRfysLGkJOx2NWO8tjvkF1jslSUMUirh89y85FvpSkYi7E66E
	3/N0PQtRbmOas4iiJ7gHyyYTeGEgQvGrEMhrVlj9HAiDBeWE0ZjGubHv
X-Gm-Gg: AYBFou18Xv+nAATz6++Xo2KqjRAPXxEQc3ZYa7KNtKpoDF0evkS54/7MkLaf38beRbT
	zsj/fWledGy49+ajdg616zbnmRy3DvYyvrji1jL/A/1FTFAtIBpqyT33InZCxR8Y51ugvzGPxFK
	4ghPGG/En+9cn28Amc3wD9WuEpkRAjTQSxtUdMzQ60jtnCQKmFMXuiwJRyB4Yv4+hiLAOicsFKM
	yNm9WTnYs+cSOo/ozEmhFc2pgHXj0PHPdaMRxY/hiOeTuiKy+Kk7DrI1eB8BaDK+VWBC3XWDdG5
	Q58Mmz+TdLqDi08F3gmymtUf5zwNeiDcWsMN0EAuq+iW1HFANY5xQw5y0weN6KTanyeF5WXr5z5
	g+35BHt4y6fQcxLtpE1xJururl2Th/Ca6DOS2u0OoZx8YZHKlk7LP9H0mOSAazyffgCKPmLWyp8
	SDiW6Uh+TtD6dVk8NwQ79gkal1DLK4o4SuROGNM/3INOTP9RAJDhUt/dT7d8MYdkoN/XiWuFD08
	RefXj5tEAWm5VBq3827I6dsD2HVA6bM4JN/KnckJpCC71i66cPr6BU/gNG3bpRPMzSDRmeqhrMe
	NvC16S/WetlycOBIZHHGSA5HZHxP
X-Received: by 2002:a05:6808:11d0:b0:4d6:308d:4ca7 with SMTP id 5614622812f47-55c001ece75mr1922558b6e.24.1792881096473;
        Sat, 24 Oct 2026 15:31:36 -0700 (PDT)
Received: from virt1.pixelexstasy.com ([199.101.219.127])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c040806a7sm2137648b6e.2.2026.10.24.15.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 15:31:36 -0700 (PDT)
Received: from maynard.pixelexstasy.com (maynard.pixelexstasy.com [192.168.0.1])
	by virt1.pixelexstasy.com (Postfix) with SMTP id 4DEECB9271D1;
	Sat, 24 Oct 2026 17:31:34 -0500 (CDT)
Received: (nullmailer pid 780251 invoked by uid 1000);
	Sat, 24 Oct 2026 22:31:34 -0000
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Reply-To: gmhomeier@gmail.com
Subject: [BUG] xhci: ASM2142 command-abort timeout (-110) kills the host instead of resetting it
Date: Sat, 24 Oct 2026 17:31:34 -0500
Message-Id: <1792881094.236072.780250.nullmailer@maynard.pixelexstasy.com>
From: metaphaze <gmhomeier@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Hello,

xhci_abort_cmd_ring() treats a command-abort handshake timeout as a dead
host. On an ASMedia ASM2142 that timeout happens while a USB 2.0 device
is failing enumeration, and the whole controller is marked dead. The
comment above the handshake already says a timeout should be recovered
with a host controller reset rather than treated as -ENODEV.

Hardware
  ASUS PRIME Z270-AR, BIOS 1301 (2018-03-14)
  0000:06:00.0 ASMedia ASM2142/ASM3142 [1b21:2142]
  Subsystem ASUSTeK [1043:8732]
  Onboard rear USB-C (port EC1) and the teal USB 3.1 Type-A share it
  Intel xHCI on the same board enumerates the same phones normally

Software
  Linux maynard 6.18.38-gentoo-MetaPhaze-MAYNARD #11 SMP PREEMPT_DYNAMIC
  xhci_hcd, in tree. Last bind logged:
    hcc params 0x0200ef80 hci version 0x110 quirks 0x0000000000800010
  Boot also logs:
    DMAR: [Firmware Bug]: RMRR entry for device 06:00.0 is broken - applying workaround

What happens
  A USB 2.0-only device (phone) is plugged into the rear USB-C port.
  The driver correctly starts high-speed enumeration on the companion
  bus (usb 3-1, 480 Mbps). The SuperSpeed bus stays empty.
  The device-descriptor read fails:

    usb 3-1: new high-speed USB device number N using xhci_hcd
    usb 3-1: device descriptor read/64, error -71

  That repeats. The address assignment reaches address 4 and fails
  with -108. About 18 seconds after the first failed read the command
  ring cannot be aborted and the whole host is declared dead:

    xhci_hcd 0000:06:00.0: Abort failed to stop command ring: -110
    xhci_hcd 0000:06:00.0: xHCI host controller not responding, assume dead
    xhci_hcd 0000:06:00.0: HC died; cleaning up
    xhci_hcd 0000:06:00.0: Timeout while waiting for setup device command
    usb 3-1: device not accepting address 4, error -108
    usb usb3-port1: couldn't allocate usb_device

  -110 is -ETIMEDOUT from xhci_handshake() in xhci_abort_cmd_ring()
  (drivers/usb/host/xhci-ring.c, 5 second CRR wait). The function then
  calls xhci_halt() and xhci_hc_died(). The comment there says:

    If CRR is not negated in 5 seconds then driver handles it as if
    host died (-ENODEV). In the future we should distinguish between
    -ENODEV and -ETIMEDOUT and try to recover a -ETIMEDOUT with a
    host controller reset.

  A PCI function reset brings the controller back until the next
  high-speed attach:

    echo 0000:06:00.0 > /sys/bus/pci/drivers/xhci_hcd/unbind
    echo 1 > /sys/bus/pci/devices/0000:06:00.0/reset
    echo 0000:06:00.0 > /sys/bus/pci/drivers/xhci_hcd/bind

  The cable with nothing attached does not trip this. Plugging the
  device into the cable does, every time we tried (three attaches
  after a clean reset: 15:11, 15:26, and 16:55 CDT on 2026-10-24).
  No idVendor is ever read, so the device never enumerates. The same
  phones enumerate on the Intel controller.

  During unbind/reset the kernel also logged a correctable PCIe Data
  Link Layer timeout on 06:00.0. That was not present on the original
  death, only around the manual reset.

The USB 2.0 fallback itself is selected correctly. The descriptor
failure may be this port's D+/D- path, but the controller-wide death
is the driver giving up on -ETIMEDOUT. A host reset, which is what
the comment proposes and what the manual PCI reset already does,
would bring the other port on this chip back instead of leaving both
ports dead until the next unbind.

I can retest a patch. The machine is available.

Thanks
