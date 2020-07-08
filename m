Return-Path: <SRS0=NA4g=AT=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E7EC433E0
	for <linux-usb@archiver.kernel.org>; Wed,  8 Jul 2020 12:50:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7541D2064B
	for <linux-usb@archiver.kernel.org>; Wed,  8 Jul 2020 12:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594212628;
	bh=cNgpB4EcMg9mgoHQL9jMqZaFGF6COQiDSxouNUlb3+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=wDsmSHObVicDshZRK9aXWWoqAFyjYvMlN048RRWN6i2muy+KgvwiTtr5XBGBGSTgW
	 K8Cl6H3dFs+T+pzIljeyApgbvTHbcC3H38AdE2xGBS3u0NbYN1jFVwT8+H6KkPr+f6
	 gCY9vlBwyJ9bsNJTS8cChdWFY1b+Swq38jKBC6tw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729354AbgGHMu1 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 8 Jul 2020 08:50:27 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38506 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728997AbgGHMuY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jul 2020 08:50:24 -0400
Received: by mail-lj1-f194.google.com with SMTP id 9so54049415ljv.5
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2020 05:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BOtMdQ31hSFZmoOylpnamupfx6U1bJ5fY1OLVV+RTVk=;
        b=URMNMaM91JvOv/xxsxabviFV4VB5V4X8KxHamdb49NgF+W9XMR17g6zmsJPCZhAV86
         i2eSRI4v1vdHie0M7iRTlEHKR8eLuyMjoGbBu9UevbCHTA7QeMujYXeC+tufyNB08gCG
         35Lf5pg2bQqGxxWR+qHXN3WK74p4Wn1LXYE1z1POdwYWbapRORIz9VvVNMeXMjt5G/3L
         Wj5wP3+qetDVmVTgRS7JiOgTvhNkShNVR4Uy3vbueqZPHBNrAVCu4MCMA6hHWi/R4DoI
         pFZ43OFdTFXXiboueVMi9fhe2zKHTZDEKFzISYL1EPnBgjQj9qcLIyqRztbPGrfaq0E6
         Rlow==
X-Gm-Message-State: AOAM530b+UNdZutm+QbY4bEGNGMI4Yt+xaeVBK13InFwZjawbw8cVDIu
        qw5XHNYm/Ktw/bOHKol0ROwJ0Zb1Kbg=
X-Google-Smtp-Source: ABdhPJwponsVPfDyxPfjcozaby3TjdX/Go8t1w4/RohR8PPmX9bMnHkTSuGF/lwDtY9tdVaK22HPBQ==
X-Received: by 2002:a2e:6806:: with SMTP id c6mr20696002lja.219.1594212621489;
        Wed, 08 Jul 2020 05:50:21 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id m4sm891088ljo.70.2020.07.08.05.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 05:50:19 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1jt9Wg-00045v-Ep; Wed, 08 Jul 2020 14:50:14 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>
Subject: [PATCH 06/10] USB: serial: inline sysrq dummy function
Date:   Wed,  8 Jul 2020 14:49:56 +0200
Message-Id: <20200708125000.15659-7-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200708125000.15659-1-johan@kernel.org>
References: <20200708125000.15659-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Inline the dummy sysrq character handling when either console support or
magic-sysrq support isn't enabled to allow the compiler to eliminate
unused code.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/generic.c | 9 ++-------
 include/linux/usb/serial.h   | 9 +++++++++
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/serial/generic.c b/drivers/usb/serial/generic.c
index c5b35252c931..a9b6d103aaf6 100644
--- a/drivers/usb/serial/generic.c
+++ b/drivers/usb/serial/generic.c
@@ -571,7 +571,7 @@ int usb_serial_generic_get_icount(struct tty_struct *tty,
 }
 EXPORT_SYMBOL_GPL(usb_serial_generic_get_icount);
 
-#ifdef CONFIG_MAGIC_SYSRQ
+#if defined(CONFIG_USB_SERIAL_CONSOLE) && defined(CONFIG_MAGIC_SYSRQ)
 int usb_serial_handle_sysrq_char(struct usb_serial_port *port, unsigned int ch)
 {
 	if (port->sysrq) {
@@ -584,13 +584,8 @@ int usb_serial_handle_sysrq_char(struct usb_serial_port *port, unsigned int ch)
 	}
 	return 0;
 }
-#else
-int usb_serial_handle_sysrq_char(struct usb_serial_port *port, unsigned int ch)
-{
-	return 0;
-}
-#endif
 EXPORT_SYMBOL_GPL(usb_serial_handle_sysrq_char);
+#endif
 
 int usb_serial_handle_break(struct usb_serial_port *port)
 {
diff --git a/include/linux/usb/serial.h b/include/linux/usb/serial.h
index 14cac4a1ae8f..be73646706a9 100644
--- a/include/linux/usb/serial.h
+++ b/include/linux/usb/serial.h
@@ -365,8 +365,17 @@ extern int usb_serial_generic_submit_read_urbs(struct usb_serial_port *port,
 extern void usb_serial_generic_process_read_urb(struct urb *urb);
 extern int usb_serial_generic_prepare_write_buffer(struct usb_serial_port *port,
 						void *dest, size_t size);
+
+#if defined(CONFIG_USB_SERIAL_CONSOLE) && defined(CONFIG_MAGIC_SYSRQ)
 extern int usb_serial_handle_sysrq_char(struct usb_serial_port *port,
 					unsigned int ch);
+#else
+static inline int usb_serial_handle_sysrq_char(struct usb_serial_port *port, unsigned int ch)
+{
+	return 0;
+}
+#endif
+
 extern int usb_serial_handle_break(struct usb_serial_port *port);
 extern void usb_serial_handle_dcd_change(struct usb_serial_port *usb_port,
 					 struct tty_struct *tty,
-- 
2.26.2

