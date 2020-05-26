Return-Path: <SRS0=xrMi=7I=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE3DC433DF
	for <linux-usb@archiver.kernel.org>; Tue, 26 May 2020 08:28:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CF70207D8
	for <linux-usb@archiver.kernel.org>; Tue, 26 May 2020 08:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590481707;
	bh=oCMzAwCOpzidHmx+D3i0UgW9PyUvkrPjRh0awAS7XBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=e3fGkwPlTo+JhmS7c+I5NtIujme4Vnm24AG/pG/O7kMew4JaGv3ZjISqm3o/ykv6v
	 m0iHF/ILbOGno9feA2L/RtXsBcghLrlNqjisNhZaZtbvl/BQuRsYecW6sj2qGHGlv8
	 6lNen5MrmEVUOF9cDRGWHRma06ujn6LuSRp56lL4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729605AbgEZI21 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 26 May 2020 04:28:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:49962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727879AbgEZI20 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 May 2020 04:28:26 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 09D342071A;
        Tue, 26 May 2020 08:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590481706;
        bh=oCMzAwCOpzidHmx+D3i0UgW9PyUvkrPjRh0awAS7XBU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kjIQ4/Ul3QLo9KFxaJOGiLie1F+wG+2i0KyHoq6TKANmGG6MDmEKFJD7zy+PQnCJB
         0CUQ6R6n2EAKGcZ0qyAwe+JAv6VOv19BpG15l9YWAL8DYsWr02SdO1v/GDPXQMhAh9
         fKitkq5UOP/YvYJyc7UdaH0jTuhBQRRlaOJa6Pf8=
Date:   Tue, 26 May 2020 10:28:04 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [GIT PULL] usb: chipidea: changes for v5.8-rc1
Message-ID: <20200526082804.GA2717070@kroah.com>
References: <20200526024024.GC27933@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526024024.GC27933@b29397-desktop>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 26, 2020 at 02:39:59AM +0000, Peter Chen wrote:
> Hi Greg,
> 
> Below are the changes for this merge window, and all patches are at
> my tree several weeks, no issues are reported.
> 
> 
> 
> The following changes since commit 62d65bdd9d05158aa2547f8ef72375535f3bc6e3:
> 
>   USB: cdc-acm: restore capability check order (2020-03-27 16:24:16 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-ci-v5.8-rc1

Pulled and pushed out,t hanks.

greg k-h
