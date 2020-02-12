Return-Path: <SRS0=Zul1=4A=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74485C2BA83
	for <linux-usb@archiver.kernel.org>; Wed, 12 Feb 2020 13:19:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 37DA620873
	for <linux-usb@archiver.kernel.org>; Wed, 12 Feb 2020 13:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581513574;
	bh=Dm8KBP4tZLANhxx40m6/61H/JdRrAj9Jg1WuWwPxtw0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-ID:From;
	b=xUorM0p0jFOSchfdhiS+zAYTB2bZ14FbidfElB+oirbp0qd+xiZrf82EfxGbJW8Ej
	 551qoECPcY1YSzY6P0VFEHN9pmlwnly4rNQJJ6zMyHbEyWPDECaRnM5lEVCF8uYPDP
	 19jGleY1Zt35M3N6OnQIUfBdkYeeYDJpxtNu87Og=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727582AbgBLNTd (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 12 Feb 2020 08:19:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:46226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726728AbgBLNTd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Feb 2020 08:19:33 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E78AC2073C;
        Wed, 12 Feb 2020 13:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581513572;
        bh=Dm8KBP4tZLANhxx40m6/61H/JdRrAj9Jg1WuWwPxtw0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=lIwX5oepcA1AsEFn8gE7J49ZD9Z1prkvxIbmVg3zKl08/5x6tb8IV15Lv6bOJ2xpT
         gkPcISL5hJ2nXp39FWk9Hli0LSpCTv9Sw2Aqx6Gr6aOVHdYIDD+DmGwzAMmKz6YP7S
         oyHc/BDzMeDZZKJHhuXIAaE1V8lJKg9pm5wzuH7A=
Date:   Wed, 12 Feb 2020 14:19:29 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Johan Korsnes <jkorsnes@cisco.com>
cc:     linux-usb@vger.kernel.org,
        Armando Visconti <armando.visconti@st.com>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v2 1/2] HID: core: fix off-by-one memset in
 hid_report_raw_event()
In-Reply-To: <20200117120836.2354966-1-jkorsnes@cisco.com>
Message-ID: <nycvar.YFH.7.76.2002121419180.3144@cbobk.fhfr.pm>
References: <20200117120836.2354966-1-jkorsnes@cisco.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

both patches now applied, sorry for the delay.

-- 
Jiri Kosina
SUSE Labs

