Return-Path: <SRS0=2rsX=2B=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F2BC43603
	for <linux-usb@archiver.kernel.org>; Wed, 11 Dec 2019 15:24:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25F392465A
	for <linux-usb@archiver.kernel.org>; Wed, 11 Dec 2019 15:24:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732862AbfLKPYh (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 11 Dec 2019 10:24:37 -0500
Received: from mx2.suse.de ([195.135.220.15]:58498 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732644AbfLKPYg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Dec 2019 10:24:36 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id CDBCCAD6B
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2019 15:24:34 +0000 (UTC)
Message-ID: <1576077871.23599.4.camel@suse.com>
Subject: status of support for Media Agnostic USB
From:   Oliver Neukum <oneukum@suse.com>
To:     linux-usb@vger.kernel.org
Date:   Wed, 11 Dec 2019 16:24:31 +0100
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I recently hit upon some old patches for MA USB on the list.
It looks like the discussion never went far. Is there anybody
still interested in them? It looks like Windows 10 finally supports it
and we are missing a feature.

	Regards
		Oliver

