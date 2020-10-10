Return-Path: <SRS0=wmHi=DR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119A8C352BA
	for <linux-usb@archiver.kernel.org>; Sat, 10 Oct 2020 22:51:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8DC5215A4
	for <linux-usb@archiver.kernel.org>; Sat, 10 Oct 2020 22:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602370308;
	bh=d0LFuyXXJbRxphXVoTE7xJapgi4yM0kVr93JTctrCqc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=EzPX61QdPJnWT04tWfYETQS5Q5u4CIdLDmW7omSmtQ8qx1rE+RK8o+G4//2slclXh
	 9o1LP7nOm+Gg/M9XU1FK1JnSW3p/tPTFyeYDhQoZ+Z17zaOTUTAWSfCMBDPMELPuVS
	 BlK+Avyl+mG+JlKeOOisldPbJcg/fhfjy4k3HQz0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731740AbgJJWWF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 10 Oct 2020 18:22:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:54030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731883AbgJJTh4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 10 Oct 2020 15:37:56 -0400
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown [163.114.132.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 49131221FE;
        Sat, 10 Oct 2020 17:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602349428;
        bh=d0LFuyXXJbRxphXVoTE7xJapgi4yM0kVr93JTctrCqc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nif7FEXAZPFBPMgF+HoD/XN8C3N3jzWD+luDeDHzdcoHuFElMVxv2+DtBRzbsp+Hi
         ff7M7YsK8mSPltbzzjTZ5G10WFGrbxs7vIx2TqN6xsiks5aA6gHgh4wmB2XP+dqrSw
         5lD2YnIGYc6KQzz0Z8t05rBRMn5gCTxmMMpEnaXI=
Date:   Sat, 10 Oct 2020 10:03:46 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Anant Thazhemadam <anant.thazhemadam@gmail.com>
Cc:     linux-kernel-mentees@lists.linuxfoundation.org,
        Oliver Neukum <oneukum@suse.com>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: usb: usbnet: update  __usbnet_{read|write}_cmd()
 to use new API
Message-ID: <20201010100346.158cbf62@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201010065623.10189-1-anant.thazhemadam@gmail.com>
References: <20201010065623.10189-1-anant.thazhemadam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 10 Oct 2020 12:26:23 +0530 Anant Thazhemadam wrote:
> GPF_KERNEL

You haven't even built this, let alone tested :/
