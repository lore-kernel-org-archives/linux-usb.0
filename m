Return-Path: <SRS0=ufF8=5Q=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0660CC43331
	for <linux-usb@archiver.kernel.org>; Tue, 31 Mar 2020 18:21:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE4182145D
	for <linux-usb@archiver.kernel.org>; Tue, 31 Mar 2020 18:21:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgCaSVM (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 31 Mar 2020 14:21:12 -0400
Received: from netrider.rowland.org ([192.131.102.5]:52803 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726194AbgCaSVM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Mar 2020 14:21:12 -0400
Received: (qmail 18452 invoked by uid 500); 31 Mar 2020 14:21:11 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 31 Mar 2020 14:21:11 -0400
Date:   Tue, 31 Mar 2020 14:21:11 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     John Donnelly <john.p.donnelly@oracle.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: ehci-pci : WARNING: CPU: 0 PID: 347 at kernel/dma/direct.c:34
In-Reply-To: <86E5B81F-DD9D-42E8-A687-D4593FA734AE@oracle.com>
Message-ID: <Pine.LNX.4.44L0.2003311413040.17645-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 31 Mar 2020, John Donnelly wrote:

> Hi ,
> 
>  One more follow up question.
> 
> How does a X86 kernel know where to look for USB buses/control
> registers ?  I am aware PowerPC has a device-tree that is passed by
> reference from UBoot that contains known devices.

Some of the information comes from ACPI tables in the BIOS.  Other
parts of it come from the components on the motherboard (for example,
devices attached to a PCI bus can be discovered directly by the
system).

> For the BCM device :
> 
>    Bus 03.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
> 
> Is there a corresponding register set I can examine ?

Yes.  For example, you can look at the files under 
/sys/kernel/debug/usb/uhci/.  You can also use lspci and other related 
PCI utilities.

Alan Stern

