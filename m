Return-Path: <SRS0=JW0E=SU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E518EC10F0E
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 16:04:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B64C720693
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 16:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555603477;
	bh=brhCNwCyuZr0kRXlnbKGGK6hXr2FKT2lNlttiMwA87U=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=RAQfiYsT7e8W4lORJ/NBCBH/8teVgm4ProudAYhGTPHSEtrhcnnt6aLLiTRkFrttx
	 bPayX0yiN6zeVm3mcSA8TR/+o5kba2ZobRvWFVOdUYELhcb5IRsIP3MgbEBwcwiyDR
	 VdSM5LKTtz6h3q36g2Q1wjNc5TVvSBRrforpsANw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388387AbfDRQEh (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 18 Apr 2019 12:04:37 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40243 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731317AbfDRQEg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Apr 2019 12:04:36 -0400
Received: by mail-lf1-f67.google.com with SMTP id a28so2030989lfo.7
        for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2019 09:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pqm7SQGZ3qeiIaaqBVi7Te5LuiXZMwSaec4TVfscHOo=;
        b=Su+QXzVil6cx3n33r71hz1GUlscsYepk4jBSpmiGNOMaEL7WC5rP8QX8+odi27TrIb
         HqAmhDjT/TLNNkmKjRRE8Ir0ncpPoUI4OWuxs9z91Cz6wp6+paDTcNnsKPVNIMT0PLZL
         Xnq0vAPrWVy0vGaSBKtWMr1YRaC47X8q1WQ0w5tRx6LAK0KLRG11OoU8RGprKDMQTV2u
         JTg2NDeV1tdnNcWrsOfhr2nJ0e8PI4roI+fwlEXfHdPhlZ35ajUmBPCuxWfKo2S+CRik
         k5haZj5u8ooR/SyHp/BVcG/5Xi6IA0OhTajQJ0tDwspcn+tH6uw813+cLiM0uMxrTLjk
         vzyQ==
X-Gm-Message-State: APjAAAVvgXsmdfLELB00KN7H+6Q/xLLFdmmT06L94ezb1Go9qp1ojoHE
        ++7tKerKp1fzzaQjcPYNK0fVOJQy
X-Google-Smtp-Source: APXvYqzjE6NlC2/QktOJnYKwlUEToRzxvmf65OMPQeF1jaZwt2QjFHNB6IkUoT1XhIvQpCOLY37m1Q==
X-Received: by 2002:ac2:5222:: with SMTP id i2mr16890383lfl.68.1555603474115;
        Thu, 18 Apr 2019 09:04:34 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id j9sm482591lja.92.2019.04.18.09.04.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 09:04:32 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@xi.terra>)
        id 1hH9Wj-0004dr-TJ; Thu, 18 Apr 2019 18:04:41 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Florian Zumbiehl <florz@florz.de>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH] USB: serial: pl2303: fix xon/xoff flow control
Date:   Thu, 18 Apr 2019 18:03:52 +0200
Message-Id: <20190418160352.17793-1-johan@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190418160352.uxLK7xLY-XT138HErBUALMfQacTBKaNL8l91HzfE8m8@z>

Fix the XON/XOFF flow-control implementation by reporting back the
attributes actually supported while ignoring the rest.

Note that only outgoing XON/XOFF flow control (IXON) is currently
supported for PL2303HX, and only using the default start and stop chars.

Fixes: 68270dab9710 ("USB: serial: pl2303: fix non-supported xon/xoff")
Fixes: 7041d9c3f01b ("USB: serial: pl2303: add support for tx xon/xoff flow control")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/pl2303.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index 55122ac84518..dc20a3359601 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -570,27 +570,13 @@ static int pl2303_set_line_request(struct usb_serial_port *port,
 
 static bool pl2303_termios_change(const struct ktermios *a, const struct ktermios *b)
 {
-	bool ixon_change;
+	bool xonxoff_change;
 
-	ixon_change = ((a->c_iflag ^ b->c_iflag) & (IXON | IXANY)) ||
+	xonxoff_change = ((a->c_iflag ^ b->c_iflag) & (IXON | IXANY | IXOFF)) ||
 			a->c_cc[VSTART] != b->c_cc[VSTART] ||
 			a->c_cc[VSTOP] != b->c_cc[VSTOP];
 
-	return tty_termios_hw_change(a, b) || ixon_change;
-}
-
-static bool pl2303_enable_xonxoff(struct tty_struct *tty, const struct pl2303_type_data *type)
-{
-	if (!I_IXON(tty) || I_IXANY(tty))
-		return false;
-
-	if (START_CHAR(tty) != 0x11 || STOP_CHAR(tty) != 0x13)
-		return false;
-
-	if (type->no_autoxonxoff)
-		return false;
-
-	return true;
+	return tty_termios_hw_change(a, b) || xonxoff_change;
 }
 
 static void pl2303_set_termios(struct tty_struct *tty,
@@ -717,12 +703,19 @@ static void pl2303_set_termios(struct tty_struct *tty,
 		spin_unlock_irqrestore(&priv->lock, flags);
 	}
 
+	tty->termios.c_iflag &= ~(IXANY | IXOFF);
+	if (spriv->type->no_autoxonxoff)
+		tty->termios.c_iflag &= ~IXON;
+
+	tty->termios.c_cc[VSTART] = 0x11;
+	tty->termios.c_cc[VSTOP] = 0x13;
+
 	if (C_CRTSCTS(tty)) {
 		if (spriv->quirks & PL2303_QUIRK_LEGACY)
 			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0x40);
 		else
 			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0x60);
-	} else if (pl2303_enable_xonxoff(tty, spriv->type)) {
+	} else if (I_IXON(tty)) {
 		pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0xc0);
 	} else {
 		pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0);
-- 
2.21.0

