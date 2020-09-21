Return-Path: <SRS0=kiWP=C6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC66C43464
	for <linux-usb@archiver.kernel.org>; Mon, 21 Sep 2020 11:21:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4A3B20874
	for <linux-usb@archiver.kernel.org>; Mon, 21 Sep 2020 11:21:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="m6bPT/3e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgIULVP (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 21 Sep 2020 07:21:15 -0400
Received: from mx2.suse.de ([195.135.220.15]:58030 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726367AbgIULVP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Sep 2020 07:21:15 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600687274;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc; bh=sDFURi1RhbCT2Z41loIIrpATc9+kD7THHRZt9+e47N8=;
        b=m6bPT/3e8PDlOTbIJqxqNsLut+WXcj6VV6+G6N/iXx/zap6+jTkQeggVvhfKA09lDiFmxa
        oANpEdMxHGlM+qMsdb+Wp8SqqpRdsWAKgDkJ4HKmsxhY7S4MNBvYHEYCPChXCN86O2CSN6
        +HOPDG2f4J+PJJErJphSYt8CAOJ8NXQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 251F5B18D;
        Mon, 21 Sep 2020 11:21:50 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Subject: [RFC]fix races in and improve CDC-WDM
Date:   Mon, 21 Sep 2020 13:20:44 +0200
Message-Id: <20200921112052.27943-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Tests in multithreaded environments and a thorough review have
shown hangs and other issues in the driver

This version introduces nicer locking

