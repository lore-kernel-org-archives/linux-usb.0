Return-Path: <SRS0=d1pO=YH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE33C4CECE
	for <linux-usb@archiver.kernel.org>; Mon, 14 Oct 2019 12:21:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 513B9206A3
	for <linux-usb@archiver.kernel.org>; Mon, 14 Oct 2019 12:21:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730294AbfJNMVJ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 14 Oct 2019 08:21:09 -0400
Received: from mx2.suse.de ([195.135.220.15]:36796 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726169AbfJNMVJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 14 Oct 2019 08:21:09 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id B39FBBE29;
        Mon, 14 Oct 2019 12:21:08 +0000 (UTC)
Message-ID: <1571055657.19529.18.camel@suse.com>
Subject: Re: Etron EJ168A controller
From:   Oliver Neukum <oneukum@suse.com>
To:     Kenneth <x.xeroid@gmail.com>, linux-usb@vger.kernel.org
Date:   Mon, 14 Oct 2019 14:20:57 +0200
In-Reply-To: <38481a5a-4ea5-a166-917a-98dfa1accad8@gmail.com>
References: <91b55846-130e-a0b7-c516-5fa49ad60067@gmail.com>
         <38481a5a-4ea5-a166-917a-98dfa1accad8@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 09.10.2019, 11:57 -0700 schrieb Kenneth:
> Hi,
> 
> I was informed that there were bug fixes for the Etron EJ168A controller in kernel 5.2 and 5.3
> 
> While I can read most USB sticks, if I connect an android phone to this port, applications hang trying to access the phone.

Hi,

you will need to provide log files. A simple report of this kind
cannot be acted upon as no developer can replicate it.

	Regards
		Oliver

