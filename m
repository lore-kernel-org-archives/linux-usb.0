Return-Path: <SRS0=HzBI=SQ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8571C10F13
	for <linux-usb@archiver.kernel.org>; Sun, 14 Apr 2019 10:00:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A39FF2148E
	for <linux-usb@archiver.kernel.org>; Sun, 14 Apr 2019 10:00:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="OKB42H0Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbfDNKAS (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 14 Apr 2019 06:00:18 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35179 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfDNKAS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 14 Apr 2019 06:00:18 -0400
Received: by mail-ed1-f68.google.com with SMTP id s39so12037934edb.2
        for <linux-usb@vger.kernel.org>; Sun, 14 Apr 2019 03:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:mime-version
         :content-disposition:user-agent;
        bh=3ei61JH492t+eJ+0JQA2Pgv23o59e4J0hDfZw/sU46Y=;
        b=OKB42H0YeIW4csoDIH9qlcZAMIlGMjSuvRKshB07ALF2lao0AKKkDZJfF+8ocwCAe8
         yEwF0RXs1/TLvZj/mnkPCk25VDOztu2BQskdWww/RhGT2VCCgwk+F88ksQXaEiKLX4fR
         NymJRkivdeT3fm9fuZNqj6og8qlC7b2shW9PIalBqDnH/OZ4f0XIqTH8WxV7RF73TiuY
         ErK616qU+leKsicmtytUhVbR4+o84NF6B6ypCt65JLDr+6DkIrh6kbnmId2PjOv7i9uU
         noDByR7e+wo6jY34kjPIYyj+yoEJW2t8/cau8DRK25MDw61WID6p4TBtwcuI7sZ9XqPi
         ijTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:mime-version:content-disposition:user-agent;
        bh=3ei61JH492t+eJ+0JQA2Pgv23o59e4J0hDfZw/sU46Y=;
        b=tbp2ZeNjbwKl5RwUN0btyEpHzPkP9wwolNGLodqNE8dz8O7IRUQ8wTP+5tUwMuCcNS
         81lZbFUt8jjyCzqDhR6XyHd2mBkPyA60bvGmeFv1M3QWwRgpwduxaAcaLfJzjFwk/7Eu
         mFuDBQYh/HOj2j+9keaGLuesVLTo6mLMwEdkUGufg3/mIKNZhgNvxLDxdedoHy6wOu53
         +gB2MbVvHdEf7WxKFvF3zaqjFXe2NgE95ZHbVxi5UjeVkkhTn1svb3kS1XKIwEY9IhVS
         KAiIfdgjsM1/HyCp2gmF+NBMuJGNyukL9kIe8SsjIjulp4ltuWP5U787WKfEIF+yUyOi
         xYEg==
X-Gm-Message-State: APjAAAUR6h4nt8V0OOgryz3rg5QE8kyr++kfUZ7gZsTW8RaAphKsaV4Q
        PLWvynZOVYqmwqlvVbgB+vBUL5+c
X-Google-Smtp-Source: APXvYqyPuUkpUxyX1KarCA0qSkxnCjIYDFNaOAn9JoLR4OC5mSPgDxhLnBjgOczw8cIU95nvhm0Aqw==
X-Received: by 2002:a17:906:7496:: with SMTP id e22mr37426668ejl.45.1555236015315;
        Sun, 14 Apr 2019 03:00:15 -0700 (PDT)
Received: from alum ([80.71.142.55])
        by smtp.gmail.com with ESMTPSA id g14sm4502673ejs.49.2019.04.14.03.00.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Apr 2019 03:00:14 -0700 (PDT)
Date:   Sun, 14 Apr 2019 12:00:12 +0200
From:   Malte Leip <malte@leip.net>
To:     valentina.manea.m@gmail.com, shuah@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: [PATCH] usb: usbip: fix isoc packet num validation in get_pipe
Message-ID: <20190414100012.lt6uwohkprhhydo6@alum>
Reply-To: malte@leip.net
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190414100012.dBBUuG4SL-2w-QvFhprxv1tWK1MS32Zke2pnHucuqVU@z>

Change the validation of number_of_packets in get_pipe to compare the
number of packets to a fixed maximum number of packets allowed, set to
be 1024. This number was chosen due to it being used by other drivers as
well, for example drivers/usb/host/uhci-q.c

Background/reason:
The get_pipe function in stub_rx.c validates the number of packets in
isochronous mode and aborts with an error if that number is too large,
in order to prevent malicious input from possibly triggering large
memory allocations. This was previously done by checking whether
pdu->u.cmd_submit.number_of_packets is bigger than the number of packets
that would be needed for pdu->u.cmd_submit.transfer_buffer_length bytes
if all except possibly the last packet had maximum length, given by
usb_endpoint_maxp(epd) *  usb_endpoint_maxp_mult(epd). This leads to an
error if URBs with packets shorter than the maximum possible length are
submitted, which is allowed according to
Documentation/driver-api/usb/URB.rst and occurs for example with the
snd-usb-audio driver.

Fixes: c6688ef9f297 ("usbip: fix stub_rx: harden CMD_SUBMIT path to handle malicious input")
Signed-off-by: Malte Leip <malte@leip.net>
---

Further background:

The headphones / USB soundcard
ID 046d:0a1f Logitech, Inc. G930
is currently (tested specifically with 4.19) not usable with the snd-usb-audio
driver over usbip.  (I also reported this problem a year ago at [1] where some
further information can be found.) The system log of the host shows the
following errors:
Mar 31 20:24:01.696845 sys-usb kernel: usbip-host 3-1: CMD_SUBMIT: isoc invalid num packets 6
Mar 31 20:24:01.696980 sys-usb kernel: usbip_core: unknown command
Mar 31 20:24:01.697588 sys-usb kernel: usbip-host 3-1: recv invalid request

I can provide more detailed debug output, try to test with other versions etc.
if required, but I think the cause is the problem described in the commit
message above, and this patch fixes the problem for me.

The snd-usb-audio driver submits URBs in isochronous mode with packet sizes
below the maximum, particularly in prepare_silent_urb in sound/usb/endpoint.c -
the size of the next packets is determined by snd_usb_endpoint_next_packet_size
in the same file and isn't always the maximum packet size. This then leads to a
problem as described in the commit message.

There are also other places in Linux where number_of_packets of an URB is
validated, for example in drivers/usb/host/uhci-q.c or
drivers/usb/core/devio.c.  Both have fixed absolute limits, the former of 1024,
the latter of 128.  Hence my proposal to replace the current check with
checking that number_of_packets is not larger than 1024.

Independently of the problem with below-maximum-size packets: Why does the
current check even do what it is intended to do? What would prevent an attacker
from not only setting number_of_packets to a very large number, but also
transfer_buffer_length, sufficient to pass the current check?

[1]: https://github.com/QubesOS/qubes-issues/issues/36284

 drivers/usb/usbip/stub_rx.c      | 12 +++---------
 drivers/usb/usbip/usbip_common.h |  7 +++++++
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
index 97b09a42a10c..dbfb2f24d71e 100644
--- a/drivers/usb/usbip/stub_rx.c
+++ b/drivers/usb/usbip/stub_rx.c
@@ -361,16 +361,10 @@ static int get_pipe(struct stub_device *sdev, struct usbip_header *pdu)
 	}
 
 	if (usb_endpoint_xfer_isoc(epd)) {
-		/* validate packet size and number of packets */
-		unsigned int maxp, packets, bytes;
-
-		maxp = usb_endpoint_maxp(epd);
-		maxp *= usb_endpoint_maxp_mult(epd);
-		bytes = pdu->u.cmd_submit.transfer_buffer_length;
-		packets = DIV_ROUND_UP(bytes, maxp);
-
+		/* validate number of packets */
 		if (pdu->u.cmd_submit.number_of_packets < 0 ||
-		    pdu->u.cmd_submit.number_of_packets > packets) {
+		    pdu->u.cmd_submit.number_of_packets >
+		    USBIP_MAX_ISO_PACKETS) {
 			dev_err(&sdev->udev->dev,
 				"CMD_SUBMIT: isoc invalid num packets %d\n",
 				pdu->u.cmd_submit.number_of_packets);
diff --git a/drivers/usb/usbip/usbip_common.h b/drivers/usb/usbip/usbip_common.h
index bf8afe9b5883..8be857a4fa13 100644
--- a/drivers/usb/usbip/usbip_common.h
+++ b/drivers/usb/usbip/usbip_common.h
@@ -121,6 +121,13 @@ extern struct device_attribute dev_attr_usbip_debug;
 #define USBIP_DIR_OUT	0x00
 #define USBIP_DIR_IN	0x01
 
+/*
+ * Arbitrary limit for the maximum number of isochronous packets in an URB,
+ * compare for example the uhci_submit_isochronous function in
+ * drivers/usb/host/uhci-q.c
+ */
+#define USBIP_MAX_ISO_PACKETS 1024
+
 /**
  * struct usbip_header_basic - data pertinent to every request
  * @command: the usbip request type
-- 
2.11.0

