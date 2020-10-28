Return-Path: <SRS0=RaDd=EE=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762FCC56201
	for <linux-usb@archiver.kernel.org>; Thu, 29 Oct 2020 00:57:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CC7920796
	for <linux-usb@archiver.kernel.org>; Thu, 29 Oct 2020 00:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603933054;
	bh=H7DJdK1Yo737erzJ5O7+BOAHg02RlagPl5rQOq+A95g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=hLvxx4vPmqUG/LqRZzkjY2BYtUv3pdbpeCMyyejYVauvPBD0DHwpGZPVIAas1u1FQ
	 8pKfWf8PWEk5GBwU4LKY8nyG7BcAk6PmLlOmvftLUWiyGCJHTzX1aB0iXCupg0WRVJ
	 OPjP4x4m75ECsZ7CjLjIwkgbLXWFkCCG0+sF3rxk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728164AbgJ2A5c (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 28 Oct 2020 20:57:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:60512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731514AbgJ1WRf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:35 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D99B924683;
        Wed, 28 Oct 2020 09:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603875984;
        bh=H7DJdK1Yo737erzJ5O7+BOAHg02RlagPl5rQOq+A95g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W6DXGZJs4kAbR35v7AXXysnogm+wtEQiI7wE8ix44QYJ4W18rWsqgI+VyWaj9cIVc
         2j1P8eHM0/bCyMxAWevdqrD1EEsA5GYEjYp4hVoA27Kfc9+knuzXXwwiSQa74rnR5d
         Dum4xIOU2cKjddPRuqtFVdIS3DV3UxR/S78fuNbg=
Date:   Wed, 28 Oct 2020 10:07:16 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     pawell@cadence.com, rogerq@ti.com, balbi@kernel.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH v2 0/3] usb: cdns3: three bug fixes for v5.10
Message-ID: <20201028090716.GA1947336@kroah.com>
References: <20201022005505.24167-1-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201022005505.24167-1-peter.chen@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 22, 2020 at 08:55:02AM +0800, Peter Chen wrote:
> Changes for v2:
> - Move position of explicit cast to unsigned int before ((p) << 24) [Patch 1/3]
> - No changes for other patches.
> 
> Pawel Laszczak (1):
>   usb: cdns3: Fix on-chip memory overflow issue
> 
> Peter Chen (2):
>   usb: cdns3: gadget: suspicious implicit sign extension
>   usb: cdns3: gadget: own the lock wrongly at the suspend routine

Are you going to send me patches to queue up for this driver any time
soon?  I've seen lots of different ones fly by, but no "please take
this" type of hint to me, so I have no idea what to do at all...

thanks,

greg k-h
