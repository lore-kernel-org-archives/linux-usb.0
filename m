Return-Path: <SRS0=69Rx=ZK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87553C432C3
	for <linux-usb@archiver.kernel.org>; Mon, 18 Nov 2019 11:31:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5FE8B2084D
	for <linux-usb@archiver.kernel.org>; Mon, 18 Nov 2019 11:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574076693;
	bh=+jWfvLyq5TP65NzHy/snU+hK9A5O4w1qLhHWeQUIAKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=cWtR75X/BtMVrCE4hDllqOQ7k33aVIwVQp6Q+TcxfhhD/nUXiCGpkqZDxgSRwGvHA
	 mKbs4MYR8Ar2cVngb1LCzgtW1iEjetfdfWLp5xHARCDUeS3ZWctIYv2OEXzgyMWKVe
	 z/NEUJQ24AsCYrY4coayAMCsZlCqodoijoQlBDhw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfKRLbc (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 18 Nov 2019 06:31:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:43728 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726464AbfKRLbc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Nov 2019 06:31:32 -0500
Received: from localhost (unknown [89.205.134.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7116B2073A;
        Mon, 18 Nov 2019 11:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574076692;
        bh=+jWfvLyq5TP65NzHy/snU+hK9A5O4w1qLhHWeQUIAKA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k6u62zUHa10RorxtNzD5dYzAsRsRmTvE21tnbCnFTHQXIDlZlybDuH/uOtRPl2ztL
         ze3sjnr6FjfPzPVfVY2yxi3oHkJMRFgEA5q3x0HqCQJaqm52FIc3E2TrWOAfTvFoja
         zPOiC2aOg3fFlYf4hR2Zy+xKmOUwr9pCRd0JyG3M=
Date:   Mon, 18 Nov 2019 12:31:17 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [GIT PULL] usb: chipidea: changes for v5.5-rc1
Message-ID: <20191118113117.GA182126@kroah.com>
References: <20191118100020.GA10641@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191118100020.GA10641@b29397-desktop>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 18, 2019 at 10:00:22AM +0000, Peter Chen wrote:
> The following changes since commit a079973f462a3d506c6a7f00c770a55b167ed094:
> 
>   usb: typec: tcpm: Remove tcpc_config configuration mechanism (2019-11-16 14:45:31 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-ci-v5.5-rc1
> 

Pulled and pushed out, thanks.

greg k-h
