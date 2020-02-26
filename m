Return-Path: <SRS0=qKei=4O=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80204C4BA24
	for <linux-usb@archiver.kernel.org>; Wed, 26 Feb 2020 18:48:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 511C520714
	for <linux-usb@archiver.kernel.org>; Wed, 26 Feb 2020 18:48:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JSbBnzy7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbgBZSs1 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 26 Feb 2020 13:48:27 -0500
Received: from mail-wm1-f74.google.com ([209.85.128.74]:35223 "EHLO
        mail-wm1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727323AbgBZSsY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Feb 2020 13:48:24 -0500
Received: by mail-wm1-f74.google.com with SMTP id z7so55681wmi.0
        for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2020 10:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=GUzRbTx+9+5SLlU+YVj83grWFXbPGAYyGcx3oLf377g=;
        b=JSbBnzy73DD7ilHDWTFrjHWPxRL7qMXhCBn/ySAMownKsqRDhzchskO8xsrPstrHmU
         7hbYdvKkxGKY64y17R2D0sCyYJS97SlynEXUWo9kcZ2s1U6RnVUVAvtiSm9LJyeqcS28
         gDjmCKR3o3dQoLoI9V/DGjM23yTRJ2WZEq2rwf7GIh/sjMsmJLqT1Lzns1pCU7Eh6VN7
         0egGzWbctmv/nxkmUStAHcDTVvEMkg9KxCZGkwQtqxwY3WZ90B16QfBlliEhPh5ALjn4
         ObyBYLTt1rSpfvp+CyeQpsNQgBNwLgnKWznE18PjeO/LJ5v5C1Yu8jaNW1CH1JnjGaD5
         3egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=GUzRbTx+9+5SLlU+YVj83grWFXbPGAYyGcx3oLf377g=;
        b=gL1nA3VONtjH+OuTeTRdmLXoFdH3+MGVmq6Xy4trPFTu1a9Y7PHEP5eDjyb14n7pQN
         ccZPvLrk7i+WlJmrzACe7d8k44pxrhP4CFjPUQ1PB2KDwstHQDkMIuLIFgYAKSOVO44y
         65KbEA1pmBwLqNYEyzp/Gis8SQdsGLRDypqS/MYAZSsxgROMa4bVeIayzLZ48pNdxuf1
         YjUmyvu/SJNeZtgMXcmo5iqeYzGbW8bS0WiQ1eUZ+FR5RNZRC4SF6NNXNxXOAnR6wAFx
         9ncX1xCA0rWi95tU+JyOAtf8T3QblI1gdU9aLQQAJ9t50irJlcP6xLYU+o1XcA4yNkBI
         ETuQ==
X-Gm-Message-State: APjAAAXyT2yf6LXECvX2C+yoFIuV9KaFJxL0345fV6m5f3WgcVC3UG0C
        tubpjt1CFfuV6cLgSYLir5PCViOK4PSjQLUj
X-Google-Smtp-Source: APXvYqy+464jcwq7XNRH9yunMmB1w1Y35nJInpXA1U7aPORosC3hZ+1ZSK+jy5xDoiJde55La6FlNSHVBCJ5D74Q
X-Received: by 2002:adf:eac1:: with SMTP id o1mr48952wrn.234.1582742902870;
 Wed, 26 Feb 2020 10:48:22 -0800 (PST)
Date:   Wed, 26 Feb 2020 19:48:09 +0100
In-Reply-To: <cover.1582742673.git.andreyknvl@google.com>
Message-Id: <d440a200cc1a3faddfd429467ac42841ee002bbc.1582742673.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1582742673.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH v1 3/3] usb: core: kcov: collect coverage from usb complete callback
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds kcov_remote_start/stop() callbacks around the urb
complete() callback that is executed in softirq context when dummy_hcd
is in use. As the result, kcov can be used to collect coverage from those
those callbacks, which is used to facilitate coverage-guided fuzzing with
syzkaller.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 drivers/usb/core/hcd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index aa45840d8273..de624c47e190 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -31,6 +31,7 @@
 #include <linux/types.h>
 #include <linux/genalloc.h>
 #include <linux/io.h>
+#include <linux/kcov.h>
 
 #include <linux/phy/phy.h>
 #include <linux/usb.h>
@@ -1645,7 +1646,9 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
 
 	/* pass ownership to the completion handler */
 	urb->status = status;
+	kcov_remote_start_usb((u64)urb->dev->bus->busnum);
 	urb->complete(urb);
+	kcov_remote_stop();
 
 	usb_anchor_resume_wakeups(anchor);
 	atomic_dec(&urb->use_count);
-- 
2.25.1.481.gfbce0eb801-goog

