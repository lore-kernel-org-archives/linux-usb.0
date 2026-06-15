Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C5A2DEA9D;
	Mon, 15 Jun 2026 03:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781495353; cv=none; b=JLuQOeTAHfCUviS65IQ1jrD8qrmY7JRUDgxnVvGZOm7j4Hgvn8BQ6B8SDz1Poi0UJehExZRaya63ECNeMMEBflk4+aHEsr8fgm1aF04lbMHCepeSfzdHwqejLBdJqQDfTdPk1PF9eO+HTkzz4iAiyW4J9TYaTWP0R4IPNW9sBwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781495353; c=relaxed/simple;
	bh=CA61MhEhHQiPfh13fGEBQ+9iLZVlzjRch7R0XU2TPbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fR2mtZA/LZOkZz2MzPPEcwnhu7xEPZoVRED5E8fWFvDo52kstcSnp34dhtjKhfuc1CmMw/1JD/xULY1OLIK+9X2QK9aG/fjhm8RJGTKaA9cmZe2R0IMOYzaj+f4VKy1IRxHXgrGLKxajLot2GGIk2W42YavFod6N29j+Hw6SMmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=expunge.us; spf=pass smtp.mailfrom=expunge.us; dkim=pass (2048-bit key) header.d=expunge.us header.i=@expunge.us header.b=iY/VDJXQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZyL3O16P; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=expunge.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=expunge.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=expunge.us header.i=@expunge.us header.b="iY/VDJXQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZyL3O16P"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 3F81CEC010A;
	Sun, 14 Jun 2026 23:49:10 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 14 Jun 2026 23:49:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=expunge.us; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1781495350; x=1781581750; bh=c0RgZxDoalsrGoeY5Bfwj
	kkow0+kKwnIUFSwiCg/7bs=; b=iY/VDJXQ7rSR88luKjk5bI/UVeHwG+rtWrlj/
	S7unrFAgL78r7dKpD43BmoHEyXSRuf7iWCncooy0xx3QWK3P32yNgjgbz1ldC84R
	re0a4SvohDTcypT0d4CsfvoBOhn7JQvnpskN5Ye+Vk4u6tsmbuY8fTF+YkeH99lm
	u/E9GG+iIIfhwEfO0FjVY10CZW4uKzKGGWR1gDLEOrJrmDYK47z4Q88IznkFHZYw
	xLho3tDEComvFPDTD4+PnmBYSm9RBLwWQ1F36lPdANiQ7s4rSLXn1XebEXHYwVKv
	gqtSELhfY8ClcjBQb9aTSE1FnTnEPL8YbZ37a/xPvHrUQUx1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781495350; x=1781581750; bh=c0RgZxDoalsrGoeY5Bfwjkkow0+kKwnIUFS
	wiCg/7bs=; b=ZyL3O16PpGShlyIum/HvCvBJZOQHxhp9Qgw2DUjJieuiI+e2ei5
	8ZKjffUPgrfcsWWh1T4IBWkS5s9nmdxIuIjGwkmeT7P89ZCAfS4rimV2wV8eCaQ0
	qtgl0d3ddocH04oRoWq7hH3Rb5tu732u6sQvcjUeWwuPkKJmljY+wWTywCTRLUAP
	Yy2aJLQAGM2NfUG3wGjWv00AYLAJzIt8LZAnj2CTYW3HPBsdfIRNteRqHKoA0tfZ
	kDmR8Uh/saABnaexYxmzRHQQad/Yt8Wf4AWniDj7Z/28kTx+vtAeDE7JpbjPFaEY
	zeEldk41IONyszIQI/lFZ3obJD3SC0CGpxA==
X-ME-Sender: <xms:NnYvah7DknN1DWsg2ff-RFeqi38Jp_JUOPA8XAPJGRreeO8qOehyrQ>
    <xme:NnYvaoN3X9ji_pZghJvmi7f_bQJmnUSzVfkEd7FP76IduepZAEeRxSj4G3qoaB4m7
    Hiop1E4t4s48PTGCKXW81lBstIlFN0mRTh3mXC3mia6beKkkikFuw>
X-ME-Received: <xmr:NnYvavtjPxMqcnp6_8hc_E_DSXp1nwYnqjofH3FRJODGRTkBkUqwn-8CUmDWVThDaY1OssaIcOsPdfTBj0m0KVzEjTf-k7H2f-032XHh2g3_mr_140hffyItQ8dtkOaNgSHBZNrOsOI>
X-ME-Proxy-Cause: dmFkZTFRErEPCKj+ldiFb92FIf/vGNW7pylaZjtkKSOn6bxGBP8gMozYgQXS2JTTyAZ6ND
    sXy74UyfXiBAZ5ULkfFhxXe0csBEMFZCgoW2qeCB7jk13ZcO4XFC9tN9UQfTS6KuWFK6NC
    KzPYD8q6QhZvnt04rOqtG0IRJzrkAkH15PEJsmzXFAZA4CFQ7djUM9ndBhOyVB9gBqd9xR
    RZ+SnHAkzLl5/MdSGksBPPIVYQnNf4XzzdTICYD7p1OEy6j17vuocUO48AiJp4FpYuMy0C
    YNm6RZjpw6nlUiqxK2EfbOFcfGokaV16thl5VZ45Meq6N1JCGSkZ3T4UA3VZV4jD2LDEpv
    oH1eROwZKANHiuV7eAsR+Utq+QL9p847tlYkhngv+bezKGgDlnlNp83UWnbDDFctb52g1D
    cP0RkQ8w7NffNedUncq//KWaSSIo+OxMFERMTRAL5kLxG42iHvkal/9WQ3hnKg6VAeszBv
    XJf723caeQuEiCLAD9NXUss5RK3f8CGnzesHsP6RLeT40pKVwIfdis9P91/kWS/rWfIpTZ
    TaAtfpXj6zWRfc6ewRR94l5YcCywfGySBDDgbWthRe9uhtsriPlMqUWzp0GRviN8R43pd9
    8vkEdnxnlrWzHdH1LaHXO8Y0z/O9FUIzBvpwGOG05qqNWZUtLJ0FHQRq5oLg
X-ME-Proxy: <xmx:NnYvarYyZYrQ0hpeb2rOKKgJ3RMbGL5TDc0fRz8lNbaZqDUJlhfpMQ>
    <xmx:NnYvahySdnrj7K1GjZqP96YjMTni_KS6ot7HWbWsRvcTpuGZfUR8_g>
    <xmx:NnYvajhiX6TzGPzaUlf39z4iEwuf_-duq9Xu2gA7ilwSvyZSGepu2g>
    <xmx:NnYvatn9vrW0fdK1NLIfHBX93A-JVyPYJGiB3h2DlS1JnCxuk-B_jg>
    <xmx:NnYvaoS8IySueB8CuQlJKQHr8X3KkNJBE9uMZ0VQ4vczCifnc_8fNPdi>
Feedback-ID: i0af9447b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 14 Jun 2026 23:49:09 -0400 (EDT)
From: Jared Baldridge <jrb@expunge.us>
To: 
Cc: Jared Baldridge <jrb@expunge.us>,
	Felipe Aranda <felipe.aranda@gmail.com>,
	Oliver Neukum <oneukum@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] usb: cdc_acm: Add quirk for Uniden BC125AT scanner
Date: Sun, 14 Jun 2026 23:48:38 -0400
Message-ID: <20260615034845.2783844-1-jrb@expunge.us>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Uniden BC125AT radio scanner has a USB interface which fails to work
with the cdc_acm driver:
 usb 1-1: new full-speed USB device number 2 using uhci_hcd
 cdc_acm 1-1:1.0: Zero length descriptor references
 cdc_acm 1-1:1.0: probe with driver cdc_acm failed with error -22
 usbcore: registered new interface driver cdc_acm

Adding the NO_UNION_NORMAL quirk for the device fixes the issue:

 usb 1-1: new full-speed USB device number 2 using uhci_hcd
 cdc_acm 1-1:1.0: ttyACM0: USB ACM device
 usbcore: registered new interface driver cdc_acm

`lsusb -v` of the device:

 Bus 001 Device 002: ID 1965:0017 Uniden Corporation BC125AT
 Negotiated speed: Full Speed (12Mbps)
 Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            2 Communications
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         0
   bMaxPacketSize0        64
   idVendor           0x1965 Uniden Corporation
   idProduct          0x0017 BC125AT
   bcdDevice            0.01
   iManufacturer           1 Uniden America Corp.
   iProduct                2 BC125AT
   iSerial                 3 0001
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0030
     bNumInterfaces          2
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              500mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         2 Communications
       bInterfaceSubClass      2 Abstract (modem)
       bInterfaceProtocol      0
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x87  EP 7 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0008  1x 8 bytes
         bInterval              10
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           2
       bInterfaceClass        10 CDC Data
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      0
       iInterface              0
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
         bEndpointAddress     0x02  EP 2 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               0
 Device Status:     0x0000
   (Bus Powered)

Reported-by: Felipe Aranda <felipe.aranda@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218338
Signed-off-by: Jared Baldridge <jrb@expunge.us>
---
 drivers/usb/class/cdc-acm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index ddf0b5963859..3cb372721282 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1810,6 +1810,9 @@ static const struct usb_device_id acm_ids[] = {
 	{ USB_DEVICE(0x1901, 0x0006), /* GE Healthcare Patient Monitor UI Controller */
 	.driver_info = DISABLE_ECHO, /* DISABLE ECHO in termios flag */
 	},
+	{ USB_DEVICE(0x1965, 0x0017), /* Uniden BC125AT */
+	.driver_info = NO_UNION_NORMAL, /* has no union descriptor */
+	},
 	{ USB_DEVICE(0x1965, 0x0018), /* Uniden UBC125XLT */
 	.driver_info = NO_UNION_NORMAL, /* has no union descriptor */
 	},
-- 
2.54.0

