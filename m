Return-Path: <SRS0=73Qb=5L=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B01C2D0E8
	for <linux-usb@archiver.kernel.org>; Thu, 26 Mar 2020 14:44:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3003121473
	for <linux-usb@archiver.kernel.org>; Thu, 26 Mar 2020 14:44:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KEoRpVSk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbgCZOo2 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 26 Mar 2020 10:44:28 -0400
Received: from mail-wm1-f73.google.com ([209.85.128.73]:59092 "EHLO
        mail-wm1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728076AbgCZOo1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 10:44:27 -0400
Received: by mail-wm1-f73.google.com with SMTP id f185so2243192wmf.8
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2020 07:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=54OrhN2UqwV2UhsoJvUHxfQ1kDDVGkOr4MVVzi//0Tk=;
        b=KEoRpVSkWQ4Obk49T2NiJnX5YvJMnj3y3LgQFqwTA1oA/83D5qT2cj2EfHEHsE9J9N
         TGuPaMZhafTcNM2K42DypQ9gbY6yTkkybsVnR7xLkhU9pHHROVFcwmDaPTza1GJSb0Ge
         jIBdCY+tA7V4j/NBfsV7OiyhebX2WU7ix8oHpnagMsExk9Xz2MSTQMmejmAXrN46h4ou
         2MCeDPUyX+0nufKlwrQHFC/N9N5EMdo+taW4rpwKj4eqVQN8gBpULoizs44b8hyuubVq
         N0f3TwMFhuPbRKhHGF92OZfLfthHUhlLrD2vyPHVBft52EyJiVRYcAaCdmFbyHz8NxP2
         KJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=54OrhN2UqwV2UhsoJvUHxfQ1kDDVGkOr4MVVzi//0Tk=;
        b=aUnCXNue9di7tZ65flLi0pL0W1gsX1vE88PfDlTC9puRSv9W+tvX2tK8aGqsmRyk7U
         mCXFUSPtrSiTLCdbeciLknPy9H88k6yYwJqRD/9yqwmaJVXXPaqdOZc192vYjDmScciC
         oLV5y9tUV+NuLfkNeznU9NjnPNw0LE662oueeXz1MifedToltLIxP1m+YeAXSThyXGvr
         j7KtXHS9YTV1EgAdZd+bZe1BXCYPkkygO0e7SmpMPrIvhgQw16LqsRpIp00AdOd+Qz1D
         EwpkMZj9nCIvZRGCTnMSAFA6V/TDb0upgKY45zF6KO4XN3NY+Yy4IjWS3HyMwf4cExJM
         mqRQ==
X-Gm-Message-State: ANhLgQ0e5uyEKQzQXrrnhMAzmXZJMyZLrcIQM3agbT/nckiO9dCdwXO5
        PtkDMnpTk1jfgnF3havGTmPqOg1sjf6Pur2F
X-Google-Smtp-Source: ADFU+vvlT13Jzs850JgMlpxi2djO8UDTtjaMsAWeLvetR7iUup932A5Lrxp2uoQCpabpVD2nkeGM/35wY/4GBFEl
X-Received: by 2002:adf:bc4a:: with SMTP id a10mr9594715wrh.7.1585233865501;
 Thu, 26 Mar 2020 07:44:25 -0700 (PDT)
Date:   Thu, 26 Mar 2020 15:44:03 +0100
In-Reply-To: <cover.1585233617.git.andreyknvl@google.com>
Message-Id: <5889efe35e0b300e69dba97216b1288d9c2428a8.1585233617.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1585233617.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: [PATCH v4 4/7] kcov: move t->kcov_sequence assignment
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Move t->kcov_sequence assignment before assigning t->kcov_mode
for consistency.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 kernel/kcov.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index 888d0a236b04..b985b7a72870 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -318,10 +318,10 @@ static void kcov_start(struct task_struct *t, struct kcov *kcov,
 	/* Cache in task struct for performance. */
 	t->kcov_size = size;
 	t->kcov_area = area;
+	t->kcov_sequence = sequence;
 	/* See comment in check_kcov_mode(). */
 	barrier();
 	WRITE_ONCE(t->kcov_mode, mode);
-	t->kcov_sequence = sequence;
 }
 
 static void kcov_stop(struct task_struct *t)
-- 
2.26.0.rc2.310.g2932bb562d-goog

