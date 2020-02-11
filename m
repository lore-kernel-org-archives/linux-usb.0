Return-Path: <SRS0=9l+J=37=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96325C352A3
	for <linux-usb@archiver.kernel.org>; Tue, 11 Feb 2020 13:25:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6633620848
	for <linux-usb@archiver.kernel.org>; Tue, 11 Feb 2020 13:25:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729070AbgBKNZX (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 11 Feb 2020 08:25:23 -0500
Received: from mx2.suse.de ([195.135.220.15]:41324 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728427AbgBKNZX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Feb 2020 08:25:23 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 7CA73AF96
        for <linux-usb@vger.kernel.org>; Tue, 11 Feb 2020 13:25:22 +0000 (UTC)
Message-ID: <1581427518.1580.3.camel@suse.de>
Subject: No PNP0CA0 device on a Dell Precision 5520 laptop
From:   Oliver Neukum <oneukum@suse.de>
To:     linux-usb@vger.kernel.org
Date:   Tue, 11 Feb 2020 14:25:18 +0100
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I just not getting ucsi_acpi to bind on this laptop.
There just is no PNP0CA0 device. Any idea about what I am doing wrong?

	Regards
		Oliver

