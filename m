Return-Path: <SRS0=OS/M=ZG=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635CBC432C3
	for <linux-usb@archiver.kernel.org>; Thu, 14 Nov 2019 11:28:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3D7EA206DC
	for <linux-usb@archiver.kernel.org>; Thu, 14 Nov 2019 11:28:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbfKNL2J (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 14 Nov 2019 06:28:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:52698 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726613AbfKNL2J (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 Nov 2019 06:28:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 93EDEB20F;
        Thu, 14 Nov 2019 11:28:08 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: cleanup capacity flag handling in UAS
Date:   Thu, 14 Nov 2019 12:27:55 +0100
Message-Id: <20191114112758.32747-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series intends to bring UAS up to storage in terms
of handling flags for capacity quirks as far as that is applicable.
In addition it documents which driver handles which flag.

