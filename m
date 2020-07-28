Return-Path: <SRS0=lntN=BH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A56C433E1
	for <linux-usb@archiver.kernel.org>; Tue, 28 Jul 2020 08:47:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D161420838
	for <linux-usb@archiver.kernel.org>; Tue, 28 Jul 2020 08:47:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728296AbgG1IrW (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 28 Jul 2020 04:47:22 -0400
Received: from mx2.suse.de ([195.135.220.15]:53384 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728176AbgG1IrV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Jul 2020 04:47:21 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 7E1F1ACF2;
        Tue, 28 Jul 2020 08:47:31 +0000 (UTC)
Message-ID: <1595926030.24221.2.camel@suse.de>
Subject: Re: USB ports on Thunderbolt dock stop working after few seconds
From:   Oliver Neukum <oneukum@suse.de>
To:     Mayur Virkar <mayurvirkar@gmail.com>, linux-usb@vger.kernel.org
Date:   Tue, 28 Jul 2020 10:47:10 +0200
In-Reply-To: <CALA_kER0exyKCO-QJRmzgXDr+iZgv1LnfwPOZKM=Z9CVf9oUNg@mail.gmail.com>
References: <CALA_kER0exyKCO-QJRmzgXDr+iZgv1LnfwPOZKM=Z9CVf9oUNg@mail.gmail.com>
Content-Type: text/plain
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


