Return-Path: <SRS0=W/rD=DC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD3DC4727D
	for <linux-usb@archiver.kernel.org>; Fri, 25 Sep 2020 14:37:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24AE722B2D
	for <linux-usb@archiver.kernel.org>; Fri, 25 Sep 2020 14:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601044658;
	bh=w9JLWJ3is5Y5htkAVUKawbku7ubLpo76wBngNu+UqFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=LIFh2xyqXoSQdPFTTTdZbI+tKQC0bmahMuudarAFhQ/FOb809o5VRGlbjVp5T7Ht9
	 VyycC/BGd2CHU/yqdHuHCo2Lk23TnpFzEvuX8VdGoS7vTf50Y/9k7epwB8SV2qY4ko
	 iyVy5SFc3ck7X2vB59eDnhrAaySQEUz8USYDCAXc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729015AbgIYOhh (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 25 Sep 2020 10:37:37 -0400
Received: from forward5-smtp.messagingengine.com ([66.111.4.239]:58649 "EHLO
        forward5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728038AbgIYOhg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Sep 2020 10:37:36 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailforward.nyi.internal (Postfix) with ESMTP id 791531941B0D;
        Fri, 25 Sep 2020 10:37:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 25 Sep 2020 10:37:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=F+sSoU
        4T/RQlH9y5VmvFwMP7SGHsKCvz95HD9AZtDAg=; b=vhLCqXHeC0K2n3jj1K4Bas
        78fPMPSfhpTjAgYc1zKuD9Wpum/Vp+ltfIW8ge+gXdK2Gl/HE50z65G5j3c7lKii
        6DLkYSTUKfoJvHO/LB7+eWJ2os97H21SKDSC/uYXMI9eAyTIwcsIcdKCQ1kS59YH
        6NP1XaFvWgZfG6pCLI4ewSeGeYLIOyA9qUzSLBNFu9ms1JL1STLTiC3XIwep1WBq
        ENpyWASOELQVvQBzLxLw00V0dH01ZjwXNq6KtsWzSrtPiBTERmWZPdPM3y5EKlOO
        IuwvSvMkMrLC02J7quuKDZdWfILYnoXL7U+e2hx3W2JPauHKu/jaJzt3iJZMRcTg
        ==
X-ME-Sender: <xms:rwBuX59Hn3Clb2lcGd4oMOOunzvfXCAy9MOaYHv_RviwGeJrvZH1Tw>
    <xme:rwBuX9t0tD6-Kv2x2KUSiioW1HB7w5CpEXvVOvQa0i9lvKF92reARPUmwCcLiBxrn
    O8IXTk6EOlZ6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvghfmjfeslhhinhhugihfohhunhgurghtihhonhdrohhrgheqnecuggftrf
    grthhtvghrnheptedvleegfffguddtledvvddtteffjeetgfevveeugefgleelhfevveef
    udeuuddvnecukfhppeekfedrkeeirdejgedrieegnecuvehluhhsthgvrhfuihiivgepud
    enucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:rwBuX3DbFm_Mi2hymqvfNF56ZUrRBORwO1rUtAkboUye7vXLN_tF-w>
    <xmx:rwBuX9d6BYYNinfNUEEVk99bq0Mr4BFpNYYzNBXnBmtG7gI6vhOMcA>
    <xmx:rwBuX-M7Kun3kmI4JwFodtFsJYRdgBU0-ayhgO7IE4R3jSuReZTZ3A>
    <xmx:rwBuXw1qahPmnhEOsc0i-OizxvjxI_iKbBMfPXE3bPCx1PQGnoq-rw>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 048043280068;
        Fri, 25 Sep 2020 10:37:34 -0400 (EDT)
Date:   Fri, 25 Sep 2020 16:37:50 +0200
From:   Greg KH <gregKH@linuxfoundation.org>
To:     Petko Manolov <petkan@nucleusys.com>
Cc:     oneukum@suse.com, linux-usb@vger.kernel.org,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: Re: [PATCH 2/2] net: rtl8150: convert control messages to the new
 send/recv scheme.
Message-ID: <20200925143750.GB3111407@kroah.com>
References: <20200923134348.23862-9-oneukum@suse.com>
 <20200925093124.22483-1-petkan@nucleusys.com>
 <20200925093124.22483-3-petkan@nucleusys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200925093124.22483-3-petkan@nucleusys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 25, 2020 at 12:31:24PM +0300, Petko Manolov wrote:
> From: Petko Manolov <petko.manolov@konsulko.com>
> 
> Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>

Again, a changelog is good.

thanks,

greg k-h
