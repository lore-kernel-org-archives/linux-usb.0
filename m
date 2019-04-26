Return-Path: <SRS0=7cGN=S4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E28C43218
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 06:01:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CECC92084F
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 06:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556258502;
	bh=kueDBM4nbyfE0GZBG57XHAbADbpMXoZmS7ptaIVxTJU=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=rKDKaAFq4OP9hV6Ss3OMeocxIsYDxOJkLhEiDE8PF7jaAXlVkN4obziEs5TbSeY3g
	 cziYkUHDc2H1KP3Qche2PGxODGzo7G6Xn483kvT0ulUXSQKmI3zMLwvWdfQOS/Ukor
	 XpwOvMSg1XzOUWZF/39O58tx7hAp0400Gz3N10GQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbfDZGBl (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Apr 2019 02:01:41 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35866 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbfDZGBl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Apr 2019 02:01:41 -0400
Received: by mail-lf1-f68.google.com with SMTP id u17so1574393lfi.3
        for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2019 23:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iK2mZL9F0fqi4EHLC7RRXBojfo3X7a3vxZ/cwBcMM+k=;
        b=JGuOyyKtI0FIdI7mSBeBen9MQtNoRyLgKE0H72XYawtwep0p2wf8K2YdPqz2/PDSkv
         a1J3XeyB8WRwEW30+4/l6VpP+Spj3FmwHs+Qk5HFfB3xfA1gJjh2jIinlIVPHKkx7gV2
         GFVrPAgEA8tFdGA5uOI5M+mTKxFccnlhb69uoGvDoxqSjF1Y0zSvXzXTXM9anPz7jenw
         VccejAW2rNKgrkdG2gLy/0SBf8VL0GWh7UDvVadEr4Zv8YfUXzyiUUTIYv1N52U3hFny
         YmEBUIt+tu2D1S0evFMjuqZvFVwxrQWLI/yAhxOXFzjAFMEI/k2+pd0eoDWsuUDQWF6q
         f2mw==
X-Gm-Message-State: APjAAAV8o7PEd02+4ARo7ohKrBsV8w4hxtkz6hLbdEY2UPDjpBFinAaN
        gzjHYcbtLmcJSvUk064qwRHHRKL0
X-Google-Smtp-Source: APXvYqyGW94UmQLryfGL56ZuF6eHL9kj3CL7tSAN7BHxDz9iakE6pde+Cnb+J4p5+qMrdLRuh+SI2Q==
X-Received: by 2002:ac2:4303:: with SMTP id l3mr23656147lfh.61.1556258499539;
        Thu, 25 Apr 2019 23:01:39 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id p72sm835582lja.41.2019.04.25.23.01.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Apr 2019 23:01:38 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@xi.terra>)
        id 1hJtvW-0003Xo-5v; Fri, 26 Apr 2019 08:01:38 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>
Subject: [PATCH] USB: serial: drop unused iflag macro
Date:   Fri, 26 Apr 2019 08:01:32 +0200
Message-Id: <20190426060132.13584-1-johan@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190426060132.IR0m4f4cxZ1qNuEbMKSMj55uQYY7-3YmPLQbnHT9Csk@z>

Drop the RELEVANT_IFLAG() macro which essentially hasn't been used for
over a decade except in some remnant debug printks that were recently
removed.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 include/linux/usb/serial.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/linux/usb/serial.h b/include/linux/usb/serial.h
index 9d378826248b..1b631ea476ee 100644
--- a/include/linux/usb/serial.h
+++ b/include/linux/usb/serial.h
@@ -23,9 +23,6 @@
 /* The maximum number of ports one device can grab at once */
 #define MAX_NUM_PORTS		16
 
-/* parity check flag */
-#define RELEVANT_IFLAG(iflag)	(iflag & (IGNBRK|BRKINT|IGNPAR|PARMRK|INPCK))
-
 /* USB serial flags */
 #define USB_SERIAL_WRITE_BUSY	0
 #define USB_SERIAL_THROTTLED	1
-- 
2.21.0

