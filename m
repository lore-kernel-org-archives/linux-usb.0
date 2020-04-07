Return-Path: <SRS0=VZyl=5X=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD85C2BA80
	for <linux-usb@archiver.kernel.org>; Tue,  7 Apr 2020 13:53:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6534820731
	for <linux-usb@archiver.kernel.org>; Tue,  7 Apr 2020 13:53:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728768AbgDGNxo (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 7 Apr 2020 09:53:44 -0400
Received: from netrider.rowland.org ([192.131.102.5]:44739 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728596AbgDGNxo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Apr 2020 09:53:44 -0400
Received: (qmail 20535 invoked by uid 500); 7 Apr 2020 09:53:43 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 7 Apr 2020 09:53:43 -0400
Date:   Tue, 7 Apr 2020 09:53:43 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     John Donnelly <john.p.donnelly@oracle.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: ehci-pci : WARNING: CPU: 0 PID: 347 at kernel/dma/direct.c:34
In-Reply-To: <B2B359CC-66BA-476E-84C3-3D1F1A4B411C@oracle.com>
Message-ID: <Pine.LNX.4.44L0.2004070952350.19272-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 7 Apr 2020, John Donnelly wrote:

> Issue resolved - see below .

> This issue has been resolved in 5.6.0.rc1 ( and 5.6.0.rc6 ) with commit :
> 
> 9235cb13d7d1 iommu/vt-d: Allow devices with RMRRs to use identity domain
> 
> When I applied this to 5.4.17 release I get the iLO USB hub properly enumerated and
> the corresponding keyboard and mouse  ( when iommu=pt ) 

Okay, congratulations!

Alan Stern

