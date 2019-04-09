Return-Path: <SRS0=+Ncr=SL=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A99C10F0E
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 09:53:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B7B8120830
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 09:53:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRjkCskr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbfDIJxA (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 9 Apr 2019 05:53:00 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52911 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbfDIJw7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Apr 2019 05:52:59 -0400
Received: by mail-wm1-f66.google.com with SMTP id a184so2709724wma.2
        for <linux-usb@vger.kernel.org>; Tue, 09 Apr 2019 02:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/z3JUvW4ZArdELCGjCKJmCfWAvmD3avmPaWveYkAvqo=;
        b=bRjkCskrS/coleIg6rMAPeAsBAIvW2mHL91vMYh/ynLD6TRE1/JcLFH1hlq3bhh0RP
         2OI1C7Sfnm46dOT0NwR3gmdfHMWqiKGSsPolQntijfFNK4VnwTlYd+1TNmvlOKjRslz3
         /tR4D9WSgEQd9Vl5AOHq52U9B5SC8eora/kNInYQ2kfp893CQBJEghCtOEzEzrZmmi4R
         tERpq6keci9K8yA6xKfxU2BxqFnd5ZtH6/PR6Z6T9ayWLUQ57p+DkVSzT/uW/zn9fhyr
         ORGm0gefLaPJNmI4PlQaE/OoEzPpagYh9Mwda4eWai1mP+k4HSoZyXnrzT/fmDf9NFVJ
         4lIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/z3JUvW4ZArdELCGjCKJmCfWAvmD3avmPaWveYkAvqo=;
        b=pbnBXjXEO/6v3dGovBhVhSaJrxH1Howcx1YVzcaVl0bavPNXdFhYrjgi7uCq9mEa6m
         HjHM5Eh0t1DGXZcSBM5e27/9fjt5VUTNuAP6iTuAhnjZapex71UQr25SxqwzRFlsujFI
         +UjfS27anLiyqfgsU/7LMeeN5/DMZGxHAL1QehrBiVFaHYGSVGvjDPsjOdMkwlADbNZ6
         8zA8drMRQdDXOqYUFwCfuKSfUVe9cT9ZQstORwt0718aoiScKOoUX8gqPyxr3l3BI55E
         UoTLGNxY3XXxeA2pwyy8u4+xLM+gT7N6noik7JhjwKtG4ozt64/myQu+K/F/u3xxclMS
         b4fg==
X-Gm-Message-State: APjAAAV2vkZDOsgiGGnqWsOg9tdHGGId88w/3JxptC6fc8bVCNIjk8X4
        gQGctipukTEPsAS3XgEE6wX5GiuDpAn9rvH+daE=
X-Google-Smtp-Source: APXvYqypwShrRi31hiSHDlFkRcpo2W2bvUUgQX5xvy5aHhFd0KomUw57rbMx0kAUMyuOlNLG34eUqtnNPgnr120Asww=
X-Received: by 2002:a1c:f204:: with SMTP id s4mr21036524wmc.51.1554803576698;
 Tue, 09 Apr 2019 02:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190213123000.4656-1-charlesyeh522@gmail.com> <20190402072235.GI12562@localhost>
In-Reply-To: <20190402072235.GI12562@localhost>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Tue, 9 Apr 2019 17:52:45 +0800
Message-ID:
 <CAAZvQQ6eOVH_YPxHq_PmDSmFSErswnm8njfjOO6mR9oOi0r5_Q@mail.gmail.com>
Subject: Re: [PATCH] USB:serial:pl2303:Add new PID to support PL2303HXN (TYPE_HXN)
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        charles-yeh@prolific.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190409095245.qsJ0KvUr9xJy8PUktVswca-UwYqt7L-U2QnMISrTNK0@z>

Hi Johan,
      1. The HXN register layout is entirely different from HX and
           earlier devices.

        2. HXN use the same CDC class requests (line encoding, etc) as
           earlier revisions.

Can you send me documentation for the HXN protocol? That would help a
lot in finding the right abstraction level for this.

Ans=EF=BC=9A
Yes,The HXN register layout is entirely different from HX and earlier devic=
es,
Yes, HXN use the same CDC class requests (line encoding, etc) as
earlier revisions

I don't have a PL2303G (HXN) Word file, I only have Excel's table file,
please refer to PL2303_Linux\Vendor_Requesut.png
Or you can install window driver use PL2303G demo board.
(The Fedex tracking no. is 8117 8594 0521)
and then USB Bus Hound to analysis the vendor request.

The original Prolific company is hoping:
TYPE_HX and TYPE_01 used old driver(pl2303.c & pl2303.h)
The new PL2303G (TYPE_HXN) uses new driver(plser.c & plser.h),

You can go to the website of Prolific, in the website,

TYPE_HX and TYPE_01 are called
PL2303 USB to Serial Bridge Controllers (All Chip Versions)

TYPE_HXN is called
PL2303G USB to Serial Bridge Controllers (All Chip Versions).

We provide two different file paths on the website, the name.file..
is to distinguish between TYPE_HX/01 and TYPE_HXN
please refer to PL2303_Linux\Window_support_hx_hxn.jpg

TYPE_HX and TYPE_01:the windows file name is ser2pl.sys & ser2pl64.sys.

TYPE_HXN:the windows file name is plser.sys & plser64.sys.

please refer to PL2303_Linux\window_plser_ser2pl.bmp

But Greg disagreed with the Linux OS about new File name(plser.c & plser.h)
So we did that we merged with the existing pl2303.c(h)
into a new chip (PL2303G, TYPE_HXN)

> +#define TYPE_HXN_FLOWCONTROL_REG     0x0A

> +#define TYPE_HXN_HARDWAREFLOW_DATA   0xFA
> +#define TYPE_HXN_SOFTWAREFLOW_DATA   0xEE
> +#define TYPE_HXN_NOFLOW_DATA         0xFF

What exactly does bits 0x15 (bits 4, 2 and 0) do?
Ans:please refer to PL2303_Linux\PL2303G_TYPE_HXN_UART_Flow.jpg,

Is register 0x0a really only used for flow control?
Ans: Yes, please refer to PL2303_Linux\PL2303G_TYPE_HXN_UART_Flow.jpg,
0x0A(Bit 2, 3, 4)is UART flow control settting,
it only supports TYPE_HXN, no supports TYPE_HX/01.


In an earlier version of your patch, you also checked bcdUSB here. Why
did you remove it?

> +             res =3D usb_control_msg(serial->dev,
> +                     usb_rcvctrlpipe(serial->dev, 0),
> +                     VENDOR_READ_REQUEST, VENDOR_READ_REQUEST_TYPE,
> +                     TYPE_HX_READ_STATUS_REG, 0, buf, 1, 100);

Please name the registers after what they do, not how you use them. What
is register 0 that you read here? Does it have a name?

Ans: Because the "kbuild test robot <lkp@intel.com>" reply me a error.
Please refer to Email: "Tuesday, December 25, 2018, at 11:39 pm"
or refer to PL2303_Linux\remoe_checked_bcdUSB.txt


Why TYPE_01 sets bit 0x20 of register 2 instead of 0x40 as the HX does?
Is that even correct?
Ans: Yes, it is correct,
The Output(TX/DTR/RTS) Tri-state H/W design is different.

TYPE_01: RS-232 Output Tri-state:
0: RS-232 output in output mode;
1: RS-232 output tri-state.

TYPE_HX_Serial Port (TXD, RTS, and DTR) Output Enable:
00 =E2=80=93 Disable output signals (Tri-State) at all time;
01 =E2=80=93 Disable output signals (Tri-State) during suspend;
10, 11 =E2=80=93 Set output signals to HIGH during suspend;



>       if (C_CRTSCTS(tty)) {
> -             if (spriv->quirks & PL2303_QUIRK_LEGACY)
> -                     pl2303_vendor_write(serial, 0x0, 0x41);

Why do the TYPE_01 not set bit 0x20 here? Do the legacy device support
both auto-rts and auto-cts?

Ans: Yes, it is correct,
The Hardware UART flow control settting design is different
between TYPT_01 and TYPT_HX.

Although I have been in Prolific Company for almost 16 years..
But TYPE_01 (PL2303H) has been discontinued(EOL) for 13 years...
Now can't find this IC(TYPT_01: PL2303H) on the market..

The line"if (spriv->quirks & PL2303_QUIRK_LEGACY)"
you are asking now is not what I wrote...
I don't know why to define it as PL2303_QUIRK_LEGACY.

I am mainly responsible for the PL2303 driver
Windows, WinCE, Mac & Android in Prolific.
On the Linux driver side, only when the customer has a problem,
or want to add new features (such as GPIO control, new Baud rate),
I will rewrite the Linux code.
Rewritten Linux code will only be given to the corresponding customer.

Just like this time, because I want to add PL2303G (TYPE_HXN) to Linux,
I just rewritten the Linux code...
For some definitions in the Linux code,
such as why it is defined as PL2303_QUIRK_LEGACY,
I really don't know very well

Before rewriting the Linux code,
I can only guess "PL2303_QUIRK_LEGACY" that this refers to the
old PL2303 (PL2303H, TYPE_01)..
After the actual test (I have tested the old PL2303H chip on Linux),
when I plug in the PL2303H (TYPE_01), the Linux code will execute the code:
if (spriv->quirks & PL2303_QUIRK_LEGACY) itinerary code.
So I confirm This "PL2303_QUIRK_LEGACY" of code refers to PL2303H(TYPE_01)



> +             if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN])
> +                     pl2303_vendor_write(serial, TYPE_HXN_FLOWCONTROL_RE=
G,
> +                                             TYPE_HXN_SOFTWAREFLOW_DATA)=
;
>               else
> -                     pl2303_vendor_write(serial, 0x0, 0x61);
> -     } else if (I_IXON(tty) && !I_IXANY(tty) && START_CHAR(tty) =3D=3D 0=
x11 &&
> -                     STOP_CHAR(tty) =3D=3D 0x13) {
> -             pl2303_vendor_write(serial, 0x0, 0xc0);
> +                     pl2303_vendor_write(serial, TYPE_HX_01_FLOWCONTROL_=
REG,
> +                                             TYPE_HX_01_SOFTWAREFLOW_DAT=
A);
>       } else {
> -             pl2303_vendor_write(serial, 0x0, 0x0);
> +             if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN])
> +                     pl2303_vendor_write(serial, TYPE_HXN_FLOWCONTROL_RE=
G,
> +                                             TYPE_HXN_NOFLOW_DATA);
> +             else
> +                     pl2303_vendor_write(serial, TYPE_HX_01_FLOWCONTROL_=
REG,
> +                                             TYPE_HX_01_NOFLOW_DATA);

As already mentioned, the above is hardly readable. When studying the
current driver, I noticed a couple of bugs that I'm preparing fixes for.

Specifically, we shouldn't be overwriting the entire control register,
which changes the tranceiver suspend mode. Are there similar problems
with not doing bit updates of register 0x0a?

Either way, rebasing your patches on top of those should allow this to
be cleaned up somewhat.


Ans: the three chips TYPE_01 / TYPE_HX / TYPE_HXN have their own independen=
t
 flow control Register settings...
What advice do you have for handling here?

Here I have actually tested the three chips TYPE_01 / TYPE_HX / TYPE_HXN
TYPE_01: PL2303H
TYPE_HX: PL2303HXA/ PL2303XA/ PL2303HXD/PL2303TA/PL2303TB/PL2303RA/ PL2303S=
A.
TYPE_HXN: PL2303GC, PL2303GS, PL2303GL...

The test result is OK..



> +                     pl2303_vendor_write(serial,
> +                                     HXN_RESET_DOWN_UPSTREAM_REG,
> +                                     HXN_RESET_DOWN_UPSTREAM_DATA);

Can you write anything to this register to reset the buffers, or does it
have to be 0?
Ans: It have to reset to 0, please refer to PL2303_Linux\PL2303G_ChipReset.=
jpg


> +             else {
> +                     pl2303_vendor_write(serial,
> +                                     HX_RESET_DOWN_UPSTREAM_REG1,
> +                                     HX_RESET_DOWN_UPSTREAM_DATA);
> +                     pl2303_vendor_write(serial,
> +                                     HX_RESET_DOWN_UPSTREAM_REG2,
> +                                     HX_RESET_DOWN_UPSTREAM_DATA);

I assume the older versions allow for the and up and down buffers to be
reset independently? Please name these registers accordingly.
Ans: Yes, reset independently,
please refer to PL2303_Linux\PL2303_TYPE_HX_Reset.jpg
The original code is
        /* reset upstream data pipes */
        pl2303_vendor_write(serial, 8, 0);
        pl2303_vendor_write(serial, 9, 0);

You previously suggested that I am not using "magical" constants directly,
Please use defines rather than "magical" Constants.
What advice do you have for handling here?


> +/* PL2303HXN , TYPE_HXN */
> +#define PL2303G_PRODUCT_ID_GC        0x23A3
> +#define PL2303G_PRODUCT_ID_GB        0x23B3
> +#define PL2303G_PRODUCT_ID_GT        0x23C3
> +#define PL2303G_PRODUCT_ID_GL        0x23D3
> +#define PL2303G_PRODUCT_ID_GE        0x23E3
> +#define PL2303G_PRODUCT_ID_GS        0x23F3

Just use PL2303_ as prefix.
Ans: OK, I will use PL2303_ as prefix.,

PL2303_Linux \ File:please download the file from app box.
https://app.box.com/s/914zdvugkx6ok2gfr22uykj247l8046m


Charles.

Johan Hovold <johan@kernel.org> =E6=96=BC 2019=E5=B9=B44=E6=9C=882=E6=97=A5=
 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=883:22=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, Feb 13, 2019 at 08:30:00PM +0800, Charles Yeh wrote:
> > Prolific has developed a new USB to UART chip: PL2303HXN (PL2303GC/PL23=
03GS/PL2303GT/PL2303GL/PL2303GE)
>
> Ok, let's get back to this one.
>
> First a general comment; please make sure to address all review
> comments. I've already pointed out some issues that still hasn't been
> fixed and I've asked questions that have gone unanswered.
>
> If you disagree on something then just say so, but ignoring feedback is
> just going to make this take longer than necessary.
>
> For a start, please fix up the Subject line as we already discussed, and
> make sure to wrap your commit messages at 72 columns or so (I've reflown
> the rest of the message below).
>
> Always include a changelog (below the cut-off line) when resending so we
> know what changed when you update your patches.
>
> > The Vendor request used by the PL2303HXN (TYPE_HXN) is different from
> > the existing PL2303 series (TYPE_HX & TYPE_01).
> > Therefore, different Vendor requests are used to issue related commands=
.
> >
> > 1. Added a new TYPE_HXN type in pl2303_type_data, and then executes
> > new Vendor request, new flow control and other related instructions if
> > TYPE_HXN is recognized.
> >
> > 2. Because the new PL2303HXN can only accept the new Vendor request,
> > the old Vendor request cannot be accepted (the error message will be
> > returned) So first determine the TYPE_HX or TYPE_HXN through
> > TYPE_HX_READ_STATUS_REG in pl2303_startup.
> >
> >   2.1 If the return message is "1", then the PL2303 is the existing
> >   TYPE_HX/ TYPE_01 series.  The other settings in pl2303_startup are
> >   to continue execution.
> >
> >   2.2 If the return message is "not 1", then the PL2303 is the new
> >   TYPE_HXN series.  The other settings in pl2303_startup are ignored.
> >   (PL2303HXN will directly use the default value in the hardware, no
> >   need to add additional settings through the software)
> >
> > 3. In pl2303_open: Because TYPE_HXN is different from the instruction
> > of down/up stream used by TYPE_HX.  Therefore, we will also execute
> > different instructions here.
> >
> > 4. In pl2303_set_termios: The UART flow control instructions used by
> > TYPE_HXN/TYPE_HX/TYPE_01 are different.  Therefore, we will also
> > execute different instructions here.
> >
> > 5. In pl2303_vendor_read & pl2303_vendor_write, since TYPE_HXN is
> > different from the vendor request instruction used by TYPE_HX/TYPE_01,
> > it will also execute different instructions here.
>
> That's a good summary of the differences, but on a more general level,
> can you confirm the following:
>
>         1. The HXN register layout is entirely different from HX and
>            earlier devices.
>
>         2. HXN use the same CDC class requests (line encoding, etc) as
>            earlier revisions.
>
> Can you send me documentation for the HXN protocol? That would help a
> lot in finding the right abstraction level for this.
>
> > Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
> > ---
> >  drivers/usb/serial/pl2303.c | 131 +++++++++++++++++++++++++++++-------
> >  drivers/usb/serial/pl2303.h |   7 ++
> >  2 files changed, 113 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
> > index bb3f9aa4a909..d7d557e01390 100644
> > --- a/drivers/usb/serial/pl2303.c
> > +++ b/drivers/usb/serial/pl2303.c
> > @@ -47,6 +47,12 @@ static const struct usb_device_id id_table[] =3D {
> >       { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_MOTOROLA) },
> >       { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_ZTEK) },
> >       { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_TB) },
> > +     { USB_DEVICE(PL2303_VENDOR_ID, PL2303G_PRODUCT_ID_GC) },
> > +     { USB_DEVICE(PL2303_VENDOR_ID, PL2303G_PRODUCT_ID_GB) },
> > +     { USB_DEVICE(PL2303_VENDOR_ID, PL2303G_PRODUCT_ID_GT) },
> > +     { USB_DEVICE(PL2303_VENDOR_ID, PL2303G_PRODUCT_ID_GL) },
> > +     { USB_DEVICE(PL2303_VENDOR_ID, PL2303G_PRODUCT_ID_GE) },
> > +     { USB_DEVICE(PL2303_VENDOR_ID, PL2303G_PRODUCT_ID_GS) },
> >       { USB_DEVICE(IODATA_VENDOR_ID, IODATA_PRODUCT_ID) },
> >       { USB_DEVICE(IODATA_VENDOR_ID, IODATA_PRODUCT_ID_RSAQ5) },
> >       { USB_DEVICE(ATEN_VENDOR_ID, ATEN_PRODUCT_ID),
> > @@ -129,9 +135,11 @@ MODULE_DEVICE_TABLE(usb, id_table);
> >
> >  #define VENDOR_WRITE_REQUEST_TYPE    0x40
> >  #define VENDOR_WRITE_REQUEST         0x01
> > +#define VENDOR_WRITE_NREQUEST                0x80
> >
> >  #define VENDOR_READ_REQUEST_TYPE     0xc0
> >  #define VENDOR_READ_REQUEST          0x01
> > +#define VENDOR_READ_NREQUEST         0x81
> >
> >  #define UART_STATE_INDEX             8
> >  #define UART_STATE_MSR_MASK          0x8b
> > @@ -145,11 +153,30 @@ MODULE_DEVICE_TABLE(usb, id_table);
> >  #define UART_OVERRUN_ERROR           0x40
> >  #define UART_CTS                     0x80
> >
> > +#define TYPE_HX_READ_STATUS_REG              0x8080
> > +#define TYPE_HXN_FLOWCONTROL_REG     0x0A
>
> > +#define TYPE_HXN_HARDWAREFLOW_DATA   0xFA
> > +#define TYPE_HXN_SOFTWAREFLOW_DATA   0xEE
> > +#define TYPE_HXN_NOFLOW_DATA         0xFF
>
> What exactly does bits 0x15 (bits 4, 2 and 0) do?
>
> Is register 0x0a really only used for flow control?
>
> > +#define TYPE_HX_01_FLOWCONTROL_REG   0x00
> > +#define TYPE_01_HARDWAREFLOW_DATA    0x41
> > +#define TYPE_HX_HARDWAREFLOW_DATA    0x61
> > +#define TYPE_HX_01_SOFTWAREFLOW_DATA 0xC0
> > +#define TYPE_HX_01_NOFLOW_DATA               0x00
> > +#define UART_XON_CHAR                        0x11
> > +#define UART_XOFF_CHAR                       0x13
> > +#define HX_RESET_DOWN_UPSTREAM_REG1  0x08
> > +#define HX_RESET_DOWN_UPSTREAM_REG2  0x09
> > +#define HX_RESET_DOWN_UPSTREAM_DATA  0x00
> > +#define HXN_RESET_DOWN_UPSTREAM_REG  0x07
> > +#define HXN_RESET_DOWN_UPSTREAM_DATA 0x00
> > +
> >  static void pl2303_set_break(struct usb_serial_port *port, bool enable=
);
> >
> >  enum pl2303_type {
> >       TYPE_01,        /* Type 0 and 1 (difference unknown) */
> >       TYPE_HX,        /* HX version of the pl2303 chip */
> > +     TYPE_HXN,       /* HXN version of the pl2303 chip */
> >       TYPE_COUNT
> >  };
> >
> > @@ -179,16 +206,26 @@ static const struct pl2303_type_data pl2303_type_=
data[TYPE_COUNT] =3D {
> >       [TYPE_HX] =3D {
> >               .max_baud_rate =3D        12000000,
> >       },
> > +     [TYPE_HXN] =3D {
> > +             .max_baud_rate =3D        12000000,
> > +     },
> >  };
> >
> >  static int pl2303_vendor_read(struct usb_serial *serial, u16 value,
> >                                                       unsigned char buf=
[1])
> >  {
> >       struct device *dev =3D &serial->interface->dev;
> > +     struct pl2303_serial_private *spriv =3D usb_get_serial_data(seria=
l);
> >       int res;
> > +     u8 request;
> > +
> > +     if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN])
> > +             request =3D VENDOR_READ_NREQUEST;
> > +     else
> > +             request =3D VENDOR_READ_REQUEST;
> >
> >       res =3D usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev,=
 0),
> > -                     VENDOR_READ_REQUEST, VENDOR_READ_REQUEST_TYPE,
> > +                     request, VENDOR_READ_REQUEST_TYPE,
> >                       value, 0, buf, 1, 100);
> >       if (res !=3D 1) {
> >               dev_err(dev, "%s - failed to read [%04x]: %d\n", __func__=
,
> > @@ -207,12 +244,19 @@ static int pl2303_vendor_read(struct usb_serial *=
serial, u16 value,
> >  static int pl2303_vendor_write(struct usb_serial *serial, u16 value, u=
16 index)
> >  {
> >       struct device *dev =3D &serial->interface->dev;
> > +     struct pl2303_serial_private *spriv =3D usb_get_serial_data(seria=
l);
> >       int res;
> > +     u8 request;
> >
> >       dev_dbg(dev, "%s - [%04x] =3D %02x\n", __func__, value, index);
> >
> > +     if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN])
> > +             request =3D VENDOR_WRITE_NREQUEST;
> > +     else
> > +             request =3D VENDOR_WRITE_REQUEST;
> > +
> >       res =3D usb_control_msg(serial->dev, usb_sndctrlpipe(serial->dev,=
 0),
> > -                     VENDOR_WRITE_REQUEST, VENDOR_WRITE_REQUEST_TYPE,
> > +                     request, VENDOR_WRITE_REQUEST_TYPE,
> >                       value, index, NULL, 0, 100);
> >       if (res) {
> >               dev_err(dev, "%s - failed to write [%04x]: %d\n", __func_=
_,
> > @@ -292,6 +336,7 @@ static int pl2303_startup(struct usb_serial *serial=
)
> >       struct pl2303_serial_private *spriv;
> >       enum pl2303_type type =3D TYPE_01;
> >       unsigned char *buf;
> > +     int res;
> >
> >       spriv =3D kzalloc(sizeof(*spriv), GFP_KERNEL);
> >       if (!spriv)
> > @@ -313,26 +358,37 @@ static int pl2303_startup(struct usb_serial *seri=
al)
> >               type =3D TYPE_01;         /* type 1 */
> >       dev_dbg(&serial->interface->dev, "device type: %d\n", type);
> >
> > +     if (type =3D=3D TYPE_HX) {
>
> In an earlier version of your patch, you also checked bcdUSB here. Why
> did you remove it?
>
> > +             res =3D usb_control_msg(serial->dev,
> > +                     usb_rcvctrlpipe(serial->dev, 0),
> > +                     VENDOR_READ_REQUEST, VENDOR_READ_REQUEST_TYPE,
> > +                     TYPE_HX_READ_STATUS_REG, 0, buf, 1, 100);
>
> Please name the registers after what they do, not how you use them. What
> is register 0 that you read here? Does it have a name?
>
> > +             if (res !=3D 1)
> > +                     type =3D TYPE_HXN;
> > +     }
> > +
> >       spriv->type =3D &pl2303_type_data[type];
> >       spriv->quirks =3D (unsigned long)usb_get_serial_data(serial);
> >       spriv->quirks |=3D spriv->type->quirks;
> >
> >       usb_set_serial_data(serial, spriv);
> >
> > -     pl2303_vendor_read(serial, 0x8484, buf);
> > -     pl2303_vendor_write(serial, 0x0404, 0);
> > -     pl2303_vendor_read(serial, 0x8484, buf);
> > -     pl2303_vendor_read(serial, 0x8383, buf);
> > -     pl2303_vendor_read(serial, 0x8484, buf);
> > -     pl2303_vendor_write(serial, 0x0404, 1);
> > -     pl2303_vendor_read(serial, 0x8484, buf);
> > -     pl2303_vendor_read(serial, 0x8383, buf);
> > -     pl2303_vendor_write(serial, 0, 1);
> > -     pl2303_vendor_write(serial, 1, 0);
> > -     if (spriv->quirks & PL2303_QUIRK_LEGACY)
> > -             pl2303_vendor_write(serial, 2, 0x24);
> > -     else
> > -             pl2303_vendor_write(serial, 2, 0x44);
> > +     if (type !=3D TYPE_HXN) {
> > +             pl2303_vendor_read(serial, 0x8484, buf);
> > +             pl2303_vendor_write(serial, 0x0404, 0);
> > +             pl2303_vendor_read(serial, 0x8484, buf);
> > +             pl2303_vendor_read(serial, 0x8383, buf);
> > +             pl2303_vendor_read(serial, 0x8484, buf);
> > +             pl2303_vendor_write(serial, 0x0404, 1);
> > +             pl2303_vendor_read(serial, 0x8484, buf);
> > +             pl2303_vendor_read(serial, 0x8383, buf);
> > +             pl2303_vendor_write(serial, 0, 1);
> > +             pl2303_vendor_write(serial, 1, 0);
> > +             if (spriv->quirks & PL2303_QUIRK_LEGACY)
> > +                     pl2303_vendor_write(serial, 2, 0x24);
> > +             else
> > +                     pl2303_vendor_write(serial, 2, 0x44);
> > +     }
>
> Fair enough, since the HXN doesn't use the same registers, this needs to
> be done only for HXN or earlier, but we should probably add an
> initialisation callback instead of spreading conditionals throughout the
> driver.
>
> I think I know roughly what the code above does now, but since you are
> the only ones with access to the documentation, perhaps you can explain
> why TYPE_01 sets bit 0x20 of register 2 instead of 0x40 as the HX does?
> Is that even correct?
>
> >       kfree(buf);
> >
> > @@ -677,15 +733,30 @@ static void pl2303_set_termios(struct tty_struct =
*tty,
> >       }
> >
> >       if (C_CRTSCTS(tty)) {
> > -             if (spriv->quirks & PL2303_QUIRK_LEGACY)
> > -                     pl2303_vendor_write(serial, 0x0, 0x41);
>
> Why do the TYPE_01 not set bit 0x20 here? Do the legacy device support
> both auto-rts and auto-cts?
>
> > +             if (spriv->type =3D=3D &pl2303_type_data[TYPE_01])
> > +                     pl2303_vendor_write(serial, TYPE_HX_01_FLOWCONTRO=
L_REG,
> > +                                             TYPE_01_HARDWAREFLOW_DATA=
);
> > +             else if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN])
> > +                     pl2303_vendor_write(serial, TYPE_HXN_FLOWCONTROL_=
REG,
> > +                                             TYPE_HXN_HARDWAREFLOW_DAT=
A);
> > +             else
> > +                     pl2303_vendor_write(serial, TYPE_HX_01_FLOWCONTRO=
L_REG,
> > +                                             TYPE_HX_HARDWAREFLOW_DATA=
);
> > +     } else if (I_IXON(tty) && !I_IXANY(tty) && START_CHAR(tty) =3D=3D
> > +                     UART_XON_CHAR && STOP_CHAR(tty) =3D=3D UART_XOFF_=
CHAR) {
>
> No need to add defines for the start and stop char here.
>
> > +             if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN])
> > +                     pl2303_vendor_write(serial, TYPE_HXN_FLOWCONTROL_=
REG,
> > +                                             TYPE_HXN_SOFTWAREFLOW_DAT=
A);
> >               else
> > -                     pl2303_vendor_write(serial, 0x0, 0x61);
> > -     } else if (I_IXON(tty) && !I_IXANY(tty) && START_CHAR(tty) =3D=3D=
 0x11 &&
> > -                     STOP_CHAR(tty) =3D=3D 0x13) {
> > -             pl2303_vendor_write(serial, 0x0, 0xc0);
> > +                     pl2303_vendor_write(serial, TYPE_HX_01_FLOWCONTRO=
L_REG,
> > +                                             TYPE_HX_01_SOFTWAREFLOW_D=
ATA);
> >       } else {
> > -             pl2303_vendor_write(serial, 0x0, 0x0);
> > +             if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN])
> > +                     pl2303_vendor_write(serial, TYPE_HXN_FLOWCONTROL_=
REG,
> > +                                             TYPE_HXN_NOFLOW_DATA);
> > +             else
> > +                     pl2303_vendor_write(serial, TYPE_HX_01_FLOWCONTRO=
L_REG,
> > +                                             TYPE_HX_01_NOFLOW_DATA);
>
> As already mentioned, the above is hardly readable. When studying the
> current driver, I noticed a couple of bugs that I'm preparing fixes for.
>
> Specifically, we shouldn't be overwriting the entire control register,
> which changes the tranceiver suspend mode. Are there similar problems
> with not doing bit updates of register 0x0a?
>
> Either way, rebasing your patches on top of those should allow this to
> be cleaned up somewhat.
>
> >       }
> >
> >       kfree(buf);
> > @@ -726,8 +797,18 @@ static int pl2303_open(struct tty_struct *tty, str=
uct usb_serial_port *port)
> >               usb_clear_halt(serial->dev, port->read_urb->pipe);
> >       } else {
> >               /* reset upstream data pipes */
> > -             pl2303_vendor_write(serial, 8, 0);
> > -             pl2303_vendor_write(serial, 9, 0);
> > +             if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN])
>
> You need to added braces ({}) to both branches here.
>
> > +                     pl2303_vendor_write(serial,
> > +                                     HXN_RESET_DOWN_UPSTREAM_REG,
> > +                                     HXN_RESET_DOWN_UPSTREAM_DATA);
>
> Can you write anything to this register to reset the buffers, or does it
> have to be 0?
>
> > +             else {
> > +                     pl2303_vendor_write(serial,
> > +                                     HX_RESET_DOWN_UPSTREAM_REG1,
> > +                                     HX_RESET_DOWN_UPSTREAM_DATA);
> > +                     pl2303_vendor_write(serial,
> > +                                     HX_RESET_DOWN_UPSTREAM_REG2,
> > +                                     HX_RESET_DOWN_UPSTREAM_DATA);
>
> I assume the older versions allow for the and up and down buffers to be
> reset independently? Please name these registers accordingly.
>
> > +             }
> >       }
> >
> >       /* Setup termios */
> > diff --git a/drivers/usb/serial/pl2303.h b/drivers/usb/serial/pl2303.h
> > index 559941ca884d..898ddc1a7302 100644
> > --- a/drivers/usb/serial/pl2303.h
> > +++ b/drivers/usb/serial/pl2303.h
> > @@ -21,6 +21,13 @@
> >  #define PL2303_PRODUCT_ID_MOTOROLA   0x0307
> >  #define PL2303_PRODUCT_ID_ZTEK               0xe1f1
> >
> > +/* PL2303HXN , TYPE_HXN */
> > +#define PL2303G_PRODUCT_ID_GC        0x23A3
> > +#define PL2303G_PRODUCT_ID_GB        0x23B3
> > +#define PL2303G_PRODUCT_ID_GT        0x23C3
> > +#define PL2303G_PRODUCT_ID_GL        0x23D3
> > +#define PL2303G_PRODUCT_ID_GE        0x23E3
> > +#define PL2303G_PRODUCT_ID_GS        0x23F3
>
> Just use PL2303_ as prefix.
>
> >
> >  #define ATEN_VENDOR_ID               0x0557
> >  #define ATEN_VENDOR_ID2              0x0547
>
> Thanks,
> Johan
