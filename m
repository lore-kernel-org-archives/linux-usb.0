Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BD2C433E0
	for <linux-usb@archiver.kernel.org>; Thu, 21 Jan 2021 12:59:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24C0E239FF
	for <linux-usb@archiver.kernel.org>; Thu, 21 Jan 2021 12:59:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729453AbhAUM6o (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 21 Jan 2021 07:58:44 -0500
Received: from mx2.suse.de ([195.135.220.15]:59704 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731510AbhAUM63 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Jan 2021 07:58:29 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1611233861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=1Od529HWIMsqhULGV/TQT6oCylsfsSs1ynCwBlqmtzg=;
        b=Zkk8e/cKQOEd4EnNXzQYC/AnjKKTiy27QQL8GowdNqDTgEe/eRWvcaIpGoVUPkK+clTy52
        buOujdutTI5h74vdSyPe/jQ8PgHfoZexUK6dFoZE6WB449a8DeNwyck0Y3y4dckDKmIA8b
        nym77541eJpFlDJQS2dAYQbBcvEY6OU=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 685F3AC85;
        Thu, 21 Jan 2021 12:57:41 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     hayeswang@realtek.com, grundler@chromium.org, davem@davemloft.net,
        netdev@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCHv2 0/3] usbnet: speed reporting for devices without MDIO
Date:   Thu, 21 Jan 2021 13:57:28 +0100
Message-Id: <20210121125731.19425-1-oneukum@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series introduces support for USB network devices that report
speed as a part of their protocol, not emulating an MII to be accessed
over MDIO.

v2: adjusted to recent changes


