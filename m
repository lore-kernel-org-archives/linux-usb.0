Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258685540A6
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 21:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791927763; cv=none; b=om+VH21ikFmaoxBAUJ7dtamdKm+TBRmRn+AOfXu8hzdi83wNzlacl42fv2veXTjk0TbAlaoHw0oG/DR+kRkvm/MYi/Hl310ehMnoPRBd+W7zeKaG7312hBcHsI3al7lWLTOJoFJP9NQbhjcrtcZu83SmQG0JWBRenab9gOkUDj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791927763; c=relaxed/simple;
	bh=C1GKgx6HpFeJaFxXNX9cvpfgGkXbIOYyLac9g1xJ5GU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DKam2cmgbN8137eom2KHCyidVNMObumsZrumPAAEn0uR/RjqkWj2uhbsygDwa8u6PCxU2FihFTcMxtGzb0EgVV5ke3miRHjXK8rMpO1pLpgsV3BwNA5/jxXuD2EaMrbW4QbjhRG6hshlkamaT1uHJLTj8tShJSBQWE5Dh5zWy6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FvYEK5Us; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FvYEK5Us"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bb5afa736so397199eec.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 14:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791927761; x=1792532561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4W0Ahbb5IPxFLpRLpvlao+7CNa0cJmn9qh35gsLsDI0=;
        b=FvYEK5UsvxDlPotTMcRzDATjDA6cATH6YgOb+6k2rLO+1mfnhFrTuzsntuWhmZnwgj
         IILnpeflRDifK5xbN1KgYdHZ5QaS5Xwr3GKTBDN6OP7gwCAdyZYc9J6Kr8g4pbrNyzQV
         Ru9eLYCRG5SdGuEzOkROBuGeTli6X4t3ZlDSTmEputQUx/B3Ln0Zer1jb+2T9oXCMZNj
         n0LSBdiVJhVc3CW+65aPMzdW4YBDlGemT8GE5B5dJ05L2Fj1fmeWdUfPVu49ih1PkWAW
         oIhFXuIGzegVyTrWxhiRR2EaxW0JvlPM0DSndwV26lqU5R1wOhAFgo8SJCXW3I2b6hrQ
         r0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791927761; x=1792532561;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4W0Ahbb5IPxFLpRLpvlao+7CNa0cJmn9qh35gsLsDI0=;
        b=S9ttaTAJdI2TdTpDepUzRP2XtDQ+VQusilmPZDE82ku8aM9plB/ciWAFyPXjQX7dcG
         IQm7ggF9/DQunmqiDeA8XoYkSDTmfWJwll1uWphObwNf23WxDWsqO3uMfYRpEdKft2vp
         BRPPYAAVQuAzXEyjSB+2thcx+evCBxKy9eRlJQseYYS5NrA+qPsenH0lW1+LguIqiYv+
         S0eOrKLt0itarOoj2byPAXerbWChvLywNIt1y4dzR/17w04s3j3fT3rVk5ANeP5Gg52O
         jW6eZvA8WwLzZ+YIeL6n0wMyBI1gs1H1JDLjJPM6AjZYEglF2es3GJ2Tg8LKhOQhyEkl
         93cg==
X-Forwarded-Encrypted: i=1; AKwUvBxcz/0vrVrXVPaEAjOmGvBZB779CxAGf+Ia733BSICQtmwH+9G7uQW63DTiaFQlgNpJQ+zUCJjBFEc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdTK9drvQM81GQY7FCMMIZIFTkgEzjDHDIywPPCNqOZ+6G1MPo
	+3RgZIxx/928tv0PduQnYxRRJHsNgmdQZaBeMLbwl0iiDWtdqG4GGgk=
X-Gm-Gg: AYBFou3rw3zEvtodxwLQwp+t4c6/yMr9pwNFcwgVkWdqaf87SbYf/YEKrfpV2l9ofaN
	laztpWru20GmH4106zBUovF8/47Re7GUFOnq6hmXYSUX8aSra/3sy968mmMinAZCQKRr+0qD2xk
	XrT+LfIJty8hJGUxDlHcVyC1xQL3Fjfhtx+Px5G357uwE7dkNgYbRTBVhaQHiToi0Ho1Q4tgs70
	AcgKo0PH03VGPvehEpiaG634z+8LTFwPWy3TNzlurEzUKu+wqBs+u0SfXoNNR2Ka7bHuK0ar18p
	/1yjGfmLE72CvUam9psQE3TEoMwj3SJA4gD5ZAscKPePOqI8KZP5Q2f4L+CrhjlQwoHdwMPPKpm
	iX6m1s+fFvqxL/kHH+SC5Pb2WaGN7uXx4QFi/0Ux43wojjOiyNin5Xx4zDdN2S7HGyqW4485KsB
	kOzdhVpSAA4+1JKygzmK2A0IxWe4npTVWMx6JqAd7ChZShbSTcZCzsdZFyIA==
X-Received: by 2002:a05:7022:170a:b0:146:ffa9:2117 with SMTP id a92af1059eb24-16a5b97cec2mr28125796c88.1.1791927760299;
        Tue, 13 Oct 2026 14:42:40 -0700 (PDT)
Received: from delby ([2406:7400:56:f386:5287:1741:5d51:173a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2d2db98sm38675055c88.10.2026.10.13.14.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 14:42:40 -0700 (PDT)
Date: Wed, 14 Oct 2026 03:12:28 +0530
From: Amit <lestoppe@gmail.com>
To: Huang Wei <huangwei@kylinos.cn>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Craig Hesling <craig@hesling.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: simple: narrow OWON match to avoid
 breaking VDS1022
Message-ID: <20261014031228.1fadf3d2@delby>
In-Reply-To: <20260817093549.245503-1-huangwei@kylinos.cn>
References: <20260810091322.2201740-1-huangwei@kylinos.cn>
	<aoLKsDMGD3NXT19-@hovoldconsulting.com>
	<20260817093549.245503-1-huangwei@kylinos.cn>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Huang,

	I've updated on the Bugzilla. Let me reply on the queries here
as well.

1. The userspace tool uses libusb and the automatic driver load
prevents it from accessing the device. The software used is:

	 https://github.com/florentbr/Owon-VDS1022

3. The VDS1022 supports some SCPI commands once I enabled it via the
console in the application above. I do not know if it's the same set as
the HDS200 series. 

	However, I want to emphasize that the SCPI interface is a
secondary feature for additional functionality. The userspace tool
above is the more basic / essential function to view the waveforms. 

	The HDS200 is a handheld scope with a built-in waveform display.
The VDS1022 is USB device that depends entirely on the PC software to
view anything at all. Turning it into a generic serial interface is a
downgrade.

2. output of lsusb -v -d 5345:1234

--------------------------------------------------------------------
Bus 001 Device 003: ID 5345:1234 Owon PDS6062T Oscilloscope
Negotiated speed: Full Speed (12Mbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            2 Communications
  bDeviceSubClass         0 [unknown]
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  idVendor           0x5345 Owon
  idProduct          0x1234 PDS6062T Oscilloscope
  bcdDevice           10.01
  iManufacturer           1 S
  iProduct                2 U
  iSerial                 3 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0029
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xc0
      Self Powered
    MaxPower               50mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         5 Physical Interface Device
      bInterfaceSubClass      6 [unknown]
      bInterfaceProtocol     80 
      iInterface              0 
      ** UNRECOGNIZED:  09 21 00 01 00 01 22 00 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
cannot read device status, Resource temporarily unavailable (11)

--------------------------------------------------------------------

On Mon, 17 Aug 2026 17:35:49 +0800
Huang Wei <huangwei@kylinos.cn> wrote:

> Hi Johan,
> 
> Thanks for the review.
> 
> You're right that the owon 'simple' driver is effectively an alias for
> the generic usbserial driver, so a VDS1022 used through a kernel tty
> would not have been broken by the new match. The reporter's breakage
> is therefore most likely due to a libusb-based userspace tool, which
> can no longer claim the interface once the kernel driver binds to it -
> before commit 4cc01410e1c1 nothing claimed these interfaces in-kernel,
> so such tools worked out of the box.
> 
> leStoppe, to figure out the right fix, could you share:
> 
>  1. which userspace software you use with the VDS1022 (is it a
>     libusb-based tool?);
>  2. the output of "lsusb -v" (or "usb-devices") for the VDS1022;
>  3. whether the VDS1022 supports the same SCPI command set as the
>     HDS200 series.
> 
> Craig, was the intent of 4cc01410e1c1 to cover only the HDS200 series,
> or the whole range of OWON scopes sharing this VID:PID?
> 
> I'll follow up with a v2 that switches to
> USB_DEVICE_INTERFACE_CLASS(), fixes the comment style, and drops the
> wording about falling back to a generic driver.
> 
> Best regards,
> Huang Wei

