Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EC0C433EF
	for <linux-usb@archiver.kernel.org>; Sun,  6 Feb 2022 16:58:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245655AbiBFQ6J (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 6 Feb 2022 11:58:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236977AbiBFQ6J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Feb 2022 11:58:09 -0500
Received: from mail.mathconsult.ch (gate.mathconsult.ch [185.41.77.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EDD1C06173B
        for <linux-usb@vger.kernel.org>; Sun,  6 Feb 2022 08:58:07 -0800 (PST)
Received: from arcturus.mathconsult.ch (arcturus.mathconsult.ch [192.168.100.12])
        (authenticated bits=0)
        by mail.mathconsult.ch (8.14.7/8.14.7) with ESMTP id 216Gw6ID024933
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
        for <linux-usb@vger.kernel.org>; Sun, 6 Feb 2022 17:58:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mathconsult.ch;
        s=mcag201304m; t=1644166686;
        bh=iu6dt8mXZuiWkmYluaCi9sneYRQy0+y74mpaJ75cdqI=;
        h=From:To:Subject:Date;
        b=b36S/t1p8ShlSfYf78VGEMIgthGhPkdVhTkgz7OTfNW7MDf7O74RIe06lguEBAVlb
         TTpMPWMuZpcuxZgWSMGaVBGzT8Aec14oKGRfvfOBMZk4Pj50eQbxYhpo6656T4Wbr8
         1kYhvbdCedRWVh3zRQIDJlsKwf0W1oY29RjKkqjM=
From:   Roman =?ISO-8859-1?Q?M=E4der?= <maeder@mathconsult.ch>
To:     linux-usb@vger.kernel.org
Subject: Re: USB xhci crash under load on 5.14-rc3
Date:   Sun, 06 Feb 2022 17:58:06 +0100
Message-ID: <2539255.4GrNK473di@arcturus.mathconsult.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

this is a reply to a post on linux-usb of Wed, 4 Aug 2021
(https://www.spinics.net/lists/linux-usb/msg215253.html)

In case this problem is still relevant:

I ran into a similar issue with kernel 5.10.0 (Debian Bullseye) and a Fantec
external HDD enclosure connected via USB3.1.
I set up a raidz2 with 7 disks, and after a few minutes of heavy use always got:

Feb  6 12:37:29 andromeda kernel: [932663.635942] xhci_hcd 0000:45:00.1: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x002e address=0xffffffe00000 flags=0x0000]

and all connected devices would go away, leaving zfs rather puzzled.

This link, https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1844858
suggested a conflict with the IOMMU.
The controller is
Advanced Micro Devices, Inc. [AMD] Matisse USB 3.0 Host Controller (prog-if 30 [XHCI]) on an ASRock TRX40 Creator

After disabling the IOMMU in the BIOS, the problem went away so far.

Roman



