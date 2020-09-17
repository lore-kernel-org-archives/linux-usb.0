Return-Path: <SRS0=L0ZS=C2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37415C433E2
	for <linux-usb@archiver.kernel.org>; Thu, 17 Sep 2020 10:06:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFB882087D
	for <linux-usb@archiver.kernel.org>; Thu, 17 Sep 2020 10:06:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=suse.com header.i=@suse.com header.b="PfA2Cixh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgIQKGd (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:06:33 -0400
Received: from mx2.suse.de ([195.135.220.15]:37600 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726343AbgIQKGa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Sep 2020 06:06:30 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=cantorsusede;
        t=1600337188;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc; bh=MsDbMDupjzvJTNJ0tnARLc/+ZQwcxTlrPvXqBn6NQ6Y=;
        b=PfA2Cixh2//H8Sg6u5j/cvCcqwvn//ZMh/w/sfHZmkMad+vwPPeBvQ2o+7so3akhMDL/2w
        aG6cETCRJv4i/mUxUfIu72Pb34oqRzXBTxiNMc2G6f75ere4NThoq7B50+65a3bitVmKGa
        2AxgA2tzJM+2GrcgXRAeobLRMkr8iXlrGHQBRQDU410wgRffiZYizdmwJ8K/JbZSuB0b0I
        AgtZ45iVEqG6gTaq+abwDwC1LN6bckYrH1+51sSYp2dRQzmbnMoFq695JemG/X7xCs2shy
        AwdClnj6ikiyUcH5pTH867b9ssdbUyt0e4AueMDUcPj2OX9Q3rccJU+pjy5qIg==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 5198CACDB;
        Thu, 17 Sep 2020 10:07:02 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Subject: [RFC] fix CDC-WDM in multithreaded environment and improve
Date:   Thu, 17 Sep 2020 12:06:07 +0200
Message-Id: <20200917100614.1010-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This set of patches fixes errors seen in multithreaded environments and
improves error reporting greatly

