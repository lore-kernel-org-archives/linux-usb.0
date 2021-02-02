Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44821C433DB
	for <linux-usb@archiver.kernel.org>; Tue,  2 Feb 2021 17:07:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0046B64E40
	for <linux-usb@archiver.kernel.org>; Tue,  2 Feb 2021 17:07:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237136AbhBBRHt (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 2 Feb 2021 12:07:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:38838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236251AbhBBRDK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Feb 2021 12:03:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB77764E3F;
        Tue,  2 Feb 2021 17:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612285350;
        bh=vShd7+cb5pp0bA/+ugFfSTJGZlioUUJwNB8HjU7rk8s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=noj57vcKzMZkNjFaIIB+fHFxukrP6JEBsELOZVlHdBtTSE1N9zK4Gige0McIEf4L+
         hlUwJoOhidTh/cvdigaRfWak/Fv3Liiyh2xI8MFSQ/nsLDafiZq70YmioSmd0lLe3W
         gLo10tTKEmH8ZvgW5f8FOonSI2iprX+7q1Zarhuk=
Date:   Tue, 2 Feb 2021 18:02:27 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Benson Leung <bleung@chromium.org>
Cc:     heikki.krogerus@linux.intel.com, enric.balletbo@collabora.com,
        pmalani@chromium.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, kyletso@google.com, bleung@google.com
Subject: Re: [PATCH v2] platform/chrome: cros_ec_typec: Fix call to
 typec_partner_set_pd_revision
Message-ID: <YBmFo5L1eeUwCJ9B@kroah.com>
References: <20210202164531.3982778-1-bleung@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210202164531.3982778-1-bleung@chromium.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 02, 2021 at 08:45:31AM -0800, Benson Leung wrote:
> typec_partner_set_pd_revision returns void now.
> 
> Fixes: cefc011f8daf ("platform/chrome: cros_ec_typec: Set Partner PD revision from status")
> Signed-off-by: Benson Leung <bleung@chromium.org>
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

What changed from "v1"?

