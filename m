Return-Path: <SRS0=WR2x=EM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF834C4741F
	for <linux-usb@archiver.kernel.org>; Fri,  6 Nov 2020 06:52:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D597208C3
	for <linux-usb@archiver.kernel.org>; Fri,  6 Nov 2020 06:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604645545;
	bh=X8523SRlb0B8cb9nbsTjxIL7QpQ13u4iV4t+xiZKhQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=fF66QpNhpOeHPNUzI/rUyZs6hTq4koEAkPjfo0lmm0e6d8rf2Jbl/p3WkBgMso8aV
	 t3Rl3loR/EaJcc35rZM4MZkuO3auP2Sz1nv5QYcIkm/mtftbaS3MXslXKyYdPLu8jr
	 gKP//QgLjbf0dFFonwH6v2ZATw2WLYgZLuOC8JdI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbgKFGwW (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 6 Nov 2020 01:52:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:39842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725837AbgKFGwW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 6 Nov 2020 01:52:22 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B408120825;
        Fri,  6 Nov 2020 06:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604645541;
        bh=X8523SRlb0B8cb9nbsTjxIL7QpQ13u4iV4t+xiZKhQY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DQUK1TUxLMW+TwXCjkwanCL7cqQWLLOdZZMn59q8bhjy4GbsTc2PWp8xJVat+3/gT
         NIgGsOknAuJjPKlSa5RYcAXRFOm+BEPpmUOjQyM3S77mA8q/Cv0yEHQqgXDF8jRKdw
         F6GhEdFQulrsxqG1hkLM2w6oMOaXrV0+MgX9Tcoo=
Date:   Fri, 6 Nov 2020 07:52:17 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Wang Qing <wangqing@vivo.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: Use IS_ERR_OR_NULL() instead of IS_ERR()
Message-ID: <20201106065217.GE697514@kroah.com>
References: <1604633478-24729-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604633478-24729-1-git-send-email-wangqing@vivo.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 06, 2020 at 11:31:18AM +0800, Wang Qing wrote:
> __usb_find_phy may return NULL, so we should use IS_ERR_OR_NULL()

Again with the subject line, "USB: phy: ..."  And are you sure this
function can return NULL?

thanks,

greg k-h
