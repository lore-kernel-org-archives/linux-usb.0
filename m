Return-Path: <SRS0=BFt0=5N=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A32C43331
	for <linux-usb@archiver.kernel.org>; Sat, 28 Mar 2020 15:35:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A9BE620748
	for <linux-usb@archiver.kernel.org>; Sat, 28 Mar 2020 15:35:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbgC1PfA (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 28 Mar 2020 11:35:00 -0400
Received: from netrider.rowland.org ([192.131.102.5]:38285 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727163AbgC1PfA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 Mar 2020 11:35:00 -0400
Received: (qmail 1680 invoked by uid 500); 28 Mar 2020 11:34:59 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 28 Mar 2020 11:34:59 -0400
Date:   Sat, 28 Mar 2020 11:34:59 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     John Donnelly <john.p.donnelly@oracle.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: ehci-pci :   WARNING: CPU: 0 PID: 347 at kernel/dma/direct.c:34
In-Reply-To: <F5A0CCCB-4503-40B1-A24D-323F5B89C1F4@oracle.com>
Message-ID: <Pine.LNX.4.44L0.2003281132180.1088-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 27 Mar 2020, John Donnelly wrote:

> Hi,
> 
> I am seeing this WARNING event with iommu=off when booting a DL380
> server with a 5.4.17 kernel.

> Has anyone seen this before ?

I suspect that the vast majority of users do not turn off their iommu.

Alan Stern

