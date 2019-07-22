Return-Path: <SRS0=gkhN=VT=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EB0C76195
	for <linux-usb@archiver.kernel.org>; Mon, 22 Jul 2019 15:14:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 20A8321993
	for <linux-usb@archiver.kernel.org>; Mon, 22 Jul 2019 15:14:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="azLmz3I8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728213AbfGVPOl (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 22 Jul 2019 11:14:41 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:65274 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728169AbfGVPOk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Jul 2019 11:14:40 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 45slVQ4kcbzB2;
        Mon, 22 Jul 2019 17:13:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1563808399; bh=eB8CbQl5GehEW9z9btkbOtbwkxkS/GFp/Ton0V86t8E=;
        h=Date:From:Subject:To:Cc:From;
        b=azLmz3I8hpjasO18lkuEsee8SltmeMnyxaq3XL9LRUnTxgbN0r+sLgI2uAfDEhuRT
         Cx+NUpmlnmJ6fMPHQtKsuI34SD6++qSVj3Ilf1GgWzBHRBF1+ZZPDybN9L6U/wDLk+
         4hfTck6A/h5X6K6QPGQm7ZO0c3vQmZuegUiVic0x+bid18p5wCUkFiz+c8rNLjGKyl
         lTM48P8IvU9RBnHCBcw/hGDbAudg8NpeEXZwqPHgMZ/icFQwwyMh12Kt0SD9N9zLa+
         Yypcp48LHL2+DDMGDGI90wjfYU5cjZv7zZRAdE7XaID4Frye363gtoSMvujM+3tsgJ
         QpV/yudvNcw8w==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date:   Mon, 22 Jul 2019 17:14:37 +0200
Message-Id: <cover.1563808218.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v4 0/6] usb: gadget: u_serial: console improvements
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-usb@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ladislav Michl <ladis@linux-mips.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series makes it possible to have more control over console using
USB serial gadget ports. This can be useful when you need more than
one USB console or are configuring multiple serial port function via
configfs.

The patches are against usb-next tree. You can also pull from:
   https://rere.qmqm.pl/git/linux  usb-console

Michał Mirosław (6):
  usb: gadget: u_serial: add missing port entry locking
  usb: gadget: u_serial: reimplement console support
  usb: gadget: u_serial: make OBEX port not a console
  usb: gadget: u_serial: allow more console gadget ports
  usb: gadget: u_serial: diagnose missed console messages
  USB: gadget: legacy/serial: allow dynamic removal

 drivers/usb/gadget/function/f_acm.c    |  21 ++
 drivers/usb/gadget/function/f_obex.c   |   2 +-
 drivers/usb/gadget/function/f_serial.c |  21 ++
 drivers/usb/gadget/function/u_serial.c | 420 ++++++++++++++-----------
 drivers/usb/gadget/function/u_serial.h |   8 +
 drivers/usb/gadget/legacy/serial.c     |  49 ++-
 6 files changed, 333 insertions(+), 188 deletions(-)

-- 
2.20.1

