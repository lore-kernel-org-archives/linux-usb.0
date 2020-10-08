Return-Path: <SRS0=gWik=DP=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97BA2C04EBE
	for <linux-usb@archiver.kernel.org>; Thu,  8 Oct 2020 14:39:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5044A21789
	for <linux-usb@archiver.kernel.org>; Thu,  8 Oct 2020 14:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602167973;
	bh=s7C2s4YxuJyLo2O05DskjDQRNW/tLAKVYVb/8mz2yuU=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=uHdCh8G4IqipwwSl+N/bpkkR06zyW+HDqGHP1/Cw0+MOAeSrUY4hOndZPrKeXiVQ0
	 45g6Pvt+4VPzwbtMHmTt+ONCbC57qtFvIC7erhHsnILr0CLrUb8etKdBDgVLNO5CQs
	 2eVS4+twtmlAbu1qRv8uPhJiyh8Sid2pesigk/lk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730668AbgJHOjc (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 8 Oct 2020 10:39:32 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46274 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729770AbgJHOjc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Oct 2020 10:39:32 -0400
Received: by mail-lj1-f195.google.com with SMTP id c21so5994465ljn.13
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2020 07:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=hMgIVcp4/vtRJVTD+khHQswmn+Tgqr3vzGDp8l0UoeY=;
        b=hZ3GUeuXgGU3IQApnhdBoLTE9U1CmAmuuHnNFUFVCPoO4tV/kvfNW2DgORNYQVi3/S
         ynPOgG08GI7wXBdam1bfaVdv5UNlSR/0T6cuuKTpUfgZTsBhBWtN+fcisCVeUnRpTlRb
         V4orPkqqQbLWxFnk50MD+c4EjD2MdxI9NetbSXilXbnt/ejkYhRob/FgejaeMY7IwJ/i
         vVjQBzheTF8UYQxHuFcmukiR+w5+/3TD6sUiRPZSQp/MCAd2LIRRLOR29BVs0KakInij
         AysXlraON9+QJZpVK1Sf76vy9D8KhIk2sXuoUHHqdpPxSGifCfRmA2jgbvu9POR8x7J3
         4yOw==
X-Gm-Message-State: AOAM533q79tqphT5G01LA0Q6+YDlkRZenmZZt6xxytqRnu8RpZwHc8NT
        JeWTaTIwCjsY6HELVy+tvI2Ur/kRUSk=
X-Google-Smtp-Source: ABdhPJw0wxVzbew7Brd2TmMn2DXaCGlrEAcchc12VskJeuOlILUUoTNEqowv5P9Iw0Y6pDyMqFhoTw==
X-Received: by 2002:a2e:9f4d:: with SMTP id v13mr140203ljk.379.1602167969810;
        Thu, 08 Oct 2020 07:39:29 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id o6sm974658ljc.33.2020.10.08.07.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 07:39:29 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kQX4m-0006zo-PF; Thu, 08 Oct 2020 16:39:24 +0200
Date:   Thu, 8 Oct 2020 16:39:24 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial updates for 5.10-rc1
Message-ID: <20201008143924.GA26847@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Here are the USB serial updates for 5.10.

Note that I fixed up a Link tag in the last commit while preparing the series,
hence the late commit timestamp.

Johan


The following changes since commit ba4f184e126b751d1bffad5897f263108befc780:

  Linux 5.9-rc6 (2020-09-20 16:33:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.10-rc1

for you to fetch changes up to 3e765cab8abe7f84cb80d4a7a973fc97d5742647:

  USB: serial: option: add Cellient MPL200 card (2020-10-08 16:30:29 +0200)

----------------------------------------------------------------
USB-serial updates for 5.10-rc1

Here are the USB-serial updates for 5.10-rc1, including:

 - new device ids
 - various clean ups

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Johan Hovold (2):
      USB: serial: ftdi_sio: clean up jtag quirks
      USB: serial: qcserial: fix altsetting probing

Leonid Bloch (1):
      USB: serial: option: Add Telit FT980-KS composition

Mychaela N. Falconia (2):
      USB: serial: ftdi_sio: add support for FreeCalypso JTAG+UART adapters
      USB: serial: ftdi_sio: use cur_altsetting for consistency

Scott Chen (1):
      USB: serial: pl2303: add device-id for HP GC device

Wilken Gottwalt (1):
      USB: serial: option: add Cellient MPL200 card

 drivers/usb/serial/ftdi_sio.c     | 37 ++++++++++++++++++++-----------------
 drivers/usb/serial/ftdi_sio_ids.h |  7 +++++++
 drivers/usb/serial/option.c       |  5 +++++
 drivers/usb/serial/pl2303.c       |  1 +
 drivers/usb/serial/pl2303.h       |  1 +
 drivers/usb/serial/qcserial.c     |  4 ++--
 6 files changed, 36 insertions(+), 19 deletions(-)
