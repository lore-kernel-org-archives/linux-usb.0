Return-Path: <SRS0=xlHB=4N=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31945C35DF5
	for <linux-usb@archiver.kernel.org>; Tue, 25 Feb 2020 10:25:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F362920714
	for <linux-usb@archiver.kernel.org>; Tue, 25 Feb 2020 10:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582626303;
	bh=C4DtCe2lUkv7VtatMcXxK+iaxeexO35g1/tbc4OMpUY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ZgXsfOC8fPIljIfopFJFFQpTQQJlFP30yWEQmYT6dcf+q81sUzQAtS9G65dSENlxb
	 ZyndJkQmsW4ZIsUxQbrJLthD1FOvkFPmPjXw1k5bodPJurwrs+pONArhJRHWurEGYO
	 YgAIdek8IIHv0kVmSm3OzG+jkGXv3yq3RJjPujhI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730224AbgBYKZC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 25 Feb 2020 05:25:02 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39472 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730134AbgBYKZB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Feb 2020 05:25:01 -0500
Received: by mail-lf1-f66.google.com with SMTP id n30so8549434lfh.6
        for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2020 02:25:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gfbXFO3iENyGLqYi+8aXQsJx1LifTAVxGdAwdRvtwfA=;
        b=kLecr29KIK5Kh1iqfHxLZcDGnQ+nM84KQ3i5leDtu6wC1bkIt4JlQUunwP32EGJBQF
         4r1QpJX7LFGo0GBp+i5DcwrYX71aKeIMMixA/te5a5nPnNWvNg2UGpET2/nCVLA3v57k
         CbUe+S1VuZwRwNyzWgcxAlZ56B+B4nA90Zk1PthVXF3qocnEUrAi78WYEn5JvXrfJxiq
         QIANHNWj6UCbasgTllk0Vr1VtjSFCCKzpfdkePncDR96rl+/VXpZPhiImKh1+01Er25S
         PchrbtKQNvbjHVBz1ebMaoD6UvjtRLo0aJmeeC+ojwk/7vRBZxifcPiu2NEHmA5YhYVm
         n5Yg==
X-Gm-Message-State: APjAAAVILbE91eRpCentMnx4ETrFr0IAewpvXNhXtjLIRcFOQ0EyK69F
        mnUUxwE35PlW137MVkb3gdQ=
X-Google-Smtp-Source: APXvYqy1Sguizz/Hk+ZiDr3Gg0EjwGAIOshyWExxmJY5D64rF6AXNVwpvHjXcLP3SR7U++KuSHUZsA==
X-Received: by 2002:a19:6459:: with SMTP id b25mr1938725lfj.115.1582626299737;
        Tue, 25 Feb 2020 02:24:59 -0800 (PST)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id n11sm7609393ljg.15.2020.02.25.02.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 02:24:58 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1j6XOY-0004op-P5; Tue, 25 Feb 2020 11:24:54 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 2/2] USB: serial: fix tty cleanup op kernel-doc
Date:   Tue, 25 Feb 2020 11:24:21 +0100
Message-Id: <20200225102421.18262-3-johan@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200225102421.18262-1-johan@kernel.org>
References: <20200225102421.18262-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The tty cleanup operation is called with a struct tty as it's sole
parameter.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/usb-serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/usb-serial.c b/drivers/usb/serial/usb-serial.c
index dc7a65b9ec98..27e3bb58c872 100644
--- a/drivers/usb/serial/usb-serial.c
+++ b/drivers/usb/serial/usb-serial.c
@@ -288,7 +288,7 @@ static void serial_close(struct tty_struct *tty, struct file *filp)
 
 /**
  * serial_cleanup - free resources post close/hangup
- * @port: port to free up
+ * @tty: tty to clean up
  *
  * Do the resource freeing and refcount dropping for the port.
  * Avoid freeing the console.
-- 
2.24.1

