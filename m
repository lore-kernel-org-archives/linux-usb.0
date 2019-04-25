Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569E1C43218
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 16:06:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 968CB20891
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 16:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556208362;
	bh=q5oTloo8n57JboEbLhjDarnBlb5BPUV8Le0ofFfwM9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=w3piT3T6tUpQe0kYgvYrWEdZ6xzHVAn3L+Bw5MNNYui6QnVyt9lYoA8/ApVze6H5h
	 sB5gkzdqkWeqG6ogjAOFpaf+dPJFapPTjlCgi/mHj4kF2CA2j5zarBcSvTtNgNcvFi
	 3SmqNlbmYzDkh46ZrcbWGCr77nyxw3BjQwxDyMnU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbfDYQGB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 12:06:01 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44861 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbfDYQGA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 12:06:00 -0400
Received: by mail-lf1-f66.google.com with SMTP id h18so45242lfj.11
        for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2019 09:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZuYnVLOOM0aJRCaFJiR4GrjUKAaf0bn66ZhgVFINsqE=;
        b=pC1xuosFLUpAjbS1EENjD03/GznnyOsQ8d5aFhrvHPYqI+Jc1tLwmPSjvJfpuLp9S5
         oSY6VF3uZZqe19ggmI6HaGGmLPOcI3WUH1CsPIn48fVr99f3WeVcFS+zMTD83BxiJuyO
         cT/0WBSUd1M6ay2iXBSz+RfKpeB8OIrc3Bu9HfTNQQfqCyxBjTuW/XIRL1XBZd2iAzl8
         xokvu9Jwzxd2hQl4LFNyhUx//U8pHRHMA91roomhAmpk08wgQ+q6F6WrvG5PZTTEvB66
         QrtKnUQeqKHwIupRBamfgbFtXipgwZ99aeEtKsKHqxLtTdXlEb2aOm//h/KuvKDfdN0a
         KVBA==
X-Gm-Message-State: APjAAAXdrtJ9u7JzRNFrMlVXyihF5pdnNUqucUOftnj21dZnoKdgPpin
        kpRyWB2X/KluBuGFtFsKd/K/UDZM
X-Google-Smtp-Source: APXvYqwrzhfF9xymPgYHOsRbKaoA5s/hComJ3EuheyA6GB3VTh5SiWmnyy2bQrEIqH/Mrd0cggyYlw==
X-Received: by 2002:ac2:43d8:: with SMTP id u24mr21373588lfl.94.1556208358530;
        Thu, 25 Apr 2019 09:05:58 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id m24sm1056237ljb.67.2019.04.25.09.05.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Apr 2019 09:05:56 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@xi.terra>)
        id 1hJgsl-0002ct-Or; Thu, 25 Apr 2019 18:05:55 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/5] USB: serial: generic: drop unnecessary goto
Date:   Thu, 25 Apr 2019 18:05:38 +0200
Message-Id: <20190425160540.10036-4-johan@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190425160540.10036-1-johan@kernel.org>
References: <20190425160540.10036-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190425160538.kbsoAVgEI-weD7WshElVMM-G5F974AiRy2feUef2Wq0@z>

Drop an unnecessary goto from a write-urb completion error path.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/generic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/serial/generic.c b/drivers/usb/serial/generic.c
index 67cef3ef1e5f..1be8bea372a2 100644
--- a/drivers/usb/serial/generic.c
+++ b/drivers/usb/serial/generic.c
@@ -463,10 +463,9 @@ void usb_serial_generic_write_bulk_callback(struct urb *urb)
 	default:
 		dev_err_console(port, "%s - nonzero urb status: %d\n",
 							__func__, status);
-		goto resubmit;
+		break;
 	}
 
-resubmit:
 	usb_serial_generic_write_start(port, GFP_ATOMIC);
 	usb_serial_port_softint(port);
 }
-- 
2.21.0

