Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F347DC10F14
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 02:44:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B4ADA20869
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 02:44:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqXysMWk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbfDLCoh (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 11 Apr 2019 22:44:37 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36841 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbfDLCoh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Apr 2019 22:44:37 -0400
Received: by mail-wm1-f67.google.com with SMTP id h18so9062139wml.1
        for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2019 19:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mDJyMt7hNSr7DUrGZuy9n2QrIgPqsmoHKZcHMUGT+sQ=;
        b=OqXysMWklVoFhfk4g1eQY43XP8kbjkscpAtuJiuU7r4gqFXVScKtGM2iF4M1kJdjGh
         TIQpF3mg/X1bUfQ/US8kUapj/rLZa8GMEHZM/YFxXoDkmKGwiBZpfx71g3wlUaA+TOKi
         h32BzaeXkaqvHfEg5AGb0PogSB+dlsW4X9BPJjcHKhY/ZFQP6V9CvCt0D32U/FnPFpDG
         EXvD3B/Yn75eOTyjgLo5w70gFWavHFuZVC23RzlXYo9i6W9EksYKXifQ2Wc8vuIBiq+R
         ZYKtQGqNAVHr001aT8DG9yi44ee9RHutMTinPS1QRpSoQmC2VdujDh6kRzQ14Em01vzN
         /ZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mDJyMt7hNSr7DUrGZuy9n2QrIgPqsmoHKZcHMUGT+sQ=;
        b=bnjkJ3EEbovg8UhWi1Gio+mDyHSI64xRCUFvZDTnTBIDpEe+WCMeivydqBCP5gv29s
         tnjDyzd7CPNhbQHj4FPXXRs771NBXZ3sb4RSX4SrZanSYLmbmdnN11mlt5VJDI/ybrKk
         IUct1zMuL1eyuayCTQ9DfLYSkNeX+Zy5gS2awyYAoNIsJ7l+VqLH/bczoYePpa81T9nO
         i7CZ6S5dUd/5l76GmZsQRHKBR6AHmytueGK41CCed+EN8ThfJT8kQbTVZatF9eXggwm+
         duKU1jvHAWr4m3zRjMcy6sp+H5K8q/Iz+6JJBMLDnXH/xMVlfQnwXjWX0Y2kaelmnOAQ
         l8wA==
X-Gm-Message-State: APjAAAWucxAYth80h5l4K2df9teS7+fARC8sHN2istduDEwx6KpJAVNa
        p7//qk5KxIl/Tn9XSWaGGXmtfljBu8xgThV8a+Y=
X-Google-Smtp-Source: APXvYqwU7Kev11ayCzcgaiNR8RPCLO8KeW0rWKRbgpWXFyQ/gVtpJ6e4t8d7sSEiomATGAbBrtOa3y27iIq5O8B9MQk=
X-Received: by 2002:a1c:4187:: with SMTP id o129mr8760479wma.57.1555037074483;
 Thu, 11 Apr 2019 19:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190212125049.12108-1-charlesyeh522@gmail.com> <20190402073420.GJ12562@localhost>
In-Reply-To: <20190402073420.GJ12562@localhost>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Fri, 12 Apr 2019 10:44:22 +0800
Message-ID:
 <CAAZvQQ6mVgu7nqomaSaPuo_DUrWEruu1f1=q13Qxr+A2Gq=1Zw@mail.gmail.com>
Subject: Re: [PATCH] [v2]USB:serial:pl2303:add new Pull-Up mode to support
 PL2303HXD (TYPE_HX)
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        charles-yeh@prolific.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190412024422.YqdtnOr0C3kH35Dl7IbjGfKTa1oGwrIb2ad589HxQiI@z>

Hi Johan,

A Patch:
[PATCH] USB:serial:pl2303:Add new PID to support PL2303HXN (TYPE_HXN)

B Patch:
[PATCH] [v2]USB:serial:pl2303:add new Pull-Up mode to
support PL2303HXD (TYPE_HX)


To save time, let you have more time to process A patch,
B patch's reply will wait until A patch passes,
then I will repeat the problem of B patch.

Charles.

Johan Hovold <johan@kernel.org> =E6=96=BC 2019=E5=B9=B44=E6=9C=882=E6=97=A5=
 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=883:34=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Feb 12, 2019 at 08:50:49PM +0800, Charles Yeh wrote:
> > Pull-Up mode is disabled (default) in PL2303HXD.
> > When the Pull-Up mode is activated, its TX/DTR/RTS external resistor wi=
ll start the output function.
> >
> > How to enable the Pull-Up mode of PL2303HXD
> > 1.TX/DTR/RTS external resistor is required on the circuit diagram (PCB)
> > 2.PL2303HXD OTP needs to be programmed to have a Pull-Up mode through 6=
.5V (USB_VCC,5V->6.5V)
> >
> > The patch driver will read whether the PL2303HXD has a Pull-Up mode,and=
 if so,
> > it will be set to enable Pull-Up mode function.
> >
> > Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
> > ---
> >  drivers/usb/serial/pl2303.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
> > index bb3f9aa4a909..e5d00e4a495d 100644
> > --- a/drivers/usb/serial/pl2303.c
> > +++ b/drivers/usb/serial/pl2303.c
> > @@ -145,6 +145,16 @@ MODULE_DEVICE_TABLE(usb, id_table);
> >  #define UART_OVERRUN_ERROR           0x40
> >  #define UART_CTS                     0x80
> >
> > +#define      TYPE_HX_READ_PUM_STATUS_REG     0x8484
> > +#define      TYPE_HX_READ_PUM_ADD            0x0404
> > +#define      TYPE_HX_READ_PUM_DATA_REG       0x8383
>
> Again, the defines need to reflect what the registers are for, not what
> use happen to use them for in on specific code path.
>
> These are used to access the EEPROM/OTP, right?
>
> > +#define      TYPE_HX_PULLUP_MODE_DATA        0x08
>
> What is bit 0x08?
>
> > +#define      TYPE_HX_PULLUP_MODE_REG         0x09
>
> And this register isn't just used for pull-up mode as far as I can tell.
>
> > +#define      TYPE_HX_PUM_ADD0                0x00
> > +#define      TYPE_HX_PUM_DATA0               0x31
> > +#define      TYPE_HX_PUM_ADD1                0x01
> > +#define      TYPE_HX_PUM_DATA1               0x08
>
> Same for these, we don't want multiple defines for register 0 for
> example. What are bits 0x31 of register 0?
>
> > +
> >  static void pl2303_set_break(struct usb_serial_port *port, bool enable=
);
> >
> >  enum pl2303_type {
> > @@ -688,6 +698,20 @@ static void pl2303_set_termios(struct tty_struct *=
tty,
> >               pl2303_vendor_write(serial, 0x0, 0x0);
> >       }
> >
> > +     if (spriv->type =3D=3D &pl2303_type_data[TYPE_HX]) {
> > +             pl2303_vendor_read(serial, TYPE_HX_READ_PUM_STATUS_REG, b=
uf);
> > +             pl2303_vendor_write(serial, TYPE_HX_READ_PUM_ADD,
> > +                                     TYPE_HX_PULLUP_MODE_REG);
> > +             pl2303_vendor_read(serial, TYPE_HX_READ_PUM_STATUS_REG, b=
uf);
> > +             pl2303_vendor_read(serial, TYPE_HX_READ_PUM_DATA_REG, buf=
);
>
> Why do you need to access the OTP on every set_termios() call? I thought
> those settings where copied to the corresponding control registers
> during boot?
>
> > +             if (*buf =3D=3D TYPE_HX_PULLUP_MODE_DATA) {
>
> Don't you want to just check bit 0x80 here?
>
> > +                     pl2303_vendor_write(serial, TYPE_HX_PUM_ADD0,
> > +                                             TYPE_HX_PUM_DATA0);
>
> So this looks broken since you're overwriting the flow control settings
> that were just set above. And again, what are bits 0x31 of register 0?
> Doesn't 0x30 control auto-rts?
>
> > +                     pl2303_vendor_write(serial, TYPE_HX_PUM_ADD1,
> > +                                             TYPE_HX_PUM_DATA1);
>
> And why do you need to (over-)write register 2?
>
> Either way, configuring pull-up mode should be done at probe and not on
> every set_termios() call.
>
> > +             }
> > +     }
> > +
> >       kfree(buf);
> >  }
>
> Thanks,
> Johan
