Return-Path: <SRS0=X9rV=SM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D98C10F0E
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 01:48:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 43AAA2084F
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 01:48:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gnarbox-com.20150623.gappssmtp.com header.i=@gnarbox-com.20150623.gappssmtp.com header.b="NCHCQHbg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbfDJBst (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 9 Apr 2019 21:48:49 -0400
Received: from mail-pf1-f173.google.com ([209.85.210.173]:40843 "EHLO
        mail-pf1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbfDJBst (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Apr 2019 21:48:49 -0400
Received: by mail-pf1-f173.google.com with SMTP id c207so388539pfc.7
        for <linux-usb@vger.kernel.org>; Tue, 09 Apr 2019 18:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gnarbox-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OqZEhbr8YCFrak3zT8AWGBYwbTsrVZo9kdXogo1dCTE=;
        b=NCHCQHbgGE+dyIGmVaW39MLESubb4dYoofu7EjVLrZOJn6FGWusYTmFHCKQTzrMehz
         QmOhX/3W3sf2JGjRlfukWBghfIL59gzA6iWX9rfm78vKxPE4tnTJX4DfIhfWGvn+h829
         vt8XF9PrCFkOlnNARtye9k5qL1KuLlY2Q1MnaOH81vgXIUMKq/Dh7ki5417+Xm7Wz6dG
         XDCKJ+fEMNjDzJFnEyybcIwFIY/uDaIRSJxQpuB5y7244Wx3MT4XsvttLMf6/jKeE21a
         oIA2veIkRwp46vhkSmdmUhzv/tg8wx6pT2oYARKiws+CdQMgT5qCNdQKp/YQ+NZqJ4Jv
         A8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OqZEhbr8YCFrak3zT8AWGBYwbTsrVZo9kdXogo1dCTE=;
        b=nkhO59RW6BhzoIv9dFlEaUUk2g4L8OVaiuV4PTVGO2i9j7HQPrzcchjrVeeTOYxLFw
         o2hSC4bzMuXyCZDeR3IbezdeSwjJlMrQJqOmjc1DvsJ7qiYs/BgkptP6ayUhswOTZ7gW
         LmDo2AQItqRu2FuZ4vDiL7Ffyk75e5bLaPsNbs7eOFQgwBF4jpZsH5zgor68zAg102TZ
         pbgEIpovPxVC7xnKBhNiBVoc46zPiE78PybQXRtKuhS+5b++FXDmZm1xodUx8mRwJIa6
         5/N+3rhuG1Eya9Z5JaPOl82ZyV7KHQ/XAFynV5XG/caAsfsVy3m/VpwaYoSBNYLi52b4
         jmAg==
X-Gm-Message-State: APjAAAWJsSyrSBZU7OmaCHqoNpN02rBINs2OSR6x/NyIQcR+RSCwXpwi
        4pF6+0CksdL3NR9b3OKBvPvvGai8OiDZIw==
X-Google-Smtp-Source: APXvYqy2mkZii/lIcX3ZaK7OclvGFVgJoJPK6OSEunqLGCdgdHLcth5m7ixu3TfcirxbYql89bMwJQ==
X-Received: by 2002:aa7:8e04:: with SMTP id c4mr4775559pfr.48.1554860928086;
        Tue, 09 Apr 2019 18:48:48 -0700 (PDT)
Received: from coops ([47.180.176.91])
        by smtp.gmail.com with ESMTPSA id a9sm47459907pfo.17.2019.04.09.18.48.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Apr 2019 18:48:47 -0700 (PDT)
Date:   Tue, 9 Apr 2019 18:48:44 -0700
From:   Rob Weber <rob@gnarbox.com>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: Mass Storage Gadget Device Falls from SuperSpeed to High Speed
Message-ID: <20190410014844.GA19912@coops>
References: <87h8bnh5er.fsf@linux.intel.com>
 <20190328085343.GA12754@coops>
 <87bm1vgyby.fsf@linux.intel.com>
 <87h8bhez87.fsf@linux.intel.com>
 <20190402074855.GA16196@coops>
 <87a7h8g6yj.fsf@linux.intel.com>
 <20190403070228.GA27956@coops>
 <878swrh6ln.fsf@linux.intel.com>
 <20190404075624.GB15850@coops>
 <87v9zuf6my.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <87v9zuf6my.fsf@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190410014844.qDv44Z0m0epoiMW9I1bRWv98oTj9Hzrp5HdaU3tF8qw@z>

Hi Felipe,

On Thu, Apr 04, 2019 at 12:43:01PM +0300, Felipe Balbi wrote:
> > We've identified a couple of auxiliary issues that seem to be unrelated,
> > but we are trying to gather more data to be sure. One issue we are
> > experiencing is particularly clear: We seem to have a race condition
> > between the switching of channels on the SS mux on our platform and the
> > enumeration of our device. We believe our device gets enumerated in high
> > speed before we switch the channel of the SS mux. This can be clearly
> > observed while watching the logs of the MCU on our platform while
> > simultaneously watching dmesg. Below is an example of this test setup.
> > Please note the MCU logs begin with [general][DBG]:
> >
> > root@gnarbox-2:~# echo device > /sys/class/usb_role/intel_xhci_usb_sw-role-switch/role
> > root@gnarbox-2:~# ./bin/usb-trace 1
> > echo 1 > /t/events/dwc3/enable
> > echo 1 > /t/events/xhci-hcd/enable
> > echo 1 > /t/events/gadget/enable
> > root@gnarbox-2:~# modprobe g_mass_storage file=/dev/nvme0n1p7 iSerialNumber=90405
> > root@gnarbox-2:~# stty -F /dev/ttyS2 115200 cs8 cstopb -parenb -icrnl
> > root@gnarbox-2:~# cat /dev/ttyS2 &
> > [1] 1733
> > root@gnarbox-2:~# dmesg -w
> >
> > Okay, setup complete, aaand we're rolling...
> >
> > [general] [DBG] handle_intr: (otg) event: Rp Change Detected()
> > [general] [DBG] apply_pdo: setting limit based on Rp val 0
> > [general] [DBG] set_current_limit: IIN_HOST: 100 0x0100
> > [general] [DBG] set_current_limit: success (tried 1 times)
> > [general] [DBG] handle_intr: (otg) event: Type-C Port Connect Detected()
> > [general] [DBG] usb_mux_sel: (otg) polarity: 2
> >
> > Here's where the PD controller detects the connection. Note the polarity
> > of the cable that we detect.
> >
> > [general] [DBG] handle_intr: (otg) Nothing to do.
> > [general] [DBG] handle_intr: (otg) event: Hard Reset Sent to Port Partner
> > [  179.905835] g_mass_storage gadget: super-speed config #1: Linux File-Backed Storage
> >
> > shortly after, the device is enumerated and the link speed is set to 5Gbps
> >
> > [general] [DBG] handle_intr: (otg) event: Hard Reset Sent to Port Partner
> > [general] [DBG] handle_intr: (otg) event: Hard Reset Sent to Port Partner
> > [general] [DBG] handle_intr: (otg) event: Source Disabled State Entered
> > [general] [DBG] enable_charging: incorrect current limit(3300), setting(100)
> > [general] [DBG] set_current_limit: IIN_HOST: 100 0x0100
> > [general] [DBG] set_current_limit: success (tried 1 times)
> > ...
> > ...
> > [general] [DBG] handle_intr: (otg) event: Type-C Port Disconnect Detected()
> > [general] [DBG] apply_pdo: setting limit based on Rp val 0
> > [general] [DBG] set_current_limit: IIN_HOST: 100 0x0100
> > [general] [DBG] set_current_limit: success (tried 1 times)
> > [general] [DBG] disable_charging:
> >
> > Here we disconnect the cable from our device.
> >
> > [  226.759843] g_mass_storage gadget: high-speed config #1: Linux File-Backed Storage
> > [general] [DBG] handle_intr: (otg) event: Type-C Port Connect Detected()
> > [general] [DBG] usb_mux_sel: (otg) polarity: 0
> >
> > Here we reconnected our device to the host but with the cable in a
> > different polarity than before. This means the SS mux is not properly
> > configured for the current cable orientation and must be switched. Also
> > note here that linux seems to report the enumeration in high speed
> > before our MCU had a chance to react to the new connection.
> >
> > [general] [DBG] handle_intr: (otg) event: Hard Reset Sent to Port Partner
> > [general] [DBG] handle_intr: (otg) event: Hard Reset Sent to Port Partner
> > [general] [DBG] handle_intr: (otg) event: Hard Reset Sent to Port Partner
> > [general] [DBG] handle_intr: (otg) event: Source Disabled State Entered
> > [general] [DBG] enable_charging: incorrect current limit(3300), setting(100)
> > [general] [DBG] set_current_limit: IIN_HOST: 100 0x0100
> > [general] [DBG] set_current_limit: success (tried 1 times)
> > ...
> > ...
> > [general] [DBG] handle_intr: (otg) event: Type-C Port Disconnect Detected()
> > [general] [DBG] apply_pdo: setting limit based on Rp val 0
> > [general] [DBG] set_current_limit: IIN_HOST: 100 0x0100
> > [general] [DBG] set_current_limit: success (tried 1 times)
> > [general] [DBG] disable_charging:
> >
> > Here we disconnect our device from the host by removing the cable from
> > our device's type-c connector.
> >
> > [  262.783318] dwc3 dwc3.1.auto: request ffff880168ae3240 was not queued to ep1out
> > [  262.920461] g_mass_storage gadget: super-speed config #1: Linux File-Backed Storage
> > [general] [DBG] handle_intr: (otg) event: Type-C Port Connect Detected()
> > [general] [DBG] usb_mux_sel: (otg) polarity: 0
> >
> > Here we re-connect our device to the host, but we made sure to leave the
> > cable in the same orientation as before. That way the SS mux is already
> > configured for the current cable orientation. We still see the USB
> > device enumeration occur before the MCU has a chance to respond, but it
> > gets enumerated in SuperSpeed because the SS mux was already configured
> > for this cable orientation.
> 
> This looks like an old bug on xhci which was fixed long ago. Mathias, do
> you remember that bug? Which kernel fixed that issue?
> 
> > We've come up with a few solutions that are specific to our platform
> > in order to reduce the chances of this race condition occuring, but I
> > wanted to ask you for your thoughts about how we might be able to work
> > around this from Linux. In the event that we cannot completely eliminate
> > this race condition, we would like to find some way to "upgrade" the
> > connection from high speed to SuperSpeed. Is something like this
> > possible?
> 
> Unfortunately not. Does this continue to happen if you change the host
> machine to e.g. Windows or a more recent linux kernel?

Yes, this happens on all hosts (Windows, OSX, Linux on a range of
kernels), which leads me to believe it might be unrelated to the xhci
bug you recalled earlier.

> > My naiive understanding wsas that the host would continuously
> > poll the SS lines for a valid connection, but I believe I am mistaken
> > here. I noticed in the USB protocol traces that there are a couple of
> > Link Management Packets (LPMs) that the host sends. One of them seems to
> > request the configuration descriptor, and another seems to request the
> > link speed be set to 5 Gbps, to which the device acknowledges and
> > complies. Is it possible to force this sort of exchange to happen again? 
> 
> AFAICT, that's handled entirely at the HW level without SW intervention.

Hmm, okay. Might it be possible to perform some sort of soft reset of
the dwc3, or possibly ask the host to reset the device?

We're looking for any way to possibly reset the connection from HS to SS
when we hit this race condition. We are also currently exploring ways of
switching the orientation of the SS mux more efficiently.

> > I've attached yet another tarball containing the dwc3 traces, USB
> > protocol data (from a Teledyne LeCroy analyzer, compatible with the "USB
> > Protocol Suite" application), and a raw copy of the logs I annotated
> > above. The timestamps in the dwc3 traces should line up with the
> > timestamps of the dmesg output in the annotated logs. The USB protocol
> > data is from a different session, but still contains an example of the
> > first enumeration in high speed, and the second in SS, all in one
> > sample. The SS enumeration happens at around 8 seconds into the
> > 12-second capture.
> >
> > Thanks in advance for your input here!
> 
> I'll have to spend some more time with the logs, but at least from
> traces, I couldn't see anything that would give a hint. I'll try looking
> at CATC traces later today tomorrow.
> 
> >> > I've attached a tarball containing the dmesg output, regdump, and
> >> > tracepoints of a succesful session with the patch applied. I've included
> >> > the patch in the tarball if you would like to see how I ported it.
> >> > Could you please double-check the traces to make sure they meet your
> >> > expectations for disabling the U1/U2_ENABLE features? I looked through
> >> > the traces and could not find any link state changes to U1 or U2, so it
> >> > seems like it's working.
> >> 
> >> The host, from that run, didn't enable device-initiated U1/U2 entry. So
> >> only host-initiated entry is avaiable. Since we have removed
> >> ACCEPTU1/ACCEPTU2 bits from DCTL, dwc3 is denying LGO_U1 and LGO_U2. You
> >> can confirm that only with a sniffer.
> >> 
> >> > I have a couple of follow-up questions about this patch:
> >> >
> >> > * I added some tracepoints in the patch I'm applying but they don't seem
> >> >   to be included in the trace output. This patch applies cleanly and I
> >> >   haven't seen any compiler warnings about it. Is the
> >> >   dwc3_ep0_handle_feature function not called during
> >> 
> >> it's called from SetFeature() command. If SetFeature() is not sent by
> >> the host, then you won't see your tracepoints. FYI, SetFeature would
> >> have a bRequest of 3. Here we can all ctrl requests:
> >> 
> >>  192:     irq/23-dwc3-1765  [000] d..1   213.007591: dwc3_ctrl_req: bRequestType 00 bRequest 05 wValue 0005 wIndex 0000 wLength 0
> >>  208:     irq/23-dwc3-1765  [000] d..1   213.010457: dwc3_ctrl_req: bRequestType 80 bRequest 06 wValue 0100 wIndex 0000 wLength 18
> >>  237:     irq/23-dwc3-1765  [000] d..1   213.010871: dwc3_ctrl_req: bRequestType 80 bRequest 06 wValue 0304 wIndex 0409 wLength 2
> >>  266:     irq/23-dwc3-1765  [000] d..1   213.011330: dwc3_ctrl_req: bRequestType 80 bRequest 06 wValue 0304 wIndex 0409 wLength 40
> >>  295:     irq/23-dwc3-1765  [000] d..1   213.011707: dwc3_ctrl_req: bRequestType 80 bRequest 06 wValue 0303 wIndex 0409 wLength 2
> >>  324:     irq/23-dwc3-1765  [000] d..1   213.012137: dwc3_ctrl_req: bRequestType 80 bRequest 06 wValue 0303 wIndex 0409 wLength 92
> >>  353:     irq/23-dwc3-1765  [000] d..1   213.012548: dwc3_ctrl_req: bRequestType 80 bRequest 06 wValue 0305 wIndex 0409 wLength 2
> >>  382:     irq/23-dwc3-1765  [000] d..1   213.012934: dwc3_ctrl_req: bRequestType 80 bRequest 06 wValue 0305 wIndex 0409 wLength 12
> >>  411:     irq/23-dwc3-1765  [000] d..1   213.013331: dwc3_ctrl_req: bRequestType 80 bRequest 06 wValue 0f00 wIndex 0000 wLength 5
> >>  440:     irq/23-dwc3-1765  [000] d..1   213.013748: dwc3_ctrl_req: bRequestType 80 bRequest 06 wValue 0f00 wIndex 0000 wLength 22
> >>  469:     irq/23-dwc3-1765  [000] d..1   213.016006: dwc3_ctrl_req: bRequestType 80 bRequest 06 wValue 0200 wIndex 0000 wLength 9
> >>  498:     irq/23-dwc3-1765  [000] d..1   213.016543: dwc3_ctrl_req: bRequestType 80 bRequest 06 wValue 0200 wIndex 0000 wLength 44
> >>  527:     irq/23-dwc3-1765  [000] d..1   213.016951: dwc3_ctrl_req: bRequestType 00 bRequest 09 wValue 0001 wIndex 0000 wLength 0
> >>  568:     irq/23-dwc3-1765  [000] d..1   213.017569: dwc3_ctrl_req: bRequestType 80 bRequest 06 wValue 0301 wIndex 0409 wLength 2
> >>  597:     irq/23-dwc3-1765  [000] d..1   213.017926: dwc3_ctrl_req: bRequestType 80 bRequest 06 wValue 0301 wIndex 0409 wLength 26
> >>  626:     irq/23-dwc3-1765  [000] d..1   213.018367: dwc3_ctrl_req: bRequestType 81 bRequest 00 wValue 0000 wIndex 0000 wLength 2
> >>  653:     irq/23-dwc3-1765  [000] d..1   213.026404: dwc3_ctrl_req: bRequestType a1 bRequest fe wValue 0000 wIndex 0000 wLength 1
> >>  929:     irq/23-dwc3-1765  [000] d..1   214.138385: dwc3_ctrl_req: bRequestType 82 bRequest 00 wValue 0000 wIndex 0081 wLength 2
> >>  956:     irq/23-dwc3-1765  [000] d..1   214.138791: dwc3_ctrl_req: bRequestType 02 bRequest 01 wValue 0000 wIndex 0081 wLength 0
> >> 1031:     irq/23-dwc3-1765  [000] d..1   214.140214: dwc3_ctrl_req: bRequestType 82 bRequest 00 wValue 0000 wIndex 0081 wLength 2
> >> 1058:     irq/23-dwc3-1765  [000] d..1   214.140618: dwc3_ctrl_req: bRequestType 02 bRequest 01 wValue 0000 wIndex 0081 wLength 0
> >> 1133:     irq/23-dwc3-1765  [000] d..1   214.142208: dwc3_ctrl_req: bRequestType 82 bRequest 00 wValue 0000 wIndex 0081 wLength 2
> >> 1160:     irq/23-dwc3-1765  [000] d..1   214.142587: dwc3_ctrl_req: bRequestType 02 bRequest 01 wValue 0000 wIndex 0081 wLength 0
> >> 
> >> Note that we don't have any "bRequest 03" substring.
> >
> > Is it normal to not see any SetFeature commands? I think I was expecting
> > to see them pretty frequently.
> 
> Totally normal :-) A host is not required to allow for device-initiated
> U1/U2 entry. Nor is it required to halt and endpoint, for example.
> 
> >> >> > I've attached the traces and dmesg output in an archive titled
> >> >> > "gnarbox-ep0out-failure.tar.xz". Please let me know if you need more
> >> >> > information about this particular issue.
> >> >> 
> >> >> I'll go over the traces, this could be something that has been fixed in
> >> >> the past.
> >> >
> >> > Did you get a chance to take a look at the tracepoints for this error?
> >> > No worries if you haven't gotten a chance yet.
> >> 
> >> I did, nothing screaming wrong with them. That "can't enable ep0out"
> >> still puzzles me a bit. What we see on tracepoints is a time out:
> >> 
> >> 	modprobe-1281  [002] d..1   246.504043: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Transfer Resource' [2] params 00000001 00000000 00000000 --> status: Timed Out
> >> 
> >> But I have no idea why that happens. It could be that this was fixed
> >> long ago, but we won't know unless we run a recent kernel on your
> >> setup. I, certainly, haven't seen that :-)
> >
> > One of my colleagues is currently testing kernel 5.0.5 without the patch
> > you suggested and it looks pretty good so far! We'll keep you updated if
> > this changes. With this issue in particular, it is still unclear how to
> > get our device into this state. We'll definitely keep an eye out for it
> > on 5.0.5.
> 
> If 5.0.5 is working, then you could run a git bisect and find the commit
> that fixed it. If we have a failing commit and a working commit, git
> bisect will help finding the fix, then you could simply cherry-pick it.

I spoke too soon. 5.0.5 (unpatched) shows significant improvement than 4.9.115 as it
takes about 15 minutes of data transfer before the link drops from SS to
HS. We will be sticking with the patch that you provided us earlier.
It's been working very well for us on 4.9.115. 

Cheers,
Rob Weber
