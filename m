Return-Path: <SRS0=xlna=ST=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81D7C282DA
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 10:51:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6209F20821
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 10:51:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5poGwVY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731846AbfDQKvJ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Apr 2019 06:51:09 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39351 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731108AbfDQKvJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Apr 2019 06:51:09 -0400
Received: by mail-wm1-f68.google.com with SMTP id n25so3000095wmk.4
        for <linux-usb@vger.kernel.org>; Wed, 17 Apr 2019 03:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=P0iEYIIBgJ+EQtX5XQgHLGzlvtj0PY1KVFjHmjOPmkE=;
        b=h5poGwVY+AL/Wf1FteXOl9diASJDdUmQICDv+05Jxfgd7V+8IYz98zLQrOj76Xrksc
         mY+p8B1tcQq9fDcPdx3s7Ic3nitnDag/lLA8OjVVwcr/AHXNAmNN6HURg0zuEfxTJtvv
         wGDCTJtDr66T6NOgde20RVMynPIgTgq6806BBg+KGhFB0ch8VTqZuBV27DFICVXY971t
         Q4JqKOgXeTa3VBGFHyylfA2NYyxlu7Af6mTyuCWgkR4ks8xxATOtfbsgxJoEIwOa8iQv
         Iuo286J8/ZNfoXrkZ38Vfw7N/0Qb/bcoggru3y2za27F6u7YvZdBTVyAwGBWVwGag/mh
         mXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=P0iEYIIBgJ+EQtX5XQgHLGzlvtj0PY1KVFjHmjOPmkE=;
        b=rli2JRC2zYCYqtZWQ46iwiqDpIV03MkQP8kWgnIURV3TTjavLJExK29JK1k8bUM0xQ
         mY3oUnRlOqOQtoV/2/2YWcned/u5+tOxDl7Ahtt8lI6Wd8uIbLUoGAT5JS8EFBQcxO5J
         1wzufrxxuM2/byXsbOK+y3nSG1SneVeDauQZ3ehjxuZEktYOeOUQCZBBeq+rCdIcvm+H
         vzfF92nqG6+8z+NclWEK80DotNdaJqwWco3iHkF7rslfF9irvjuIENyuC1+lnzXqT/Em
         nlqW1DOKF9KsdBzqlAheooeK4CEm04CQNLD2XNoBnHuiG9+uz6ac0LtfPG41C/pk2+Cd
         H55g==
X-Gm-Message-State: APjAAAVjAVH/LfyymTYaSQB5gnGeuVuBm3Sr+trJGCB9NMiQupveAG0S
        omDpy1miL43StKeTHCsqCHlsb5y4QkTU0890hnc=
X-Google-Smtp-Source: APXvYqw6MflTu3CQM8pK3tJ8cyXdJnF0kIqPYrMMLeVf6POUXxcsGV6/JsLOmJIJ/HPILQ044G0Oj5JUbE0JlrrBG9s=
X-Received: by 2002:a1c:df89:: with SMTP id w131mr29963087wmg.82.1555498266751;
 Wed, 17 Apr 2019 03:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190213123000.4656-1-charlesyeh522@gmail.com>
 <20190402072235.GI12562@localhost> <CAAZvQQ6eOVH_YPxHq_PmDSmFSErswnm8njfjOO6mR9oOi0r5_Q@mail.gmail.com>
 <20190415085626.GB29656@localhost>
In-Reply-To: <20190415085626.GB29656@localhost>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Wed, 17 Apr 2019 18:50:55 +0800
Message-ID:
 <CAAZvQQ6JHwZ+iOo02s45SqYUo2sV3o49VJ3QGkL4Yh9Pyi_mMA@mail.gmail.com>
Subject: Re: [PATCH] USB:serial:pl2303:Add new PID to support PL2303HXN (TYPE_HXN)
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        =?UTF-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190417105055.vC9FjaMEMNEBmS0UEQglhoYJz9U0PYIIsXQj5tMzZCg@z>

Hello Sir,

Please download the PL2303_Linux_0419.zip from
https://app.box.com/s/uh9kldrdldjnmjffku8gkdvvaq5496tk

> > After the actual test (I have tested the old PL2303H chip on Linux),
> > when I plug in the PL2303H (TYPE_01), the Linux code will execute the c=
ode:
> > if (spriv->quirks & PL2303_QUIRK_LEGACY) itinerary code.
> > So I confirm This "PL2303_QUIRK_LEGACY" of code refers to PL2303H(TYPE_=
01)
>
> Correct, but my question was about bit 0x20 for TYPE_01 devices; why
> isn't it being as set as for TYPE_HX?
>

TYPE_01 / TYPE_HX / TYPE_HXN are different hardware design.
Please refer to PL2303_Linux_0419\PL2303_TYPE_01_UART_Flow.jpg &
PL2303_TYPE_HX_UART_Flow.jpg


>
> Well, without documentation it is hard to give advice. But the
> information you provided above, indicates that you should not be
> overwriting these registers completely for HXN either when updating the
> flow-control settings. Only the bits 2..4 (and possibly 0..1) should be
> written.
>
> Take a look at the patches I merged for doing this on the older devices.
> You should be able to use the same helper when updating these
> registers.

Please refer to PL2303_Linux_0419\
PL2303_TYPE_01_UART_Flow.jpg &
PL2303_TYPE_HX_UART_Flow.jpg &
PL2303G_TYPE_HXN_UART_Flow.jpg



If you have other questions (whether it's my newly written patch code or
the code that originally existed), please try to raise it... Thanks!

The code that originally existed; not what I wrote..
But I have rewritten many times to a lot of customers...
probably can also guess the usage of the original code.


I just used
"git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
"
to get the latest Linux kernel.

The code I see in the pl2303_set_termios function
is still pl2303_vendor_write(serial,0x0,0x41),
Not pl2303_update_reg(serial,0,PL2303_FLOWCTRL_MASK,0x40);


Can I write a new patch?
"git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
"
But I don't want to rewrite the original code.
For example "pl2303_vendor_write(serial,0x0,0x41)"
Because that's the old code.. Not that I added the patch code this time.


Charles.

Johan Hovold <johan@kernel.org> =E6=96=BC 2019=E5=B9=B44=E6=9C=8815=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:56=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Charles,
>
> Please fix your mail setup so that you can respond inline as is
> customary on the lists. Your mails are currently unnecessarily hard to
> read due to it not being clear what is quoted text and what isn't.
>
> Specifically, quoted text should have an extra "> " at the start of the
> line, and don't copy text and respond to it (just reply *inline*).
>
> Currently there's a second copy of the mail your responding to at the
> end of your mails. That bit should instead contain your replies (with
> unnecessary context removed).
>
> On Tue, Apr 09, 2019 at 05:52:45PM +0800, Charles Yeh wrote:
> > Hi Johan,
> >       1. The HXN register layout is entirely different from HX and
> >            earlier devices.
> >
> >         2. HXN use the same CDC class requests (line encoding, etc) as
> >            earlier revisions.
> >
> > Can you send me documentation for the HXN protocol? That would help a
> > lot in finding the right abstraction level for this.
> >
> > Ans=EF=BC=9A
> > Yes,The HXN register layout is entirely different from HX and earlier d=
evices,
> > Yes, HXN use the same CDC class requests (line encoding, etc) as
> > earlier revisions
>
> Ok, thanks for confirming.
>
> > I don't have a PL2303G (HXN) Word file, I only have Excel's table file,
> > please refer to PL2303_Linux\Vendor_Requesut.png
>
> Did you forget to attach the png? Excel files describing the protocol
> would do just fine.
>
> > Or you can install window driver use PL2303G demo board.
>
> > and then USB Bus Hound to analysis the vendor request.
>
> No, I'm certainly not going to reverse engineer your Windows driver in
> order to help you.
>
> Surely, you must have some documentation for your devices?
>
> > The original Prolific company is hoping:
> > TYPE_HX and TYPE_01 used old driver(pl2303.c & pl2303.h)
> > The new PL2303G (TYPE_HXN) uses new driver(plser.c & plser.h),
> >
> > You can go to the website of Prolific, in the website,
> >
> > TYPE_HX and TYPE_01 are called
> > PL2303 USB to Serial Bridge Controllers (All Chip Versions)
> >
> > TYPE_HXN is called
> > PL2303G USB to Serial Bridge Controllers (All Chip Versions).
> >
> > We provide two different file paths on the website, the name.file..
> > is to distinguish between TYPE_HX/01 and TYPE_HXN
> > please refer to PL2303_Linux\Window_support_hx_hxn.jpg
> >
> > TYPE_HX and TYPE_01:the windows file name is ser2pl.sys & ser2pl64.sys.
> >
> > TYPE_HXN:the windows file name is plser.sys & plser64.sys.
> >
> > please refer to PL2303_Linux\window_plser_ser2pl.bmp
> >
> > But Greg disagreed with the Linux OS about new File name(plser.c & plse=
r.h)
> > So we did that we merged with the existing pl2303.c(h)
> > into a new chip (PL2303G, TYPE_HXN)
>
> Yes, the plser driver you submitted was just a copy of pl2303, with
> minimal changes to support pl2303g. With that much code being shared you
> need to add support for the new device type to the current driver.
>
> But the lack of documentation of the protocols used is making it hard to
> determine the appropriate abstraction level.
>
> > > +#define TYPE_HXN_FLOWCONTROL_REG     0x0A
> >
> > > +#define TYPE_HXN_HARDWAREFLOW_DATA   0xFA
> > > +#define TYPE_HXN_SOFTWAREFLOW_DATA   0xEE
> > > +#define TYPE_HXN_NOFLOW_DATA         0xFF
> >
> > What exactly does bits 0x15 (bits 4, 2 and 0) do?
> > Ans:please refer to PL2303_Linux\PL2303G_TYPE_HXN_UART_Flow.jpg,
> >
> > Is register 0x0a really only used for flow control?
> > Ans: Yes, please refer to PL2303_Linux\PL2303G_TYPE_HXN_UART_Flow.jpg,
> > 0x0A(Bit 2, 3, 4)is UART flow control settting,
> > it only supports TYPE_HXN, no supports TYPE_HX/01.
>
> Ok, thanks (found the link at the end of the mail now).
>
> > In an earlier version of your patch, you also checked bcdUSB here. Why
> > did you remove it?
> >
> > > +             res =3D usb_control_msg(serial->dev,
> > > +                     usb_rcvctrlpipe(serial->dev, 0),
> > > +                     VENDOR_READ_REQUEST, VENDOR_READ_REQUEST_TYPE,
> > > +                     TYPE_HX_READ_STATUS_REG, 0, buf, 1, 100);
> >
> > Please name the registers after what they do, not how you use them. Wha=
t
> > is register 0 that you read here? Does it have a name?
> >
> > Ans: Because the "kbuild test robot <lkp@intel.com>" reply me a error.
> > Please refer to Email: "Tuesday, December 25, 2018, at 11:39 pm"
> > or refer to PL2303_Linux\remoe_checked_bcdUSB.txt
>
> Yes, you needed to use helper function to deal with endianess as was
> pointed out to you in that thread. Why didn't you use the helper, and
> instead just dropped the check?
>
> > Why TYPE_01 sets bit 0x20 of register 2 instead of 0x40 as the HX does?
> > Is that even correct?
> > Ans: Yes, it is correct,
> > The Output(TX/DTR/RTS) Tri-state H/W design is different.
> >
> > TYPE_01: RS-232 Output Tri-state:
> > 0: RS-232 output in output mode;
> > 1: RS-232 output tri-state.
> >
> > TYPE_HX_Serial Port (TXD, RTS, and DTR) Output Enable:
> > 00 =E2=80=93 Disable output signals (Tri-State) at all time;
> > 01 =E2=80=93 Disable output signals (Tri-State) during suspend;
> > 10, 11 =E2=80=93 Set output signals to HIGH during suspend;
>
> Ok.
>
> > >       if (C_CRTSCTS(tty)) {
> > > -             if (spriv->quirks & PL2303_QUIRK_LEGACY)
> > > -                     pl2303_vendor_write(serial, 0x0, 0x41);
> >
> > Why do the TYPE_01 not set bit 0x20 here? Do the legacy device support
> > both auto-rts and auto-cts?
> >
> > Ans: Yes, it is correct,
> > The Hardware UART flow control settting design is different
> > between TYPT_01 and TYPT_HX.
> >
> > Although I have been in Prolific Company for almost 16 years..
> > But TYPE_01 (PL2303H) has been discontinued(EOL) for 13 years...
> > Now can't find this IC(TYPT_01: PL2303H) on the market..
>
> Sure, but we still need to make sure we don't break any working setups
> using these old devices, so I still need to understand how the older
> protocols work.
>
> > The line"if (spriv->quirks & PL2303_QUIRK_LEGACY)"
> > you are asking now is not what I wrote...
> > I don't know why to define it as PL2303_QUIRK_LEGACY.
>
> I added that at some point in an attempt to clean up this
> reverse-engineering driver. You can read it as a TYPE_01 test.
>
> > I am mainly responsible for the PL2303 driver
> > Windows, WinCE, Mac & Android in Prolific.
> > On the Linux driver side, only when the customer has a problem,
> > or want to add new features (such as GPIO control, new Baud rate),
> > I will rewrite the Linux code.
> > Rewritten Linux code will only be given to the corresponding customer.
> >
> > Just like this time, because I want to add PL2303G (TYPE_HXN) to Linux,
> > I just rewritten the Linux code...
> > For some definitions in the Linux code,
> > such as why it is defined as PL2303_QUIRK_LEGACY,
> > I really don't know very well
> >
> > Before rewriting the Linux code,
> > I can only guess "PL2303_QUIRK_LEGACY" that this refers to the
> > old PL2303 (PL2303H, TYPE_01)..
>
> Right.
>
> > After the actual test (I have tested the old PL2303H chip on Linux),
> > when I plug in the PL2303H (TYPE_01), the Linux code will execute the c=
ode:
> > if (spriv->quirks & PL2303_QUIRK_LEGACY) itinerary code.
> > So I confirm This "PL2303_QUIRK_LEGACY" of code refers to PL2303H(TYPE_=
01)
>
> Correct, but my question was about bit 0x20 for TYPE_01 devices; why
> isn't it being as set as for TYPE_HX?
>
> > > +             if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN])
> > > +                     pl2303_vendor_write(serial, TYPE_HXN_FLOWCONTRO=
L_REG,
> > > +                                             TYPE_HXN_SOFTWAREFLOW_D=
ATA);
> > >               else
> > > -                     pl2303_vendor_write(serial, 0x0, 0x61);
> > > -     } else if (I_IXON(tty) && !I_IXANY(tty) && START_CHAR(tty) =3D=
=3D 0x11 &&
> > > -                     STOP_CHAR(tty) =3D=3D 0x13) {
> > > -             pl2303_vendor_write(serial, 0x0, 0xc0);
> > > +                     pl2303_vendor_write(serial, TYPE_HX_01_FLOWCONT=
ROL_REG,
> > > +                                             TYPE_HX_01_SOFTWAREFLOW=
_DATA);
> > >       } else {
> > > -             pl2303_vendor_write(serial, 0x0, 0x0);
> > > +             if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN])
> > > +                     pl2303_vendor_write(serial, TYPE_HXN_FLOWCONTRO=
L_REG,
> > > +                                             TYPE_HXN_NOFLOW_DATA);
> > > +             else
> > > +                     pl2303_vendor_write(serial, TYPE_HX_01_FLOWCONT=
ROL_REG,
> > > +                                             TYPE_HX_01_NOFLOW_DATA)=
;
> >
> > As already mentioned, the above is hardly readable. When studying the
> > current driver, I noticed a couple of bugs that I'm preparing fixes for=
.
> >
> > Specifically, we shouldn't be overwriting the entire control register,
> > which changes the tranceiver suspend mode. Are there similar problems
> > with not doing bit updates of register 0x0a?
> >
> > Either way, rebasing your patches on top of those should allow this to
> > be cleaned up somewhat.
> >
> >
> > Ans: the three chips TYPE_01 / TYPE_HX / TYPE_HXN have their own indepe=
ndent
> >  flow control Register settings...
> > What advice do you have for handling here?
> >
> > Here I have actually tested the three chips TYPE_01 / TYPE_HX / TYPE_HX=
N
> > TYPE_01: PL2303H
> > TYPE_HX: PL2303HXA/ PL2303XA/ PL2303HXD/PL2303TA/PL2303TB/PL2303RA/ PL2=
303SA.
> > TYPE_HXN: PL2303GC, PL2303GS, PL2303GL...
> >
> > The test result is OK..
>
> Well, without documentation it is hard to give advice. But the
> information you provided above, indicates that you should not be
> overwriting these registers completely for HXN either when updating the
> flow-control settings. Only the bits 2..4 (and possibly 0..1) should be
> written.
>
> Take a look at the patches I merged for doing this on the older devices.
> You should be able to use the same helper when updating these
> registers.
>
>         https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.=
git/commit/?h=3Dusb-next&id=3Df64c3ab230682e8395a7fbd01f3eb5140c837d4e
>
> > > +                     pl2303_vendor_write(serial,
> > > +                                     HXN_RESET_DOWN_UPSTREAM_REG,
> > > +                                     HXN_RESET_DOWN_UPSTREAM_DATA);
> >
> > Can you write anything to this register to reset the buffers, or does i=
t
> > have to be 0?
> > Ans: It have to reset to 0, please refer to PL2303_Linux\PL2303G_ChipRe=
set.jpg
>
> But that jpg shows only bit 0 and 1 being used for data pipe reset. And
> shouldn't you be writing 0x02 to reset those?
>
> > > +             else {
> > > +                     pl2303_vendor_write(serial,
> > > +                                     HX_RESET_DOWN_UPSTREAM_REG1,
> > > +                                     HX_RESET_DOWN_UPSTREAM_DATA);
> > > +                     pl2303_vendor_write(serial,
> > > +                                     HX_RESET_DOWN_UPSTREAM_REG2,
> > > +                                     HX_RESET_DOWN_UPSTREAM_DATA);
> >
> > I assume the older versions allow for the and up and down buffers to be
> > reset independently? Please name these registers accordingly.
> > Ans: Yes, reset independently,
> > please refer to PL2303_Linux\PL2303_TYPE_HX_Reset.jpg
> > The original code is
> >         /* reset upstream data pipes */
> >         pl2303_vendor_write(serial, 8, 0);
> >         pl2303_vendor_write(serial, 9, 0);
> >
> > You previously suggested that I am not using "magical" constants direct=
ly,
> > Please use defines rather than "magical" Constants.
> > What advice do you have for handling here?
>
> Name register and bit-definitions after what they do. We need code to be
> clean and mostly self-documenting. In this case, based on the
> information provided above, you could use
>
>         #define PL2303_RESET_DOWNSTREAM_PIPE    8
>         #define PL2303_RESET_UPSTREAM_PIPE      9
>
> for example.
>
> As the protocol appears to mandate writing 0 to these registers, it
> may be ok to keep that as a numerical constant.
>
> Johan
