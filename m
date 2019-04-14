Return-Path: <SRS0=HzBI=SQ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75139C10F13
	for <linux-usb@archiver.kernel.org>; Sun, 14 Apr 2019 21:52:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3CB1420848
	for <linux-usb@archiver.kernel.org>; Sun, 14 Apr 2019 21:52:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eotyTU2w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbfDNVwG (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 14 Apr 2019 17:52:06 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:40308 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbfDNVwF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 14 Apr 2019 17:52:05 -0400
Received: by mail-io1-f48.google.com with SMTP id d201so12993440iof.7
        for <linux-usb@vger.kernel.org>; Sun, 14 Apr 2019 14:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=CW1A+9NsDigDiU4b9VQF1bLweuLfAMX81CzYcgOzo2U=;
        b=eotyTU2w4Y/vxR4aKiJTdy8sZ3UnJwtY85R6Y0dEzbv28mKaHjrXz/FzjsEjSFYAZQ
         nsrxCFSq5tHCwNgNmZz4qbSJxmKvigyHcPMDAP6W8GL2DZyHYuqeo1+6FrzaHD3vVrpf
         THAeAjfeJVLeBSLsGdSQ6tGFagjJg6nJPNer9aEJudUHQ1WD2DKMbZwYLDY18oyl/usx
         ZUAzozap7Rj7tvVYcGEKOAerr/tWbZ37Yln8BkzHiVhzOa1AdiOcmZwWUYjlRDDqgovV
         rVvHeDbBGFVGmipHPYbEx8V8A2PeAcsctblv4TJGan05d0IFQIyN41JzhrAcC22iv3yC
         Y9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=CW1A+9NsDigDiU4b9VQF1bLweuLfAMX81CzYcgOzo2U=;
        b=pK1ocdh+vR80PyxPMcujIeaVvb0IES7YwLhvFHMVHDMZSFtaCAgE0b6fBKTqaAAaB5
         0EArkeswcYmnk9UZ3rYWvpdhmDlUXezZjihr01OgaJvxODywhboJFaIbC7erWw2yEMlG
         t9POlacPjd2jLCkY9TjVtNYupHRLeoxfXD50ay5RxtmVEJiqm8hiO7hToPUSx2hhXfdA
         53K+kGMYqEO7RTIj0DhUPuGB38qyoAJiUMGx+xExEzcKqOAn31lmqaA+LMBDUgsJcXnW
         /BKasTRIWtvxW+6aoeW4Re/OVcKTQqIPaQKAWHGykWtkIxzg47wLDiC5vWMUTUa4gPK9
         VV8g==
X-Gm-Message-State: APjAAAWgX8KGsO6/s7I/DT7z/O8dPHGiTK3DkFUfDXKLB4Q94e9Daxay
        PK12fpPEUDzDP9FY8SxzDck1mPh8Hczhue0RyF8=
X-Google-Smtp-Source: APXvYqweZVDeiKM1USKyhPEXaAljj2nBaHYeDd0D6lG04H2/ldOsozO9uA6SC6pJS5sPNguyp/0hkL4Zot1Zb9OgQ0Y=
X-Received: by 2002:a6b:c84e:: with SMTP id y75mr28086989iof.107.1555278724839;
 Sun, 14 Apr 2019 14:52:04 -0700 (PDT)
MIME-Version: 1.0
From:   Paul Zimmerman <pauldzim@gmail.com>
Date:   Sun, 14 Apr 2019 14:51:39 -0700
Message-ID: <CADBGO7-LHDTT2s2PCTMFmf1dOVyj_aYv5A2O04pbGWp+6K6utw@mail.gmail.com>
Subject: Re: lan78xx: About 8000 usb interrupts per second when idle
To:     Lukas Wunner <lukas@wunner.de>
Cc:     Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Oliver Neukum <oneukum@suse.com>,
        Minas Harutyunyan <minas.harutyunyan@synopsys.com>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Lukas Wunner wrote:
> On Tue, Apr 09, 2019 at 09:28:16AM +0000, Minas Harutyunyan wrote:
>> Am 09.04.19 um 08:54 schrieb Jisheng Zhang:
>>> The second one: 8000 usb interrupts per second when idle.
>>> This is abnormal. any idea? Is it due to the lan78xx?
>>
>> dwc2 in host mode enable SOF interrupts if any periodic EP are in use.
>> So, 8000 interrupts per second is expectant behavior.
>
> The dwc_otg driver patched into the Raspberry Pi Foundation's
> kernel seems to make do with much fewer interrupts and much
> lower CPU load.  How does it do that and how could dwc2 be
> made to do the same?

It connects an interrupt from the USB Phy to the FIQ (fast interrupt
request) pin on the Arm CPU. The dwc2 driver could do the same, except
I don't think the Linux kernel supports FIQ interrupts, so that would
need to be added. It would also be unique to Arm and to the SOC that
is used on the Pi.

> Would it be possible for you to provide
> me with documentation on the chip? The Synopsis website
> requires registration for downloads and registration requires
> a Synopsis customer ID.

It's highly unlikely that Minas can provide you with the databook if
you are not a customer. I used to work for Synopsys and wrote the
original dwc2 driver. The company's policy did not allow non-customers
to be given the databook. But you can find a copy on the web from a
couple of different sites, google for dwc_otg. In any case, it would
not cover the FIQ method that is used in the Pi driver, you would
probably need the Phy databook for that.

> It seems the Foundation's dwc_otg driver was forked from code
> that later begat dwc2.

Yes, I ported dwc2 from the Synopsys dwc_otg driver. But the FIQ
interrupt stuff was not part of the dwc_otg driver, it was added by
the Raspberry Pi foundation guys specifically to work around problems
on the Pi platform.

HTH,
Paul
