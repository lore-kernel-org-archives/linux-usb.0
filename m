Return-Path: <SRS0=Njro=AY=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FF8C433EA
	for <linux-usb@archiver.kernel.org>; Mon, 13 Jul 2020 10:55:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C100020758
	for <linux-usb@archiver.kernel.org>; Mon, 13 Jul 2020 10:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594637733;
	bh=eWvE9l9lDd4i69/+eqPzjoS9kvsqm6elQCJc9EkZ9hM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=RbF2OSRZA1dGQ4vFniQ8tNQuDxANvwEKl4588i6hMp7vbuIV+mHmQXRobLvIwNCBP
	 NyG98dTZTnlcjvww/G0pCqU1pSHx8rbJrDRFAe4ZY6DWML7RCh2QEKBkJUckN00uuO
	 cQL/uqVp7+Y2Thf8dbPHgkBuNmuvI4wp+afSinyY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729390AbgGMKzc (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 13 Jul 2020 06:55:32 -0400
Received: from mail-lf1-f42.google.com ([209.85.167.42]:37647 "EHLO
        mail-lf1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729594AbgGMKza (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jul 2020 06:55:30 -0400
Received: by mail-lf1-f42.google.com with SMTP id k15so8659725lfc.4
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2020 03:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JsGmXUuiWIk6SoRdgEmYmqDS/E3gZWEwecJGcIXAItY=;
        b=ihNOyAp2GJQT0c0TfLvW9mWIkhsYEwfTokU2Jml8I4X+gZSStJSQtwiMVKC77zl7R4
         4d64lINkFfKindZAyQQpFyJoIAc7gTWW3xeInYIZTSJ9AgVppQIQ3Octov8LVNT4JshU
         AFt3pl846vg8T8RY8T3TWGy0VE06esvSuQJ9djtkW2rptJ2H7B96uSypmosm2rfr4R+U
         rH6JWUrRDm+RrAhwlrcTzsrL87gwYZ0r05q+8HVp4OFPuRmFlhpq3trWlDIgnYKNDmXd
         fT07lrIFOZVjy0aK5ZkfEbVlAlkBcpL7KEEhH/I+vcC3KjVQWwgKEieE9lvb3CMhToC7
         WEdw==
X-Gm-Message-State: AOAM533tC+kGR+b577vm1fUNuhyU99ahYbssbWI5L8a95h8H362qFGEz
        OOP4nYehkrf2bOAYq87yFR9erIhdmV8=
X-Google-Smtp-Source: ABdhPJwI7o8dKeojfIJDY2g5wgIhKwPFs/eiOH/WzSnPE3cQnu0HxpP4QIQtcIJlPNiTtKI+PaGlBQ==
X-Received: by 2002:a05:6512:20f:: with SMTP id a15mr52103604lfo.118.1594637728424;
        Mon, 13 Jul 2020 03:55:28 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id x24sm4014687ljh.21.2020.07.13.03.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 03:55:27 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1juw7S-0007FS-B2; Mon, 13 Jul 2020 12:55:34 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     =?UTF-8?q?Jarom=C3=ADr=20=C5=A0korpil?= <Jerry@jrr.cz>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 4/5] USB: serial: cp210x: drop unnecessary packed attributes
Date:   Mon, 13 Jul 2020 12:55:16 +0200
Message-Id: <20200713105517.27796-5-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200713105517.27796-1-johan@kernel.org>
References: <20200713105517.27796-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop unnecessary packed attributes from structs without padding.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/cp210x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 3a65be4a0ec0..09445b7a8f64 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -435,7 +435,7 @@ struct cp210x_flow_ctl {
 	__le32	ulFlowReplace;
 	__le32	ulXonLimit;
 	__le32	ulXoffLimit;
-} __packed;
+};
 
 /* cp210x_flow_ctl::ulControlHandshake */
 #define CP210X_SERIAL_DTR_MASK		GENMASK(1, 0)
@@ -469,7 +469,7 @@ struct cp210x_flow_ctl {
 struct cp210x_pin_mode {
 	u8	eci;
 	u8	sci;
-} __packed;
+};
 
 #define CP210X_PIN_MODE_MODEM		0
 #define CP210X_PIN_MODE_GPIO		BIT(0)
@@ -532,7 +532,7 @@ struct cp210x_single_port_config {
 struct cp210x_gpio_write {
 	u8	mask;
 	u8	state;
-} __packed;
+};
 
 /*
  * Helper to get interface number when we only have struct usb_serial.
-- 
2.26.2

