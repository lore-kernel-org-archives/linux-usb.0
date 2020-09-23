Return-Path: <SRS0=WBK0=DA=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52455C2D0A8
	for <linux-usb@archiver.kernel.org>; Wed, 23 Sep 2020 13:44:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 038B821BE5
	for <linux-usb@archiver.kernel.org>; Wed, 23 Sep 2020 13:44:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="hV6MIP05"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgIWNoR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 23 Sep 2020 09:44:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:33188 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726504AbgIWNoR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Sep 2020 09:44:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600868655;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=Vp+AggbaglyL2+1rFNmOeKTVtLWHnLk/Qz724OONFaY=;
        b=hV6MIP05SphGepJ5rY8zCyqCWueR/326Ck1iy4trkq0OXHAoW8OiEgwoz5r0Rm8+KYofK3
        8+/obybVJnHYnqCguu3U0HE0K8boIBmueIutv5l7qiAavj7UZELepMTQNCYu3ToKEBFJQO
        VgxsGsWpRXY3a/pF8kbVguASvULum+M=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 1CC0EB1AB;
        Wed, 23 Sep 2020 13:44:53 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     himadrispandya@gmail.com, gregKH@linuxfoundation.org,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC] change the new message to provide for memory allocations 
Date:   Wed, 23 Sep 2020 15:43:34 +0200
Message-Id: <20200923134348.23862-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Control messages have to work in situtaions where you need to
use GFP_NOIO. Hence wrappers for them that allocate memory must have
an API that allows for that.

Signed-off-by: Oliver Neukum <oneukum@suse.com>

