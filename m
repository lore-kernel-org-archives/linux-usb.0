Return-Path: <SRS0=zrGg=3G=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10479C33CB6
	for <linux-usb@archiver.kernel.org>; Fri, 17 Jan 2020 09:51:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D7E1220730
	for <linux-usb@archiver.kernel.org>; Fri, 17 Jan 2020 09:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579254671;
	bh=3jDV1Rl7d8RgSucP31HtcTOCH0pLQrACTrWMmz8Bsfg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=PohtSOiNyrja4YuTx4Ux2myMI3RTQzaKbVJxnRy69fBHr6hNPJnQYbKF0Z0u/pG/f
	 O4uZ3Foxp2bgeOIb91jaG3QoDUY5DG3TuJPQb4vYnf1jcHOCJ7KDRJzIRR1S/2ob4i
	 YAbv8L3v6rVQnoK1SEOziSxo5NWr6nmP5hk0OBY8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgAQJvK (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 17 Jan 2020 04:51:10 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33415 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726409AbgAQJvJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jan 2020 04:51:09 -0500
Received: by mail-lf1-f67.google.com with SMTP id n25so17894371lfl.0;
        Fri, 17 Jan 2020 01:51:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TZLTb3Fb9pbA200scuV5oYNRLcZ/MmVWd9YnnmqWfKk=;
        b=YEpydZeehGlQfVUO+fKl5HUhtwhqTgDecPWi+H7kEtZPoOasMlSeHOcvrqHj/vCRln
         7USc+lJBrqvOwuRW+2ez+qei1xLIw9h5xDISsR8SsXndSSMmjRGTsE0a98LMwwKMTywc
         SesmDCgpJI1ERqXfCnUUfaDWxCoLRsRC3XkA/+9Lv2sfDlSoEU9peUtWjivltRh43cXQ
         xavEjZsRDvTSTJ+/K8GZ1aiWuYLL82Q8ZHAzUfRc5bsaeMPhCX1o8Wp+xfW24bN9G/Gc
         RLQuTu18cxrpI4MgnrarzCS5XuAW3t4m1nSVKTAjeBpkQk+t3eZnRXxyPGrzHcWVcMqO
         BPWQ==
X-Gm-Message-State: APjAAAUzxvKJQPRZpF5VD8eI3yHjSSYLzTS9BsIfTiEygFJ3AQyUOERQ
        N5QgWmvMeerwg6eD/u7hiPV0vdFu
X-Google-Smtp-Source: APXvYqxN8VxWk3JnF0fI1FuDo1faYKDT5SpJhv7ZzgzVguahzEDpbdwLi9GmHdNDfHcCss2VBO3elQ==
X-Received: by 2002:ac2:489b:: with SMTP id x27mr4984189lfc.130.1579254667340;
        Fri, 17 Jan 2020 01:51:07 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id w20sm12080240ljo.33.2020.01.17.01.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 01:51:06 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1isOHQ-0007DS-Hp; Fri, 17 Jan 2020 10:51:04 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, stable <stable@vger.kernel.org>
Subject: [PATCH 4/5] USB: serial: keyspan: handle unbound ports
Date:   Fri, 17 Jan 2020 10:50:25 +0100
Message-Id: <20200117095026.27655-5-johan@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117095026.27655-1-johan@kernel.org>
References: <20200117095026.27655-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Check for NULL port data in the control URB completion handlers to avoid
dereferencing a NULL pointer in the unlikely case where a port device
isn't bound to a driver (e.g. after an allocation failure on port
probe()).

Fixes: 0ca1268e109a ("USB Serial Keyspan: add support for USA-49WG & USA-28XG")
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable <stable@vger.kernel.org>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/keyspan.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/serial/keyspan.c b/drivers/usb/serial/keyspan.c
index e66a59ef43a1..aa3dbce22cfb 100644
--- a/drivers/usb/serial/keyspan.c
+++ b/drivers/usb/serial/keyspan.c
@@ -1058,6 +1058,8 @@ static void	usa49_glocont_callback(struct urb *urb)
 	for (i = 0; i < serial->num_ports; ++i) {
 		port = serial->port[i];
 		p_priv = usb_get_serial_port_data(port);
+		if (!p_priv)
+			continue;
 
 		if (p_priv->resend_cont) {
 			dev_dbg(&port->dev, "%s - sending setup\n", __func__);
@@ -1459,6 +1461,8 @@ static void usa67_glocont_callback(struct urb *urb)
 	for (i = 0; i < serial->num_ports; ++i) {
 		port = serial->port[i];
 		p_priv = usb_get_serial_port_data(port);
+		if (!p_priv)
+			continue;
 
 		if (p_priv->resend_cont) {
 			dev_dbg(&port->dev, "%s - sending setup\n", __func__);
-- 
2.24.1

