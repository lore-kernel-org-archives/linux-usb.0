Return-Path: <SRS0=ivde=YC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 123BBC47404
	for <linux-usb@archiver.kernel.org>; Wed,  9 Oct 2019 17:09:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CA1D520B7C
	for <linux-usb@archiver.kernel.org>; Wed,  9 Oct 2019 17:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570640988;
	bh=tG3TyHP5E1sZotu8nYHFd6nV3IuBECpW5MA9R+gjRfw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=DcxbwU5rtM6hZ6pAxBnAmkWTsHTbWCfmhI1nI7HnxwLAd2YbPGCtE+tmBI5M9zfJ8
	 vXsSlphFS797mUSGk4DNDOeMfGcUVIMOSg0VOxSJHlRwCfCNHL15SZ1+i5IkJ/icgv
	 wMx/PYqbCb+bFpixGp6OYf4Rz5nwqWYSzK4hmPSI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731894AbfJIRJr (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 9 Oct 2019 13:09:47 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42856 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730490AbfJIRJr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 13:09:47 -0400
Received: by mail-lf1-f66.google.com with SMTP id c195so2216534lfg.9
        for <linux-usb@vger.kernel.org>; Wed, 09 Oct 2019 10:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=53aiIY4OLOQeb8041yaU2CTe92uW8YD2bs3dJXD1Nm0=;
        b=aEkZ97F2Lj/YBw59VA7aCF4lkQSJpCS3C+hWlxpIuB9wo89w+dakCUNFl32sL1FGzP
         YXlAH2t4xpy2+wNB30rSNijSw7fOMAJ1ozYNr3AA4IiYMtUqJhSEEnlhF+KaEdZk0/KG
         slCVckMEs5PdfxYJL0+IBFqWKoLVTH7CvI3Vxa9nj8cWfzJC1nvk69JzoMEJpY6FC6SW
         oWfxPjvzGCciu1kSF3zCuJ3oTqgv8E6oxUgAiHgVfkJF56N4EJfi7879Es/Vjbay2f9d
         slrtCGFFBjj+Tf81skQaUXgP+sed6c5XbCtg+VB/ebOWbwKQqpHEO0En1Y0qsQS1wOP3
         EMRQ==
X-Gm-Message-State: APjAAAWWAwNCsuy2PC7+fEGIjAlMvT643trXUVuYufFkohpGVc/jxClX
        cvdrMkyvu1cCw7WS6qYWX0c=
X-Google-Smtp-Source: APXvYqxZspOX8iLzYzDI3hYYhdJfbOq5z3j4v8VptptOUlfzw8f4yibdiTd2w3IMJK/KDMkgiZ1fLA==
X-Received: by 2002:ac2:5c4b:: with SMTP id s11mr2825831lfp.18.1570640985457;
        Wed, 09 Oct 2019 10:09:45 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id w17sm595907lfl.43.2019.10.09.10.09.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 10:09:42 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iIFTF-0007pv-3y; Wed, 09 Oct 2019 19:09:53 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/3] USB: usb-skeleton: fix use-after-free after driver unbind
Date:   Wed,  9 Oct 2019 19:09:43 +0200
Message-Id: <20191009170944.30057-3-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191009170944.30057-1-johan@kernel.org>
References: <20191009170944.30057-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver failed to stop its read URB on disconnect, something which
could lead to a use-after-free in the completion handler after driver
unbind in case the character device has been closed.

Fixes: e7389cc9a7ff ("USB: skel_read really sucks royally")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/usb-skeleton.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/usb-skeleton.c b/drivers/usb/usb-skeleton.c
index c2843fcfa52d..be311787403e 100644
--- a/drivers/usb/usb-skeleton.c
+++ b/drivers/usb/usb-skeleton.c
@@ -575,6 +575,7 @@ static void skel_disconnect(struct usb_interface *interface)
 	dev->disconnected = 1;
 	mutex_unlock(&dev->io_mutex);
 
+	usb_kill_urb(dev->bulk_in_urb);
 	usb_kill_anchored_urbs(&dev->submitted);
 
 	/* decrement our usage count */
-- 
2.23.0

