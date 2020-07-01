Return-Path: <SRS0=oYLI=AM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A41C433E1
	for <linux-usb@archiver.kernel.org>; Wed,  1 Jul 2020 17:37:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 931AA2078B
	for <linux-usb@archiver.kernel.org>; Wed,  1 Jul 2020 17:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593625059;
	bh=i4fk90wefd18uK4K7rJe6VUvHWRTE0DWpN8YRmT1IPo=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=WWnY6d/HZpBdI6mdbhvWkpK4qUYLyIOwzt9cYNB6059arV9vU6EjGmi6wT0IiSsFW
	 nyaoqv+9OJB6reyQRar/p5l6EEwCk6aHzamMhB8lONaV36V7OSfWKGVY8ZiFgJ4o1n
	 gnJ8UcoZWwua6jzwG5R4NzNSc0RWOt3u9oDE1zk4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732662AbgGARhj (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 1 Jul 2020 13:37:39 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44197 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726432AbgGARhi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jul 2020 13:37:38 -0400
Received: by mail-lj1-f196.google.com with SMTP id s9so28143641ljm.11
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2020 10:37:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1XTgTQyLuDvTOtwMWlKODGhPfC0PfoqcnqV1n11D/LE=;
        b=YPlNgOY2jQZzWr5xoObGeyD0CNrqNqLXnu1m05zqq7y8SbGXHK/opXxLBZ/QjURNb7
         9CXDp8jHI+UZBm9XU0FN5boMp8V9r6MNbZ7PT4mNvMGq+spzL+NsW/bBXL8mfFTuwrsG
         52hVVmg6Uxezyk+jaEGUfciHX5sNKmcYEPPbM58PzFD219CR3t5QaRBohIQVUYb8nOYN
         swHpR6fpq1V6r5F7ZyHtyDUPApqSpF0JJIpoYF0kebBiwtcdxhg0cMoG/zMwB+3/zm+w
         WqvO9SI2wPphK9uggTl4OFrEJ2gqQE8BdP4+byg8nCP3TPAzZOL3+MjZ/j0Fb1SIjCKu
         wmfw==
X-Gm-Message-State: AOAM5303wLka8pL6HqhY0rzq89CvJNBtV1PFspgToAsiBAcuLLvgp/sU
        efpzdIK/V6RQlWbtIeNH3mY=
X-Google-Smtp-Source: ABdhPJyP4c7X4Er5slxTn5TVx103C+zcrxh2m3zWxVIGcKeM24dbeGRV8i3DnKEFikInBeIUl5Qk3A==
X-Received: by 2002:a2e:9b04:: with SMTP id u4mr14866173lji.364.1593625056367;
        Wed, 01 Jul 2020 10:37:36 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id 132sm2271926lfl.37.2020.07.01.10.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 10:37:35 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1jqgfr-0001Bt-48; Wed, 01 Jul 2020 19:37:31 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH] USB: serial: console: add support for enabling flow control
Date:   Wed,  1 Jul 2020 19:37:22 +0200
Message-Id: <20200701173722.4536-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for enabling hardware flow control using the 'r' command
line option.

This also avoids a W=1 (-Wunused-but-set-variable) warning.

Signed-off-by: Johan Hovold <johan@kernel.org>
---

Missed this one at first... The white space change is done on purpose to
remove a stray tab.

Johan


 drivers/usb/serial/console.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/console.c b/drivers/usb/serial/console.c
index 7d289302ff6c..b97aa40ca4d1 100644
--- a/drivers/usb/serial/console.c
+++ b/drivers/usb/serial/console.c
@@ -79,7 +79,7 @@ static int usb_console_setup(struct console *co, char *options)
 		if (*s)
 			doflow = (*s++ == 'r');
 	}
-	
+
 	/* Sane default */
 	if (baud == 0)
 		baud = 9600;
@@ -102,6 +102,9 @@ static int usb_console_setup(struct console *co, char *options)
 		break;
 	}
 
+	if (doflow)
+		cflag |= CRTSCTS;
+
 	/*
 	 * no need to check the index here: if the index is wrong, console
 	 * code won't call us
-- 
2.26.2

