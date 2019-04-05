Return-Path: <SRS0=hNA8=SH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66887C4360F
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 01:54:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2BD21206DD
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 01:54:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tnqP4CLt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728934AbfDEByo (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 4 Apr 2019 21:54:44 -0400
Received: from mail-yw1-f43.google.com ([209.85.161.43]:43065 "EHLO
        mail-yw1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727051AbfDEByo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Apr 2019 21:54:44 -0400
Received: by mail-yw1-f43.google.com with SMTP id j66so1748075ywc.10
        for <linux-usb@vger.kernel.org>; Thu, 04 Apr 2019 18:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=mWpV/Idd4+X8SmVwFbDkBds+tt8HMxlzoTfMiabmWGo=;
        b=tnqP4CLtFTf2y7fVRoQOVNrQRqm/UvJSiNBhTqekRgdFRvOwrthNLdosPZZyP/Xtpt
         VyQIqhAyoPdcnc/vUtyORJmfGDYqeFIWbdL6KsWWHSAn6ejDrEItvN93Npe5a9X/aHFr
         ZUsdS+n+KiD+h2aNm2im988UrPPc0mrouzytSmBhj2pan55hkZ8kfedvCXEGHiD61nJl
         RPtC4NgpqVR5qMwkCsyvkhd7/9R5P5bqR+d0ydH8ryOf0v/9hpUgpC4T3tSkzZOQ8CyA
         6B4CmkYjhlBv0MVVwfwQqKcXLnuTvAZwAAduBPVRs7SJoBLEcEmPfU+HZT+OWYtF2UQ2
         1AzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=mWpV/Idd4+X8SmVwFbDkBds+tt8HMxlzoTfMiabmWGo=;
        b=SgTmvd6z2X8PhaTXGENNQdCz0HsMdrN6UyTVIu3uPQmYcDy5xMR7GCE5HNddb043ot
         gRfjiodleBHdHOzlBpposU5jz5lWuMO7tVSn8Tr+rjoud/6o+Qs6bdGrNHpP4GZsyMb2
         9XoxQrQ6u62VDgeybIgvHZ36Z9APn8Y/lWMqu5ADhJpWpeSAFaGJ74pvlQDn0uAroDXR
         VZTgs95e8qsKNAyKvdFGHHoOgz5U8g0YIvO3JaH3MuZ9aqxm+BS+fZMPMRyXsrGaMCdQ
         dp+7HkcCSQgpFCODeflgLae4ZE0A1sdRXfjcq4ukD5InnH2L0RRmB+icIaHAfsXF7s1n
         ckDg==
X-Gm-Message-State: APjAAAVYvF/50KBngiGo3Xym5z0JuEoO8Sfp0PZx+fzFOgkL9wNZ6u33
        gh7z33vLOTMWwA2VqMMyENJTYYYDCcGbY438g+IbGROD
X-Google-Smtp-Source: APXvYqx57aI15GS4+FjbJYE2q/SzFQr67mqI4WWEfRthrd1USe6bDvMVUzKoCu8SNy+Qt3gWf0MK/fPwpD2ifylUuUs=
X-Received: by 2002:a81:1d49:: with SMTP id d70mr8312454ywd.84.1554429283500;
 Thu, 04 Apr 2019 18:54:43 -0700 (PDT)
MIME-Version: 1.0
From:   Jonathan Newman <jonathannewman314@gmail.com>
Date:   Fri, 5 Apr 2019 02:54:33 +0100
Message-ID: <CAN=E4MtGx=cKsbK8BowMrdHCTF6mn8X4gR3sWxbdHudt6Yejkw@mail.gmail.com>
Subject: Re: UAC2 gadget not recognized on Windows 10
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

With apologies for the fake "Re:"- I can't easily reply to the
original thread, since I wasn't subscribed at the time. I'm referring
to Robert Bielik's thread from February 2018.

I'm trying to develop an audio device using the USB Gadget system.
f_uac1 works with stereo, but breaks when I try to use 8 channels- the
captured stream is corrupt in a variety of interesting ways. f_uac2
works perfectly on a macOS host, and I would prefer to use the newer
standard in any case. Unfortunately, it doesn't work with Windows 10
at the moment, as detailed in the aforementioned thread.

It looks like a potential solution was found (add a feedback
endpoint), but a serious performance concern was noted. I was
wondering whether anyone is interested in revisiting this. There's a
fairly considerable DIY audio community, and I think the potential of
USB Gadget based audio devices is underappreciated- but native Windows
10 support would be necessary for any serious project.

Many thanks to anyone who can investigate
