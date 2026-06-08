Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4093C4B68
	for <linux-usb@vger.kernel.org>; Mon,  8 Jun 2026 10:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913916; cv=pass; b=AemKWc9d3vN/qSfTPdvuUpGtnHzzcMkg/l/BkVLkcDDuOVsXd+EGiq2FsGZtrFrmMmAZ10O/ivMjGaS7gfm+a33lF0ZvykaxP5/bGhndcX467VAveokQ8gq3kPl+FCk3TvtCj9QWmq1tsqr36izAp3hvfFNiswdmAbgVRq0KhRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913916; c=relaxed/simple;
	bh=JzWNXgv3MeHHYFW2uI2rUZGv88RdtDhFYNRLh1dyTP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kkaU68eehZa29mQMQpd4R7CqEI1oOGWkjJEuVCQ1fd8sxHCeU87jkt22Csza5qzt8AI6gGLS0gvz7+0+Xoobd1LVrrteWOKarya5qUS8oqRtDys5EaDLFqimPgAe5Gf9WUPBRxZnrclBCwHdZ/ooOsgCn5rc5qGea1AbgsBH9f8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Abk5Ba4f; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Abk5Ba4f"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso27308555e9.2
        for <linux-usb@vger.kernel.org>; Mon, 08 Jun 2026 03:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780913912; cv=none;
        d=google.com; s=arc-20240605;
        b=OTKwZgpC82NPayeJvJ4KP2YOXaLiTYlF+xm5q7jveve743ELF62+hZA+nMj+wPpbni
         sf3j5f+HIoKoBHraNEOE58Xnqyw0uAGwKya0mDuLp4Fj0OrF71TBp55Pzc0+pUHH2+8G
         1brlZIJb4Oe9q7UXXiEJoPSMvP1gn/PARu6QQ9SOg8wz2P2mACxpOyceXLD1gSFejS/x
         K7p9GXmfCORid5MhHemgX/ppqgOz80QcFvu3bCN6ZBsmqkmqy8qkRHBkjwIrbkGQd9Ra
         l7+y2LyMvnptcR+Sydiowamm1fo9EqPZWWQfOVrKRE+gQeLCFAPPGrFKHFy5c4VB7xNt
         kfbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NT44YZcWn6yF3EEPczbofyWtBVbRY7J+rFkJJYcgrlw=;
        fh=OW/ENUSI9jyzb+4BxB41PLupQULIa2A+1BGf3lg29u4=;
        b=iakAgs8Eux0dTvOLsPGtadKcqUT2tE+p+YiOeu8PsPAuDvc6F+hfjbHqnRQjNd88PD
         tdLtOrzxT/b2eSRy/p97F0nzJBUU5OdbtioYDEZAufTZm4gJwhk2cENiogqJfdgGM5td
         RuNtaQMx0Kn4/fEMFfUivKpGvFibKNLRrg9WNAG/xtWBIDVFASxVV0MNsR+uROTfACL0
         LGRamQsHx60VYJUg3whAexc7jJQUkkkzXKKz2OBjDhDwF76ke0DWrEJiv0RgUeDBM2wf
         6k0FVDncQlP8wyamc4yXStyLJptzn754y0ljrNTnzAy3OyBPAhTCn31uYljKrGF7VJ0R
         +b4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913912; x=1781518712; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NT44YZcWn6yF3EEPczbofyWtBVbRY7J+rFkJJYcgrlw=;
        b=Abk5Ba4fvwUJcutgDnQ9hso5lr65KCMNAD+X0b1xS6pxq1ngD8mf0aAdt1RcZqRrgd
         KKQLMyD4SH5iPaD09jfLKZ41EQDlJuyzZXgk1yNoUAHIgy0LiwJeK2INuwfhCVBqbAwk
         ifCIJcE3yaM59pQdHDYMxIJ+PVJ2sdWZA+UsSZSkgQFPxDi7bZsDXPNXUpqeePzuEd3v
         PIGrw+gKIQsfr+pC2Fcs9br2xInL7AViBjwO7pW9TtwuXZDSl6PE6CYGAc6p6GDDTgMr
         0IxSqojBq7rCFaCV4+aCD8Lo53LQRwF4HKUdAKwAdribGnH3J+8qtFUHOSFCFFpEq0E9
         w9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913912; x=1781518712;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NT44YZcWn6yF3EEPczbofyWtBVbRY7J+rFkJJYcgrlw=;
        b=CdduR56NHw49QjdKNjqd0YbVb2LiIcFm2dKnalWjcmDZC3i7siihzMZsX2ivIDcJA+
         T+gbyMvs77eZFibM34kLlYDDEfpQyVRDnfK+9OREXF/h+le1yi+DXkD2PEa/F+msNlm2
         cReEtLLfOSvQSB4/uKGgvXXRuZChGcLzcve7j0DVQhR88xfD0gs+uBUYWO61BYSgmwM5
         L1t4Hy2HI9yLkPW3op+X+7qSanOCeMOJl4ccYPB/Gyf9bUoEuogDg+2eTQIkcSL9dBeG
         x9WzGXvw2GoGHQa07yxpNqhMQSihK9WLEYNTBhqQL/Vm1gO/EB3rqAUCh9huyJUINoUO
         ts2w==
X-Forwarded-Encrypted: i=1; AFNElJ/87fbEf55G/ldAY5gEm/9jUtQkwlKuqGCiq1n8+S+V7l5mV35z3jJ0xfXim+MGB962GdkG3MVg7Pk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkEcMFIeYV+UxJWoAjCKl2+hBd73Cvhl3HyN5lTRoCSoctsUdH
	b/gVrIuAs2IFayAc/ZjD8zYFi2CpamMD0Zfvfkg47u1/c8VdrS/34exeYABSST+eIlg5TFYyKQl
	X4qEpZedh5ckt8brShG5rzm40HyIC0hVGn9B9
X-Gm-Gg: Acq92OFs3x+E4sAhlymTHeNnwcSMxPhd9hCeOSGjNMfSTNB98LJ/JdixVwG7GZviFaH
	S5cZn7U16kURcC1AyhEcCA+lmSv83CcnT12mqKT340H4IpuE9I4KZwo1jthvznIeLyNIOjQ9+Nd
	f0YFSBWDlYBq6G2Kh0y0M92iBty4+ZjgYcW4A90nm0nRVT4Sp3e2mx7x3X+/TRf+y1HLpA/Qjv/
	mqu0YD1O/mBOy9qKyB9W4eUSt47O7w4U59xVtsSgr+M7qTC85Sesoby9nWl4snDbHXkttumpYVl
	TF6oI0ti5CaFJy3zCoU=
X-Received: by 2002:a05:600c:5290:b0:490:bd1d:472a with SMTP id
 5b1f17b1804b1-490c25b129amr228009995e9.15.1780913911796; Mon, 08 Jun 2026
 03:18:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326123023.1711-1-charlesyeh522@gmail.com> <ah7j_HxoAQA-vZrr@hovoldconsulting.com>
In-Reply-To: <ah7j_HxoAQA-vZrr@hovoldconsulting.com>
From: Charles Yeh <charlesyeh522@gmail.com>
Date: Mon, 8 Jun 2026 18:18:19 +0800
X-Gm-Features: AVVi8CdD0C5i-f05LvdDA6aWBYV0avZI_M3l6pQ0T1yieG-CHbZ0_jXwzY3jx6g
Message-ID: <CAAZvQQ6O4p35Xs2hVYaoJxD4D7U0YonsdweuPh6W8RQVhvoUNw@mail.gmail.com>
Subject: Re: [PATCH v2] USB: serial: pl2303: add new PID to support PL256X (TYPE_MP)
To: Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	charles-yeh@prolific.com.tw
Content-Type: text/plain; charset="UTF-8"

> change the summary to something like:
>
>         USB: serial: pl2303: add support for PL256X multi-port devices

Thanks.
I'll change it in v3.


> > --- a/drivers/usb/serial/pl2303.c
> > +++ b/drivers/usb/serial/pl2303.c
> > @@ -54,6 +54,7 @@ static const struct usb_device_id id_table[] = {
> >       { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GL) },
> >       { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GE) },
> >       { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GS) },
> > +     { USB_DEVICE(PL2303_VENDOR_ID, PL256X_PRODUCT_ID_4P) },
>
> Which devices is this? PL2533 (0x2533)?
>
> What about the other variants you mention above (PL2543, PL2565)? Do
> they use separate PIDs?


PL256X_PRODUCT_ID_4P is for the PL2533 device, which uses PID 0x2533.

>
> Can you please post the output of usb-devices (or lsusb -v) for this
> device?

Bus 002 Device 007: ID 067b:2533 Prolific Technology, Inc. PL2543
USB2.0 HS Serial Port
Couldn't open device, some information will be missing
Negotiated speed: High Speed (480Mbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0 [unknown]
  bDeviceSubClass         0 [unknown]
  bDeviceProtocol         0
  bMaxPacketSize0        64
  idVendor           0x067b Prolific Technology, Inc.
  idProduct          0x2533 PL2543 USB2.0 HS Serial Port
  bcdDevice           33.04
  iManufacturer           1 Prolific Technology Inc.
  iProduct                2 PL2543 USB2.0 HS Serial Port
  iSerial                 3 C00000000C0001
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0081
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x000a  1x 10 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x000a  1x 10 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x05  EP 5 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x86  EP 6 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 [unknown]
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
        wMaxPacketSize     0x000a  1x 10 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x08  EP 8 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x89  EP 9 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x8a  EP 10 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x000a  1x 10 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x0b  EP 11 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x8c  EP 12 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0





> > +#define PL256X_PORT_A_FLOWCTRL_REG   0xC005
> > +#define PL256X_PORT_B_FLOWCTRL_REG   0xD005
> > +#define PL256X_PORT_C_FLOWCTRL_REG   0xE005
> > +#define PL256X_PORT_D_FLOWCTRL_REG   0xF005
>
> nit: please use lowercase hex notation

Thanks.
I'll change it in v3.


>
> > +
> > +#define PL256X_FLOWCTRL_MASK         0x43
>
> > +#define PL256X_FLOWCTRL_XON_XOFF     0x40
> > +#define PL256X_FLOWCTRL_RTS_CTS              0x03
>
> Does the device support having hardware and software flow control
> enabled at the same time?

Yes, the device supports enabling both hardware flow control (RTS/CTS)
and software flow control (XON/XOFF) simultaneously.


> > +static int pl256x_uart_reset(struct usb_serial *serial, u16 value, u16 index)
>
> You only call this function from one place and there does not seem to be
> any reason for passing in value and index (ifnum) that I can see.

Thanks.
I will simplify the pl256x_uart_reset() function,
remove the unnecessary parameters (value and index)



>
> > +{
> > +     struct device *dev = &serial->interface->dev;
> > +     int res;
> > +
> > +     dev_dbg(dev, "%s - [%04x] = %02x\n", __func__, value, index);
>
> And then there is no need for this.

I'll change it in v3.



> > +     res = usb_control_msg(serial->dev, usb_sndctrlpipe(serial->dev, 0),
> > +                     PL256X_RESET_REQUEST, PL256X_RESET_REQUEST_TYPE,
> > +                     value, index, NULL, 0, 100);
> > +     if (res) {
> > +             dev_err(dev, "%s - failed to write [%04x]: %d\n", __func__,
> > +                                                             value, res);
>
> And here you can just spell out "failed to reset device: %d\n".


I'll change it in v3.



> >
> > -     if (spriv->type == &pl2303_type_data[TYPE_HXN])
> > +     if (spriv->type == &pl2303_type_data[TYPE_HXN] ||
> > +             spriv->type == &pl2303_type_data[TYPE_MP]) {
>
> nit: please indent continuation lines at least two tabs.


I'll change it in v3.


> > @@ -461,6 +510,14 @@ static int pl2303_detect_type(struct usb_serial *serial)
> >               case 0x905:     /* GT-2AB */
> >               case 0x1005:    /* GC-Q20 */
> >                       return TYPE_HXN;
> > +             case 0x3302:
> > +             case 0x3304:
> > +             case 0x4302:
> > +             case 0x4304:
> > +             case 0x6502:
> > +             case 0x6504:
> > +             case 0x6506:
>
> Can you add a comment here after each number so we know which device
> type they map to?

Got it. I will add comments after each bcdDevice case to explicitly map
them to their corresponding device types
(e.g., PL2533-2P (SSOP),  PL2533-2P (QFN), etc.) in the v3 patch.



> >       int ret;
> > +     unsigned int ifnum;
>
> nit: please try to maintain reverse xmas style by moving this one after
> buf.

I'll change it in v3.


> >
> > +     if (type == TYPE_MP) {
> > +             switch (ifnum) {
> > +             case 0:
> > +                     spriv->flowctrl_reg = PL256X_PORT_A_FLOWCTRL_REG;
> > +                     break;
> > +             case 1:
> > +                     spriv->flowctrl_reg = PL256X_PORT_B_FLOWCTRL_REG;
> > +                     break;
> > +             case 2:
> > +                     spriv->flowctrl_reg = PL256X_PORT_C_FLOWCTRL_REG;
> > +                     break;
> > +             case 3:
> > +                     spriv->flowctrl_reg = PL256X_PORT_D_FLOWCTRL_REG;
> > +                     break;
> > +             }
>
> We need a default case here as well. You can just return an error.

I'll change it in v3.

> >
> > -     if (type != TYPE_HXN) {
> > +     if (type == TYPE_MP)
> > +             pl2303_vendor_write(serial, spriv->flowctrl_reg, PL256X_FLOWCTRL_NONE);
>
> Why you need to disable flow control here? The setting should be updated
> per termios when the device is later opened.


This is used to program the hardware default state during startup.




Charles.
