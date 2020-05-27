Return-Path: <SRS0=gdTw=7J=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5AFC433E4
	for <linux-usb@archiver.kernel.org>; Wed, 27 May 2020 09:41:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 638AD2075A
	for <linux-usb@archiver.kernel.org>; Wed, 27 May 2020 09:41:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728842AbgE0JlM (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 27 May 2020 05:41:12 -0400
Received: from gofer.mess.org ([88.97.38.141]:47329 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728206AbgE0JlL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 27 May 2020 05:41:11 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 7CCF4C635E; Wed, 27 May 2020 10:41:07 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>
Subject: [PATCH v2 0/3] IR Toy / IR Droid USB driver
Date:   Wed, 27 May 2020 10:41:04 +0100
Message-Id: <20200527094107.11936-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

v1 was a serio driver, this has now been re-written to be a USB driver.
This requires a blacklist in the usb cdc-acm driver.

This also allows us to feed IR data to the device from the urb callback
handler, which reduces the chance of unwanted gaps in the transmission.

Sean Young (3):
  media: rc: add support for Infrared Toy and IR Droid devices
  USB: cdc-acm: blacklist IR Droid / IR Toy device
  MAINTAINERS: rc core and lirc maintainership

 MAINTAINERS                 |  13 +
 drivers/media/rc/Kconfig    |  11 +
 drivers/media/rc/Makefile   |   1 +
 drivers/media/rc/ir_toy.c   | 525 ++++++++++++++++++++++++++++++++++++
 drivers/usb/class/cdc-acm.c |   6 +
 5 files changed, 556 insertions(+)
 create mode 100644 drivers/media/rc/ir_toy.c

-- 
2.26.2

