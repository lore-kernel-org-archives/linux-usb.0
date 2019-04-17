Return-Path: <SRS0=xlna=ST=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,T_DKIMWL_WL_MED,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D50C282DA
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 16:33:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A854A20663
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 16:33:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v9jBes/e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730481AbfDQQdx (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Apr 2019 12:33:53 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38595 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729395AbfDQQdw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Apr 2019 12:33:52 -0400
Received: by mail-pl1-f193.google.com with SMTP id f36so12290435plb.5
        for <linux-usb@vger.kernel.org>; Wed, 17 Apr 2019 09:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=qI3yNdUxlcVcY29bd+nWAN51bvEFiq037cVsGgmQOa4=;
        b=v9jBes/euZKN5FCazMa3BkKP+wENSlLSPGmRBqhn8GS71LdEolhavRJWsOdVMAKpRZ
         YITt0ByNGE4IY0vPkbc3ThScAYhx+Rtzqn+QnzPP0D10Esz+kJBFOvZXvmrvAMzBJ4YS
         j1iShihHF3+y+20TaxuNOxn+9iBn76OW3+ELepYbyQsEgxcaJf2FmLUTwXvYv8rQl0e/
         7bJljgF/ChzPC/GNKQ3uHapZzKbkJpRaoxxJ1pKdQBzjU79eVVH6eUMeVXM9CSpISYl1
         VPyH89V7My4SY/DotE/4lsbJiyXmR+ZUnPBfLkha6a0DqADOoxmNdGn1XxCR0Ul5MPFz
         hhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=qI3yNdUxlcVcY29bd+nWAN51bvEFiq037cVsGgmQOa4=;
        b=CUjOjuo5Eu/cSm8DvAAU1tJiPF6W2y69bZpmkfZYJwJFQWGpkycsAun+cInmLfVOxl
         N4ojTfi3OyO9WnJfN96/kD7WU4w/q+G9OTAz0Yqk0rrfvYIQhlnA+CCMZcVg6qiYDfCM
         TRPgGeSqfDU6kawqAv0RD5vfv+Goq39fAtjbCvhRyATwMFv0IFBBdDK5AaFMnFn67Y10
         aHWCi9WKcJ3ZoA4pd8CEIp+Uqd9hQa+s06byklTapKteVzGleUeiWIQwGureA2/oyugq
         624TURjysMZ3fTn5g94kZwtqLtjzMNftSOtCMytu69d0s7Ndph2UMbmtlUmFuq99zuR0
         N9iQ==
X-Gm-Message-State: APjAAAXcWLEcwEyIILsx6uFRGVLsIHEfODuEUkOpg3YItGG9Yaopboif
        HkjTlKfZgOZmCRfqOtxuSCbsQ8w5ZzSY8IDxFaxxfw==
X-Google-Smtp-Source: APXvYqx7DkLaKPY/QnpeUMKHxr16RVXsJORzBPuv+eznI9XhgBBZiu9Qngbzbtb7E6/ZIHqFEHOkfrxKN3EvCQ3bJzo=
X-Received: by 2002:a17:902:2b89:: with SMTP id l9mr684108plb.329.1555518831077;
 Wed, 17 Apr 2019 09:33:51 -0700 (PDT)
MIME-Version: 1.0
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 17 Apr 2019 18:33:39 +0200
Message-ID: <CAAeHK+z+d=Gh4j1VSsEtLuYUpd7-T3Cu1ww0-5otSE5kDTgMGA@mail.gmail.com>
Subject: USB fuzzing with syzbot
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

As you might have noticed, syzbot has started reporting bugs in the
USB subsystem that can be triggered externally by a malicious USB
device. Right now the fuzzing is done via a GadgetFS-like interface to
emulate USB devices through the USB Gadget subsystem and the Dummy
HCD/UDC module to "loopback" connect those devices to the running
kernel. There are more details in my OffensiveCon talk [1], [2].

A few questions/comments:

1. Which tree should we use for testing?

Right now we're targeting the upstream tree, but we can switch to some
USB development tree, where the fixes are likely to end up earlier.

2. Is there an easy way to figure out which config options enable
drivers reachable over USB?

Right now our kernel config is based on one of the Debian kernel
configs, that supposedly enables enough relevant USB drivers. At the
same time it enables a lot of other unnecessary stuff, which makes the
kernel big and long to compile. Ideally, we would to have a way to
auto-generate a kernel config that enables all the relevant (enabled
by at least one of the distros) USB drivers. I've looked at whether
it's possible to figure out which particular options in some kernel
config are related to USB, but it seems that neither the option names,
nor the way they are grouped in the config file, are representative
enough.

3. Regarding that GadgetFS-like interface.

Initially I was using GadgetFS (together with the Dummy HCD/UDC
module) to perform emulation of USB devices for fuzzing, but later
switched to a custom written interface. This interface is essentially
implemented in the following patch [3]. An example that emulates a USB
keyboard through this interface can be found here [4]. And the
syzkaller parts responsible for USB fuzzing are here [5], [6]. The
incentive to implement a different interface was to provide a somewhat
raw and direct access to the USB Gadget layer for the userspace, where
every USB request is passed to the userspace to get a response.

The main differences between this interface (referred to as usb-fuzzer
for now) and GadgetFS are:

1) GadgetFS does some sanity checks on the provided USB descriptors,
which is something we don't want for fuzzing. We want the descriptors
to be as corrupted as they can.

2) GadgetFS handles some of the USB requests internally based on the
provided device descriptor, which is also something we don't want. For
example we may want to be able to provide differently corrupted
responses to the same request.

3) usb-fuzzer has ioctl-based interface instead of a filesystem-based
one. I wouldn't say it's that big of a deal, but it makes it somewhat
easier to incorporate into a fuzzer.

4) Somewhat related to the previous point: usb-fuzzer uses predictable
endpoint names across different UDCs.

Right now each UDC driver defines endpoint names via EP_INFO() as it
pleases. And GadgetFS uses those names to create file entries for each
of the endpoints. As a result, endpoint names for different UDCs will
be different and it requires more work to write a portable userspace
gadget. The usb-fuzzer interface auto selects and assigns an endpoint
based on the required features like the transfer type.

5) GadgetFS binds to the first available UDC, usb-fuzzer provides a
way to select a UDC to bind to.

Since the fuzzing happens in multiple processes each of which has its
own Dummy UDC assigned, we want to have control over which UDC we bind
to. This part is a bit confusing, but what I found out is that a UDC
is selected based on two different identifying names. I call the first
one "udc_device_name" and the second one "udc_driver_name".
"udc_device_name" has to be assigned to usb_gadget_driver->udc_name
when usb_gadget_probe_driver() is called, and "udc_driver_name" is
what we have to compare usb_gadget->name with inside of the
usb_gadget_driver->bind() callback. For example, Dummy UDC has
"dummy_udc" as its "udc_driver_name" and "dummy_udc.N" as its
"udc_device_name". At the same time the dwc2 driver that is used on
Raspberry Pi Zero, has "20980000.usb" as both "udc_driver_name" and
"udc_device_name".

Overall, the usb-fuzzer interface implementation has a similar
structure to that of GadgetFS, but looks way simpler (although that
might be because I've missed to implement some functionality :).

We'd like to get this upstreamed, but I'm not sure whether this should
be a separate interface (which we can rebrand as a raw usb gadget
interface or something like that) or we should try to make it a
special mode of GadgetFS. I like the former approach more, as GadgetFS
looks quite complicated from my point of view and making fundamental
changes to it doesn't seem like an easy task. This is where we'd like
to get your input.

If you have any other questions or comments, please let us know.

Alan, thanks a lot for answering to lots of my USB related questions
while I was working on this, that helped tremendously!

Thanks!

[1] https://docs.google.com/presentation/d/1z-giB9kom17Lk21YEjmceiNUVYeI6yIaG5_gZ3vKC-M/edit#slide=id.g1925acbbf3_0_0

[2] https://www.youtube.com/watch?v=1MD5JV6LfxA

[3] https://github.com/google/kasan/commit/9a33b36996cb6138a806eab931ba43c63a836708

[4] https://github.com/google/syzkaller/blob/usb-fuzzer/tools/usb/keyboard.c

[5] https://github.com/google/syzkaller/blob/master/sys/linux/vusb.txt

[6] https://github.com/google/syzkaller/blob/master/executor/common_usb.h
