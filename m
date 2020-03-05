Return-Path: <SRS0=fa6C=4W=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BCBC3F2D1
	for <linux-usb@archiver.kernel.org>; Thu,  5 Mar 2020 10:34:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B5F72073D
	for <linux-usb@archiver.kernel.org>; Thu,  5 Mar 2020 10:34:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbgCEKek (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 5 Mar 2020 05:34:40 -0500
Received: from mx2.suse.de ([195.135.220.15]:40048 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbgCEKek (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Mar 2020 05:34:40 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id C1173AE89;
        Thu,  5 Mar 2020 10:34:38 +0000 (UTC)
Message-ID: <1583404463.12738.31.camel@suse.com>
Subject: Re: [PATCH 1/2] USB: cdc-acm: fix close_delay and closing_wait
 units in TIOCSSERIAL
From:   Oliver Neukum <oneukum@suse.com>
To:     Anthony Mallet <anthony.mallet@laas.fr>, linux-usb@vger.kernel.org
Date:   Thu, 05 Mar 2020 11:34:23 +0100
In-Reply-To: <24160.54083.771390.513782@beetle.laas.fr>
References: <24160.54083.771390.513782@beetle.laas.fr>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 05.03.2020, 11:24 +0100 schrieb Anthony Mallet:
> close_delay and closing_wait are specified in hundredth of a second but stored
> internally in jiffies. Use the jiffies_to_msecs() and msecs_to_jiffies()
> functions to convert from each other.
> 
> Signed-off-by: Anthony Mallet <anthony.mallet@laas.fr>
Acked-by: Oliver Neukum <oneukum@suse.com>
