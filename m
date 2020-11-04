Return-Path: <SRS0=Q74q=EK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E01EC388F9
	for <linux-usb@archiver.kernel.org>; Wed,  4 Nov 2020 16:48:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B1D6206CA
	for <linux-usb@archiver.kernel.org>; Wed,  4 Nov 2020 16:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604508537;
	bh=ADDN6DsGE/gZ/+s4uwypL7nna9X+zkn9j5t1bsvpSYk=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=Y8XJjKjcb/yMMCG7vLm3nnBeDSDG3NUkzpxOMe2mmOHZYWvyJJsRD2OHoCRJZHU2O
	 m4eSuMzfs1Fk9nk3S4sWrkofywc6o1oT+HiIdqbqENXvT98FH8fgDXZDTkFz1zxFIA
	 iA6fa93bMclis68LzuDUC1m96yIz1tzsWVgtj6os=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731351AbgKDQsx (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 4 Nov 2020 11:48:53 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40711 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728986AbgKDQsx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Nov 2020 11:48:53 -0500
Received: by mail-lf1-f68.google.com with SMTP id e27so5157750lfn.7;
        Wed, 04 Nov 2020 08:48:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=re+vkNaV2IqjWLvWTPODjB+TaAeDQ2wT/vcW13BpaME=;
        b=hZgf1e/JBLQ+7uV5maGFzSLIT+XSMPvNazHtC+O1xqTEk/IQmvbsz3rKJP2JaxYffU
         EVrvigq7sHxZCvEBnJayW7UGHlr0IVoBGo3tLkMCZntgOZtPrDOZzY4OeD4RVQU2H12b
         kHwpiXiBvzDgvl6eQIIUzHLLQASteX29wXy1iYsHuFPYIhmytFLizfnwllTUS27AyNX2
         b+QiQhXRV8poTZMKhmqElW/JCbN6hKtNZvBPzALUfNQAeSd25sKbOqAoJK+8/gp+KMcB
         UbbrwVSdsip2f438bDuKGB2VRPfrtrpqzwTcAIbl4NKPb1B1tqM7u/Pri15EGT6tuLko
         9IzA==
X-Gm-Message-State: AOAM533I9AJaTecfZjJWXkSZm1fCvA+6nXQsdWiR+7G6supFZo9xWGst
        ocSe7SknoTqCKpNkZTmb/g05MC7yMOnYcA==
X-Google-Smtp-Source: ABdhPJyFhRIgQ3n36N/ci6UZOj02hZ7KVRNUZCAsNwUfwnbWw2KB5ijNn73AuDv5Kvhn7VnHmrRucw==
X-Received: by 2002:a19:c80a:: with SMTP id y10mr10860686lff.329.1604508530318;
        Wed, 04 Nov 2020 08:48:50 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id x4sm563021ljj.62.2020.11.04.08.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 08:48:49 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kaLxu-0006sC-BR; Wed, 04 Nov 2020 17:48:54 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Davidlohr Bueso <dave@stgolabs.net>, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        stable <stable@vger.kernel.org>
Subject: [PATCH] USB: serial: mos7720: fix parallel-port state restore
Date:   Wed,  4 Nov 2020 17:47:27 +0100
Message-Id: <20201104164727.26351-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The parallel-port restore operations is called when a driver claims the
port and is supposed to restore the provided state (e.g. saved when
releasing the port).

Fixes: b69578df7e98 ("USB: usbserial: mos7720: add support for parallel port on moschip 7715")
Cc: stable <stable@vger.kernel.org>     # 2.6.35
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/mos7720.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/mos7720.c b/drivers/usb/serial/mos7720.c
index 5eed1078fac8..5a5d2a95070e 100644
--- a/drivers/usb/serial/mos7720.c
+++ b/drivers/usb/serial/mos7720.c
@@ -639,6 +639,8 @@ static void parport_mos7715_restore_state(struct parport *pp,
 		spin_unlock(&release_lock);
 		return;
 	}
+	mos_parport->shadowDCR = s->u.pc.ctr;
+	mos_parport->shadowECR = s->u.pc.ecr;
 	write_parport_reg_nonblock(mos_parport, MOS7720_DCR,
 				   mos_parport->shadowDCR);
 	write_parport_reg_nonblock(mos_parport, MOS7720_ECR,
-- 
2.26.2

