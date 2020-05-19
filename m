Return-Path: <SRS0=qnfn=7B=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F7BC433E0
	for <linux-usb@archiver.kernel.org>; Tue, 19 May 2020 15:39:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A6F3207D8
	for <linux-usb@archiver.kernel.org>; Tue, 19 May 2020 15:39:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728994AbgESPjy (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 19 May 2020 11:39:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:52068 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728633AbgESPjy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 May 2020 11:39:54 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 39292ADFF;
        Tue, 19 May 2020 15:39:56 +0000 (UTC)
Message-ID: <1589902789.6470.8.camel@suse.com>
Subject: question on tty_operations->flush_char()
From:   Oliver Neukum <oneukum@suse.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Date:   Tue, 19 May 2020 17:39:49 +0200
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

is the flush_char() opertion of tty_operations allowed to sleep?

	Regards
		Oliver

