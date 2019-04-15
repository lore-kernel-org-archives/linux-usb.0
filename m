Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C59C10F0E
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 08:56:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB43D20833
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 08:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555318587;
	bh=tYPU4N9d3jFYTQCJzyn5QCaQrephOJbtq9GrGSLWOhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=MwO1aj12paJMJBfd2SXKqLJfxxoYqoa4IXXaERB9w9xE74t2O3YMQQQnvB+ThFhCe
	 q5ZT6T3Ff/0rMPyQPNfoSYTDavzGpIToUC8HIlzkWi0Sb6FOEru3rUzBS9UbfyqfBy
	 VJr3bWspZd/joKCJdTgdYzCIW6dpTfHT2dzo+dbU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725798AbfDOI40 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 04:56:26 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35868 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbfDOI40 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Apr 2019 04:56:26 -0400
Received: by mail-lf1-f67.google.com with SMTP id u17so12455031lfi.3
        for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2019 01:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=905Gi4QgLQHkyuLuZVcD3qy9DkOh4t1kzO9fNnRVJLE=;
        b=NyUg85L4WiF389PCHM/ZOrjorUJ8PlK/PsppIBem01ltFigIBfN4iRDE/CwplSCnkv
         n331aKQt9QxpsuKJNOzX/X/E8oLHsAKYrWesn4CraTqNNSVeTECiCv4OZXhaGSIUqFhl
         5vZCpeXv807hS++MZuh50Os1Lq+kki2vvrph0qooiUnGK+XvzfjxRuk5MscTJv1p2vNv
         VCdNmZ+5DDSCH7KgCP8umr+TLxYfPnMtf+v+XmbuUWy+KUvXNAysMzTs1IwQqXF3wZMH
         akSqORzD1cMiL55YzIikQ1TswlIYpfRvv/SxLMkGgSDInZbcDSd6PMu8cgXkR1BJUaYf
         uwJA==
X-Gm-Message-State: APjAAAVSLYQbX6Fzkit5k9Y5UKak3W+ldzbszfBeEO5KTKmzXl0jH+zb
        89O0COtcImJ6jdZNoR4yZZV4c103
X-Google-Smtp-Source: APXvYqwy0Yphw/Qbt7mFiD5vvk818b3+BMaoVTWC4sEw2FGwSAxvKDfAuJi/+0ZmC6vPbBS3ePCTlA==
X-Received: by 2002:a19:f81a:: with SMTP id a26mr7517085lff.63.1555318583351;
        Mon, 15 Apr 2019 01:56:23 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id a28sm1003944lfk.54.2019.04.15.01.56.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Apr 2019 01:56:22 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hFxPe-0008II-SQ; Mon, 15 Apr 2019 10:56:27 +0200
Date:   Mon, 15 Apr 2019 10:56:26 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, charles-yeh@prolific.com.tw
Subject: Re: [PATCH] USB:serial:pl2303:Add new PID to support PL2303HXN
 (TYPE_HXN)
Message-ID: <20190415085626.GB29656@localhost>
References: <20190213123000.4656-1-charlesyeh522@gmail.com>
 <20190402072235.GI12562@localhost>
 <CAAZvQQ6eOVH_YPxHq_PmDSmFSErswnm8njfjOO6mR9oOi0r5_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAZvQQ6eOVH_YPxHq_PmDSmFSErswnm8njfjOO6mR9oOi0r5_Q@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190415085626.RNiNgyZmgGOcnlahSf--Lxp4njcIfzvX3v6RltzQKWI@z>

Hi Charles,

Please fix your mail setup so that you can respond inline as is
customary on the lists. Your mails are currently unnecessarily hard to
read due to it not being clear what is quoted text and what isn't.

Specifically, quoted text should have an extra "> " at the start of the
line, and don't copy text and respond to it (just reply *inline*).

Currently there's a second copy of the mail your responding to at the
end of your mails. That bit should instead contain your replies (with
unnecessary context removed).

On Tue, Apr 09, 2019 at 05:52:45PM +0800, Charles Yeh wrote:
> Hi Johan,
>       1. The HXN register layout is entirely different from HX and
>            earlier devices.
> 
>         2. HXN use the same CDC class requests (line encoding, etc) as
>            earlier revisions.
> 
> Can you send me documentation for the HXN protocol? That would help a
> lot in finding the right abstraction level for this.
> 
> Ans：
> Yes,The HXN register layout is entirely different from HX and earlier devices,
> Yes, HXN use the same CDC class requests (line encoding, etc) as
> earlier revisions

Ok, thanks for confirming.

> I don't have a PL2303G (HXN) Word file, I only have Excel's table file,
> please refer to PL2303_Linux\Vendor_Requesut.png

Did you forget to attach the png? Excel files describing the protocol
would do just fine.

> Or you can install window driver use PL2303G demo board.

> and then USB Bus Hound to analysis the vendor request.

No, I'm certainly not going to reverse engineer your Windows driver in
order to help you.

Surely, you must have some documentation for your devices?

> The original Prolific company is hoping:
> TYPE_HX and TYPE_01 used old driver(pl2303.c & pl2303.h)
> The new PL2303G (TYPE_HXN) uses new driver(plser.c & plser.h),
> 
> You can go to the website of Prolific, in the website,
> 
> TYPE_HX and TYPE_01 are called
> PL2303 USB to Serial Bridge Controllers (All Chip Versions)
> 
> TYPE_HXN is called
> PL2303G USB to Serial Bridge Controllers (All Chip Versions).
> 
> We provide two different file paths on the website, the name.file..
> is to distinguish between TYPE_HX/01 and TYPE_HXN
> please refer to PL2303_Linux\Window_support_hx_hxn.jpg
> 
> TYPE_HX and TYPE_01:the windows file name is ser2pl.sys & ser2pl64.sys.
> 
> TYPE_HXN:the windows file name is plser.sys & plser64.sys.
> 
> please refer to PL2303_Linux\window_plser_ser2pl.bmp
> 
> But Greg disagreed with the Linux OS about new File name(plser.c & plser.h)
> So we did that we merged with the existing pl2303.c(h)
> into a new chip (PL2303G, TYPE_HXN)

Yes, the plser driver you submitted was just a copy of pl2303, with
minimal changes to support pl2303g. With that much code being shared you
need to add support for the new device type to the current driver.

But the lack of documentation of the protocols used is making it hard to
determine the appropriate abstraction level.

> > +#define TYPE_HXN_FLOWCONTROL_REG     0x0A
> 
> > +#define TYPE_HXN_HARDWAREFLOW_DATA   0xFA
> > +#define TYPE_HXN_SOFTWAREFLOW_DATA   0xEE
> > +#define TYPE_HXN_NOFLOW_DATA         0xFF
> 
> What exactly does bits 0x15 (bits 4, 2 and 0) do?
> Ans:please refer to PL2303_Linux\PL2303G_TYPE_HXN_UART_Flow.jpg,
> 
> Is register 0x0a really only used for flow control?
> Ans: Yes, please refer to PL2303_Linux\PL2303G_TYPE_HXN_UART_Flow.jpg,
> 0x0A(Bit 2, 3, 4)is UART flow control settting,
> it only supports TYPE_HXN, no supports TYPE_HX/01.

Ok, thanks (found the link at the end of the mail now).

> In an earlier version of your patch, you also checked bcdUSB here. Why
> did you remove it?
> 
> > +             res = usb_control_msg(serial->dev,
> > +                     usb_rcvctrlpipe(serial->dev, 0),
> > +                     VENDOR_READ_REQUEST, VENDOR_READ_REQUEST_TYPE,
> > +                     TYPE_HX_READ_STATUS_REG, 0, buf, 1, 100);
> 
> Please name the registers after what they do, not how you use them. What
> is register 0 that you read here? Does it have a name?
> 
> Ans: Because the "kbuild test robot <lkp@intel.com>" reply me a error.
> Please refer to Email: "Tuesday, December 25, 2018, at 11:39 pm"
> or refer to PL2303_Linux\remoe_checked_bcdUSB.txt

Yes, you needed to use helper function to deal with endianess as was
pointed out to you in that thread. Why didn't you use the helper, and
instead just dropped the check?

> Why TYPE_01 sets bit 0x20 of register 2 instead of 0x40 as the HX does?
> Is that even correct?
> Ans: Yes, it is correct,
> The Output(TX/DTR/RTS) Tri-state H/W design is different.
> 
> TYPE_01: RS-232 Output Tri-state:
> 0: RS-232 output in output mode;
> 1: RS-232 output tri-state.
> 
> TYPE_HX_Serial Port (TXD, RTS, and DTR) Output Enable:
> 00 – Disable output signals (Tri-State) at all time;
> 01 – Disable output signals (Tri-State) during suspend;
> 10, 11 – Set output signals to HIGH during suspend;

Ok.

> >       if (C_CRTSCTS(tty)) {
> > -             if (spriv->quirks & PL2303_QUIRK_LEGACY)
> > -                     pl2303_vendor_write(serial, 0x0, 0x41);
> 
> Why do the TYPE_01 not set bit 0x20 here? Do the legacy device support
> both auto-rts and auto-cts?
> 
> Ans: Yes, it is correct,
> The Hardware UART flow control settting design is different
> between TYPT_01 and TYPT_HX.
> 
> Although I have been in Prolific Company for almost 16 years..
> But TYPE_01 (PL2303H) has been discontinued(EOL) for 13 years...
> Now can't find this IC(TYPT_01: PL2303H) on the market..

Sure, but we still need to make sure we don't break any working setups
using these old devices, so I still need to understand how the older
protocols work.

> The line"if (spriv->quirks & PL2303_QUIRK_LEGACY)"
> you are asking now is not what I wrote...
> I don't know why to define it as PL2303_QUIRK_LEGACY.

I added that at some point in an attempt to clean up this
reverse-engineering driver. You can read it as a TYPE_01 test. 

> I am mainly responsible for the PL2303 driver
> Windows, WinCE, Mac & Android in Prolific.
> On the Linux driver side, only when the customer has a problem,
> or want to add new features (such as GPIO control, new Baud rate),
> I will rewrite the Linux code.
> Rewritten Linux code will only be given to the corresponding customer.
> 
> Just like this time, because I want to add PL2303G (TYPE_HXN) to Linux,
> I just rewritten the Linux code...
> For some definitions in the Linux code,
> such as why it is defined as PL2303_QUIRK_LEGACY,
> I really don't know very well
> 
> Before rewriting the Linux code,
> I can only guess "PL2303_QUIRK_LEGACY" that this refers to the
> old PL2303 (PL2303H, TYPE_01)..

Right.

> After the actual test (I have tested the old PL2303H chip on Linux),
> when I plug in the PL2303H (TYPE_01), the Linux code will execute the code:
> if (spriv->quirks & PL2303_QUIRK_LEGACY) itinerary code.
> So I confirm This "PL2303_QUIRK_LEGACY" of code refers to PL2303H(TYPE_01)

Correct, but my question was about bit 0x20 for TYPE_01 devices; why
isn't it being as set as for TYPE_HX?

> > +             if (spriv->type == &pl2303_type_data[TYPE_HXN])
> > +                     pl2303_vendor_write(serial, TYPE_HXN_FLOWCONTROL_REG,
> > +                                             TYPE_HXN_SOFTWAREFLOW_DATA);
> >               else
> > -                     pl2303_vendor_write(serial, 0x0, 0x61);
> > -     } else if (I_IXON(tty) && !I_IXANY(tty) && START_CHAR(tty) == 0x11 &&
> > -                     STOP_CHAR(tty) == 0x13) {
> > -             pl2303_vendor_write(serial, 0x0, 0xc0);
> > +                     pl2303_vendor_write(serial, TYPE_HX_01_FLOWCONTROL_REG,
> > +                                             TYPE_HX_01_SOFTWAREFLOW_DATA);
> >       } else {
> > -             pl2303_vendor_write(serial, 0x0, 0x0);
> > +             if (spriv->type == &pl2303_type_data[TYPE_HXN])
> > +                     pl2303_vendor_write(serial, TYPE_HXN_FLOWCONTROL_REG,
> > +                                             TYPE_HXN_NOFLOW_DATA);
> > +             else
> > +                     pl2303_vendor_write(serial, TYPE_HX_01_FLOWCONTROL_REG,
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
> 
> Ans: the three chips TYPE_01 / TYPE_HX / TYPE_HXN have their own independent
>  flow control Register settings...
> What advice do you have for handling here?
> 
> Here I have actually tested the three chips TYPE_01 / TYPE_HX / TYPE_HXN
> TYPE_01: PL2303H
> TYPE_HX: PL2303HXA/ PL2303XA/ PL2303HXD/PL2303TA/PL2303TB/PL2303RA/ PL2303SA.
> TYPE_HXN: PL2303GC, PL2303GS, PL2303GL...
> 
> The test result is OK..

Well, without documentation it is hard to give advice. But the
information you provided above, indicates that you should not be
overwriting these registers completely for HXN either when updating the
flow-control settings. Only the bits 2..4 (and possibly 0..1) should be
written.

Take a look at the patches I merged for doing this on the older devices.
You should be able to use the same helper when updating these
registers.

	https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/commit/?h=usb-next&id=f64c3ab230682e8395a7fbd01f3eb5140c837d4e

> > +                     pl2303_vendor_write(serial,
> > +                                     HXN_RESET_DOWN_UPSTREAM_REG,
> > +                                     HXN_RESET_DOWN_UPSTREAM_DATA);
> 
> Can you write anything to this register to reset the buffers, or does it
> have to be 0?
> Ans: It have to reset to 0, please refer to PL2303_Linux\PL2303G_ChipReset.jpg

But that jpg shows only bit 0 and 1 being used for data pipe reset. And
shouldn't you be writing 0x02 to reset those?

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
> Ans: Yes, reset independently,
> please refer to PL2303_Linux\PL2303_TYPE_HX_Reset.jpg
> The original code is
>         /* reset upstream data pipes */
>         pl2303_vendor_write(serial, 8, 0);
>         pl2303_vendor_write(serial, 9, 0);
> 
> You previously suggested that I am not using "magical" constants directly,
> Please use defines rather than "magical" Constants.
> What advice do you have for handling here?

Name register and bit-definitions after what they do. We need code to be
clean and mostly self-documenting. In this case, based on the
information provided above, you could use

	#define PL2303_RESET_DOWNSTREAM_PIPE	8
	#define PL2303_RESET_UPSTREAM_PIPE	9

for example.

As the protocol appears to mandate writing 0 to these registers, it
may be ok to keep that as a numerical constant.

Johan
