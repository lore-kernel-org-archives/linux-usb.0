Return-Path: <SRS0=BMk0=2A=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEFDC43603
	for <linux-usb@archiver.kernel.org>; Tue, 10 Dec 2019 11:26:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3BD720663
	for <linux-usb@archiver.kernel.org>; Tue, 10 Dec 2019 11:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575977182;
	bh=lGw9WnBPjFURXwR8uYEocVdtFyAw1dLXhpEHdnC1h0o=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=tY1QfsKQ5wvp5F3+VigTpG44sloUEniwt91I1ha2wBlMe1TAcRABYNcDdUyhuANcV
	 rEGKTPQ1z+66m4ROngr1irXepaDKQmOKBs35TMuUoLoRPQHP4Y0aT2ExsKgi0wSNSd
	 8PLomD1Tktj/okuJR/hFTPkWf3lNAhdifcRkfwWY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727224AbfLJL0V (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 10 Dec 2019 06:26:21 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39134 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726915AbfLJL0V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 06:26:21 -0500
Received: by mail-lj1-f193.google.com with SMTP id e10so19431200ljj.6
        for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2019 03:26:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TbpFv0intJ8F8kmL1Oulbc6SHsrmpdk7QJb19ZZgmp4=;
        b=YzU/NMyDYm8Q7MqjevK/SNTONZRtBgbjOM33hiBItp6QhKFpSfmj+hUHPRb1nswcPV
         xI02iJTSiPEYyOewv81g65jbwZtkQ/dIWYJXVhtXCkwERkv4gRTLjq1cDs/EaCEJSBqo
         uNWpZasqswrIl8LYjgokVQYtxvXiafTwILPFOBLtbsXaFsjlmBTYXIufBq4qMRXEJCt+
         tdtpaeb28P6QjYSyOF/QbGywT6pzqgh+9M7L/FGUSj+tC4pyXxFHlAFNl0lX+KF7hPTv
         gZFbce4gjLaxhX8e0O6m6c5sFdfpb7hOoJzdA3USKSaGUuLLLD5oNxJWvw8acjoWqDHA
         lFuQ==
X-Gm-Message-State: APjAAAXSJmxB2ChYIame33+Y+ssdieO+Ouy7R7QRPkBMVXoTZWC00EYw
        GFRpkO/yOZZjQIPe0cfctOs=
X-Google-Smtp-Source: APXvYqyBF3r0TfYzyzYMLEbpECo2zjh/CWFUAqJjOG00N7povabNE1qQiwmRDVa84GrOXS24d2yLKg==
X-Received: by 2002:a2e:814e:: with SMTP id t14mr19451979ljg.149.1575977179081;
        Tue, 10 Dec 2019 03:26:19 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id i19sm1395886lfj.17.2019.12.10.03.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 03:26:18 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iedem-0000wE-Gf; Tue, 10 Dec 2019 12:26:20 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/4] USB: fix NULL-deref and alternate settings bugs
Date:   Tue, 10 Dec 2019 12:25:57 +0100
Message-Id: <20191210112601.3561-1-johan@kernel.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I stumbled over a couple potential NULL-pointer dereferences due to
drivers using the first altsetting instead of the current one when doing
descriptor sanity checks.

Turns out we have a quite a few drivers getting this wrong even if this
would mostly be an issue on kernels with panic_on_warn set due to the
WARN() in usb_submit_urb().

Since we've started backporting fixes for such warnings (e.g. as
reported by syzbot), I've marked these for stable as well.

Johan


Johan Hovold (4):
  USB: atm: ueagle-atm: add missing endpoint check
  USB: adutux: fix interface sanity check
  USB: idmouse: fix interface sanity checks
  USB: serial: io_edgeport: fix epic endpoint lookup

 drivers/usb/atm/ueagle-atm.c     | 18 ++++++++++++------
 drivers/usb/misc/adutux.c        |  2 +-
 drivers/usb/misc/idmouse.c       |  2 +-
 drivers/usb/serial/io_edgeport.c | 10 ++++++----
 4 files changed, 20 insertions(+), 12 deletions(-)

-- 
2.24.0

