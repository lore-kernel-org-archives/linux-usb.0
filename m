Return-Path: <SRS0=ZUM+=46=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89604C10DCE
	for <linux-usb@archiver.kernel.org>; Fri, 13 Mar 2020 09:46:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5B71120746
	for <linux-usb@archiver.kernel.org>; Fri, 13 Mar 2020 09:46:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UO/s7e1s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgCMJqQ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 13 Mar 2020 05:46:16 -0400
Received: from mail-io1-f47.google.com ([209.85.166.47]:43307 "EHLO
        mail-io1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbgCMJqQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Mar 2020 05:46:16 -0400
Received: by mail-io1-f47.google.com with SMTP id n21so8652637ioo.10
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2020 02:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vFEVwYhRv/YnzG4kUZiI9GNjahrHVcPkJjO7VjbAj2U=;
        b=UO/s7e1sPCCSb8HzKP6ltQlpc8rZuB4Kxq1svFTMH3zZcr/GLFUMx9EJETVECfxwoY
         aIq3pQinYO7y1w4EdvsiqxD8aCaiwKPootv6+Q+GYwrgzVMVTAuJVXxIYX9DyOwt4w8q
         kDfed8b/yUWtEg6rBMCMqX+ufqNWoVnoWz71keEdbfjDvK+SWbNFowwP+YdelL1DqTsU
         Z/jH/YGViHr07lEKcdGZWYt2tVGDtEsJDu8lJgY3dDPs4M95VG/xkbelx945PWM59r+x
         p57GHki9GF6emtjnAYORNH8QTwvjOv3njkyUPtRgE3yLH0aReq74JqLTXNRWQ77BBajP
         K3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vFEVwYhRv/YnzG4kUZiI9GNjahrHVcPkJjO7VjbAj2U=;
        b=RxD+Z8nixkXiuU7yV21ZvmCGANGcfylUuZpVKRtZWe+za6zT+q3K/Yt3WX6EuAbaLp
         nttwdY8KEXaO7Rbbux7sFqwQyCH0MWjpulLWfs2RrPgVACmhLqouYQFxUlyo2JeiUWI/
         l6M44Go7u4tamNfZ7gU8f62fBRIDxDQLw8Frw30CTB/bEVTdMARVQ9veg8EoaUxQcZX4
         MzLydDAFUt04umv/heARLGDqrybv7xz8DbauuC/ULcnet/zdwU21UCQbwQb1OfM8N9PJ
         HNHJi0Mzn9w+IJ7mBr5QPZS2ERNiUprj5O5uRR16GmxJebbbWPPWmaT4v0wp5Yj+67JN
         lMfQ==
X-Gm-Message-State: ANhLgQ3j/s4Jb+3v/Sig6RE2pMqtxFsD3Y9BrOEXWgRlE5k7ELx2Zf86
        Sr5Su3pDwIXKHdZtCVdA0keCNJ7prNZSHdsVysyQnG0Ig/w=
X-Google-Smtp-Source: ADFU+vsa09xgjH3h0FwSo01LQ6GRYze0ga+7GCd7xkE7buD1IqK48YAgF9H4Yhds1Z7jIkE+1dGSQ3xgxm/kBoMmMu4=
X-Received: by 2002:a6b:6815:: with SMTP id d21mr11831721ioc.28.1584092775339;
 Fri, 13 Mar 2020 02:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <43547627-70f7-95d7-f003-97388505a19e@lockie.ca>
In-Reply-To: <43547627-70f7-95d7-f003-97388505a19e@lockie.ca>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Fri, 13 Mar 2020 17:46:03 +0800
Message-ID: <CAL411-o0grY_oL=pXrq-zeDqwaF87rYoLFUOPWP-HrPa2DmozA@mail.gmail.com>
Subject: Re: USB 2?
To:     James <bjlockie@lockie.ca>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 13, 2020 at 11:17 AM James <bjlockie@lockie.ca> wrote:
>
> This is USB2, right?

Yes, from below message, you could know it.

>    bcdUSB               2.00
> wMaxPacketSize     0x0200  1x 512 bytes

Besides, when you plug in USB device, you could
type "dmesg", it will show "new high-speed USB device number xxx"

Peter



> I'm trying to buy a USB dvdrw on Amazon but even different sellers sell
> the same thing under a different "brand".
>
> $ sudo lsusb -v -d 13fd:0840
> Bus 001 Device 006: ID 13fd:0840 Initio Corporation INIC-1618L SATA
> Device Descriptor:
>    bLength                18
>    bDescriptorType         1
>    bcdUSB               2.00
>    bDeviceClass            0
>    bDeviceSubClass         0
>    bDeviceProtocol         0
>    bMaxPacketSize0        64
>    idVendor           0x13fd Initio Corporation
>    idProduct          0x0840 INIC-1618L SATA
>    bcdDevice            1.14
>    iManufacturer           1 Generic
>    iProduct                2 External
>    iSerial                 3 554830302020323534363832
>    bNumConfigurations      1
>    Configuration Descriptor:
>      bLength                 9
>      bDescriptorType         2
>      wTotalLength       0x0020
>      bNumInterfaces          1
>      bConfigurationValue     1
>      iConfiguration          0
>      bmAttributes         0xc0
>        Self Powered
>      MaxPower                2mA
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        0
>        bAlternateSetting       0
>        bNumEndpoints           2
>        bInterfaceClass         8 Mass Storage
>        bInterfaceSubClass      2 SFF-8020i, MMC-2 (ATAPI)
>        bInterfaceProtocol     80
>        iInterface              0
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x81  EP 1 IN
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0200  1x 512 bytes
>          bInterval               0
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x02  EP 2 OUT
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0200  1x 512 bytes
>          bInterval               0
> Device Qualifier (for other device speed):
>    bLength                10
>    bDescriptorType         6
>    bcdUSB               2.00
>    bDeviceClass            0
>    bDeviceSubClass         0
>    bDeviceProtocol         0
>    bMaxPacketSize0        64
>    bNumConfigurations      1
> can't get debug descriptor: Resource temporarily unavailable
> Device Status:     0x0001
>    Self Powered
