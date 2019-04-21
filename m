Return-Path: <SRS0=vzMr=SX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 241E4C10F14
	for <linux-usb@archiver.kernel.org>; Sun, 21 Apr 2019 12:22:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5FB420869
	for <linux-usb@archiver.kernel.org>; Sun, 21 Apr 2019 12:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555849323;
	bh=3UqKg/JoxN8cBeg2pj/pJeWGdFsuPZJGz2DUwyU21Rw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=EhEdsx26Y/TP0N3bXnPbojdeC03aMpHYT/KjaEWCDgzlMsTwF5wS0sQAYSGRWkCxl
	 ZrRKGBJ9OuiXgbWZF3Z53kAU1MTz9l9gadt0IO2D6tV937xAkPkLFiHc0srgXmjhZX
	 7MN8I4iWAU8s0Y7sV5aqn6AK2IPiRa/WDxK9k31U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727471AbfDUMWB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 21 Apr 2019 08:22:01 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36014 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbfDUMWA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Apr 2019 08:22:00 -0400
Received: by mail-lf1-f65.google.com with SMTP id u17so7139741lfi.3
        for <linux-usb@vger.kernel.org>; Sun, 21 Apr 2019 05:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hWLNxYujShY4KY2E6/o5bqR9UH7qLQqL6HvpDpXjPOk=;
        b=fcUCkjbSPKol4DG3Lp78O7P3eha0fKx+urPqjkObAP4IpL1g4ezy+4Lz1tdOK3fXai
         39KUkbmNXhkPgSI5vz0fHRL3ajfU+8t7TJq8vtxcSptFbdCKsIlS42gsacXH3rrCVX4j
         8imIXODdLqytjjvRT5SWfcz3t3/MGdn3yePzuoBt8buESy6iSEIJl0hvoBRtstNMc0sq
         14a9GqAm55zl+3mXGvyxBn1xHup7P5KVVpYwTO30TOP/ZZMShoGb/U+vBzRGPgDV0BMr
         faLEG2DNHX0dJzseRvixue93/RdgE84xwicgIMHIVLeMssRECsAdW7Et0+0v1GROmr+3
         /Uwg==
X-Gm-Message-State: APjAAAXdkel4WUinOryGkyTui3Hx8vHXjgGva9Ip9epTbAtXy0z+4jKY
        cMAfXjZLv/r+T2Ia2gFqD9br/tWr
X-Google-Smtp-Source: APXvYqy+FexSgeBnaTn7MPeGGIQPTW+2BpPKwqoOCtf08zYM1kyPsPC0esIW1vp6/b7xg0acbC6+cA==
X-Received: by 2002:a19:761a:: with SMTP id c26mr7502137lff.8.1555849318008;
        Sun, 21 Apr 2019 05:21:58 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id r77sm2245050ljb.29.2019.04.21.05.21.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Apr 2019 05:21:55 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@xi.terra>)
        id 1hIBTs-0006tu-CF; Sun, 21 Apr 2019 14:22:00 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/9] USB: serial: cypress_m8: drop unused driver data flag
Date:   Sun, 21 Apr 2019 14:21:48 +0200
Message-Id: <20190421122154.26465-4-johan@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190421122154.26465-1-johan@kernel.org>
References: <20190421122154.26465-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190421122148.p6-SHPOTVottxavI8je7-Q1uzOFgtPIVrYAZYz4Oup4@z>

Drop the isthrottled flag which has never been used.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/cypress_m8.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/serial/cypress_m8.c b/drivers/usb/serial/cypress_m8.c
index ed51bc48eea6..8a06e5ffe644 100644
--- a/drivers/usb/serial/cypress_m8.c
+++ b/drivers/usb/serial/cypress_m8.c
@@ -107,7 +107,6 @@ struct cypress_private {
 	int get_cfg_unsafe;		   /* If true, the CYPRESS_GET_CONFIG is unsafe */
 	int baud_rate;			   /* stores current baud rate in
 					      integer form */
-	int isthrottled;		   /* if throttled, discard reads */
 	char prev_status;		   /* used for TIOCMIWAIT */
 	/* we pass a pointer to this as the argument sent to
 	   cypress_set_termios old_termios */
-- 
2.21.0

