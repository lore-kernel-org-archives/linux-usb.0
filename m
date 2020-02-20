Return-Path: <SRS0=6QSm=4I=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B20F4C11D04
	for <linux-usb@archiver.kernel.org>; Thu, 20 Feb 2020 09:46:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9234924656
	for <linux-usb@archiver.kernel.org>; Thu, 20 Feb 2020 09:46:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgBTJqv (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 20 Feb 2020 04:46:51 -0500
Received: from mx2.suse.de ([195.135.220.15]:50332 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726637AbgBTJqv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Feb 2020 04:46:51 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 3C0F0AE4E;
        Thu, 20 Feb 2020 09:46:50 +0000 (UTC)
Message-ID: <1582192003.6843.7.camel@suse.com>
Subject: Re: usb cdc-acm TIOCSSERIAL may wrongly report EPERM
From:   Oliver Neukum <oneukum@suse.com>
To:     Anthony Mallet <anthony.mallet@laas.fr>
Cc:     linux-usb@vger.kernel.org
Date:   Thu, 20 Feb 2020 10:46:43 +0100
In-Reply-To: <24141.6739.313167.448875@beetle.laas.fr>
References: <24140.5498.228141.264272@beetle.laas.fr>
         <1582106185.9787.9.camel@suse.com>
         <24141.6739.313167.448875@beetle.laas.fr>
Content-Type: text/plain
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


