Return-Path: <SRS0=g/Ju=BW=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE1CC433DF
	for <linux-usb@archiver.kernel.org>; Wed, 12 Aug 2020 02:29:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CED972076C
	for <linux-usb@archiver.kernel.org>; Wed, 12 Aug 2020 02:29:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AKUcSaKS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgHLC3m (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 11 Aug 2020 22:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbgHLC3m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Aug 2020 22:29:42 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4694AC061787
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 19:29:41 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id w17so1194776ybl.9
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 19:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=7kb24t9t+2UT9QF6trcnIzylz5AUfXTHeh+iRSA5lxs=;
        b=AKUcSaKSobaoX5zmoQ76o7aqK0kHuajdBECPrrDoILiqK+Nui2Ow50R7p4MzAezUo7
         Xwwhyv/KojLYQdQysAu3YR1Yr+Bp/5qgV+lLNeJJwKZR7QGvJfU9b/nCA7riP8QLq49t
         ukjXkVozELxxRvqX8vD7+A+cvBmqISRPaHcJbAOhosiJd1kvT/X0POOnfJFyuU0km6Wj
         4+J6yl5fV0PHOKcuw4jMl4n1o3rVFGFOq5Ex5wUg4XWI8SWLHkH8pxhtIAmQATJCGiua
         F8fcZjXZDzi7XkU+8tRMSSbEv23PVNlakTVVG02U9S4LgTmxlGfcoQ1rWgRkCf6lhTko
         aEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=7kb24t9t+2UT9QF6trcnIzylz5AUfXTHeh+iRSA5lxs=;
        b=EGjbINlW7l+ZGtS4UN5k1+WKbvXXRbqAvSyt/5de5pu5Ut9KioZcIzshn3kpZeWYS3
         CvWSC3BMuwvak9hvXYWUk7P6R5r5dkU6WWRM0Plb9mM7Qv16YbRUhFCwrtjEZEBbYjX9
         6Ny7fW4YA1nFqRAa8yV59S7QjObHFCIrBZHlsNtilsXFjkdVkv1r06njMNSUHTIs1mzT
         l1fsHHN49FInuMsRoPF6oTCwIAP7hdNgR569RqexxofGZ0oxHkY6W76PTkRBWMGWY35u
         Pw9YSQQJ/bUaPoduaCb84iOO+SA2+hhml7vBhVbQB0d+YbZwpfuJ6ZFWxV+RjfGuQLJn
         lOkQ==
X-Gm-Message-State: AOAM533Cq5Eiz/BXP0mL75fVLpqxYs3m4gOGO3H/Uq/k9Qeu6W3LcICe
        +nfoWvXXDTl2NjYsrYJHs2iSD/eRxj4=
X-Google-Smtp-Source: ABdhPJxPCfFXqPh8VcN+e0QkWWP1l77w1/QEG44qg/HZ2qv3Ez2CpZFKcVLHfoEqCxt91wbUnIt5poZR/S4=
X-Received: by 2002:a5b:451:: with SMTP id s17mr46194749ybp.433.1597199378613;
 Tue, 11 Aug 2020 19:29:38 -0700 (PDT)
Date:   Tue, 11 Aug 2020 19:29:33 -0700
Message-Id: <20200812022934.568134-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
Subject: [PATCH 1/2 v3] tcpm: During PR_SWAP, source caps should be sent only
 after tSwapSourceStart
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From the spec:
"6.6.8.1 SwapSourceStartTimer
The SwapSourceStartTimer Shall be used by the new Source, after a Power
Role Swap or Fast Role Swap, to ensure that it does not send
Source_Capabilities Message before the new Sink is ready to receive the
Source_Capabilities Message. The new Source Shall Not send the
Source_Capabilities Message earlier than tSwapSourceStart after the
last bit of the EOP of GoodCRC Message sent in response to the PS_RDY
Message sent by the new Source indicating that its power supply is
ready."

This fixes TD.PD.CP.E3, TD.PD.CP.E4, TD.PD.CP.E5 failures

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes since V1:
- Comment on the permissible values of tSwapSourceStart

Changes since V2:
- Fixing alignment issue pointed out by Guenter.
- Added Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/usb/typec/tcpm/tcpm.c | 2 +-
 include/linux/usb/pd.h        | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 3ef37202ee37..d38347bd3335 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -3555,7 +3555,7 @@ static void run_state_machine(struct tcpm_port *port)
 		 */
 		tcpm_set_pwr_role(port, TYPEC_SOURCE);
 		tcpm_pd_send_control(port, PD_CTRL_PS_RDY);
-		tcpm_set_state(port, SRC_STARTUP, 0);
+		tcpm_set_state(port, SRC_STARTUP, PD_T_SWAP_SRC_START);
 		break;
 
 	case VCONN_SWAP_ACCEPT:
diff --git a/include/linux/usb/pd.h b/include/linux/usb/pd.h
index b6c233e79bd4..1df895e4680b 100644
--- a/include/linux/usb/pd.h
+++ b/include/linux/usb/pd.h
@@ -473,6 +473,7 @@ static inline unsigned int rdo_max_power(u32 rdo)
 #define PD_T_ERROR_RECOVERY	100	/* minimum 25 is insufficient */
 #define PD_T_SRCSWAPSTDBY      625     /* Maximum of 650ms */
 #define PD_T_NEWSRC            250     /* Maximum of 275ms */
+#define PD_T_SWAP_SRC_START	20	/* Minimum of 20ms */
 
 #define PD_T_DRP_TRY		100	/* 75 - 150 ms */
 #define PD_T_DRP_TRYWAIT	600	/* 400 - 800 ms */
-- 
2.28.0.236.gb10cc79966-goog

