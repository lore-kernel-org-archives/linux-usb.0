Return-Path: <SRS0=f8IS=7W=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C311EC433E0
	for <linux-usb@archiver.kernel.org>; Tue,  9 Jun 2020 00:40:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B4F020774
	for <linux-usb@archiver.kernel.org>; Tue,  9 Jun 2020 00:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591663207;
	bh=GEA4IjvLRi7gw0Nasy7++m5sOVhUCYZZnwHVEk9o+c4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Qg4w3P13gwrW16nVhMyw/4Bz4p0yLE3Xw/4iWh8OMHOoyHZLOR7FmRiOSmxr1bpri
	 OamvLV4hRlcbwgAicbO8OoUzfTe6Bjd6gdXHCN638QwVpw0V2NWMRZ4LgnJ8UG8Zxd
	 Y7atCuIUC9psDQ6IMtfmwoqdyMDAlqeQh8lRV5tE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729547AbgFIAjv (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 8 Jun 2020 20:39:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:32930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729268AbgFHXNP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Jun 2020 19:13:15 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3EB8C214F1;
        Mon,  8 Jun 2020 23:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591657993;
        bh=GEA4IjvLRi7gw0Nasy7++m5sOVhUCYZZnwHVEk9o+c4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jkBcXv5ecONS9no3OnbqyWOxM58657KLcuT0Mdd/11t4dEZDUtDdYDkLPMMcm1xSV
         snWlsz5U3ywu7GDwcxiAyAxBREXWvNYilHNS1uNC08VQ2LtvW9GQa2WHKvnxYSFaeG
         fnmN60wz4qVt7Gl4GerbBJGs+o3n49Y98hhM6EkI=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Peter Chen <peter.chen@nxp.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 051/606] usb: gadget: audio: Fix a missing error return value in audio_bind()
Date:   Mon,  8 Jun 2020 19:02:56 -0400
Message-Id: <20200608231211.3363633-51-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

commit 19b94c1f9c9a16d41a8de3ccbdb8536cf1aecdbf upstream.

If 'usb_otg_descriptor_alloc()' fails, we must return an error code, not 0.

Fixes: 56023ce0fd70 ("usb: gadget: audio: allocate and init otg descriptor by otg capabilities")
Reviewed-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/gadget/legacy/audio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/audio.c b/drivers/usb/gadget/legacy/audio.c
index dd81fd538cb8..a748ed0842e8 100644
--- a/drivers/usb/gadget/legacy/audio.c
+++ b/drivers/usb/gadget/legacy/audio.c
@@ -300,8 +300,10 @@ static int audio_bind(struct usb_composite_dev *cdev)
 		struct usb_descriptor_header *usb_desc;
 
 		usb_desc = usb_otg_descriptor_alloc(cdev->gadget);
-		if (!usb_desc)
+		if (!usb_desc) {
+			status = -ENOMEM;
 			goto fail;
+		}
 		usb_otg_descriptor_init(cdev->gadget, usb_desc);
 		otg_desc[0] = usb_desc;
 		otg_desc[1] = NULL;
-- 
2.25.1

