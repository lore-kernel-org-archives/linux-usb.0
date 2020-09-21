Return-Path: <SRS0=kiWP=C6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F3CC43463
	for <linux-usb@archiver.kernel.org>; Mon, 21 Sep 2020 11:37:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AF2720EDD
	for <linux-usb@archiver.kernel.org>; Mon, 21 Sep 2020 11:37:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="oAAjjorU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbgIULhz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 21 Sep 2020 07:37:55 -0400
Received: from mx2.suse.de ([195.135.220.15]:45670 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726444AbgIULhz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Sep 2020 07:37:55 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600688274;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc; bh=9jj1a7Y5iuO2Fuapz8cb4doylCc1dEU/JUi2sG59fQE=;
        b=oAAjjorUCZbey8mueh2Imrg7GceSs7HdX3AFs4zZs0Ag3MM+h8OHJ5fvNJLL3q8NCCpGVS
        uHM7rKem7IrX7CAXQdJR7BEb7BCjoo39GSmv3UUc6tANmHUCwmmy5FGodOTW254fb6UP0e
        S9b6uRQsJkV1maXQrnbs4l4cL/AjPaM=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 2B6C4ACC2;
        Mon, 21 Sep 2020 11:38:30 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     keithp@keithp.com, linux-usb@vger.kernel.org
Subject: [RFT] implementation of O_NONBLOCK for chaoskey 
Date:   Mon, 21 Sep 2020 13:37:28 +0200
Message-Id: <20200921113732.11524-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This should implement O_NONBLOCK for chaoskey devices, but I need
a tester.

