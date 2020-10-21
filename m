Return-Path: <SRS0=msI8=D4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3362C4363A
	for <linux-usb@archiver.kernel.org>; Wed, 21 Oct 2020 23:45:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 727742417F
	for <linux-usb@archiver.kernel.org>; Wed, 21 Oct 2020 23:45:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=aj.id.au header.i=@aj.id.au header.b="SmG5aEgu";
	dkim=temperror (0-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kT0m4UXZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2507263AbgJUXpH (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 21 Oct 2020 19:45:07 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:42257 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2411158AbgJUXpH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Oct 2020 19:45:07 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 6A5FC5C06A1;
        Wed, 21 Oct 2020 19:45:06 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Wed, 21 Oct 2020 19:45:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to
        :subject:content-type; s=fm1; bh=aAZlJf0Hxtfg2M5mJloVMqcRdHoOe12
        2nXpkdXv+its=; b=SmG5aEgu2ozzsG17xXomkPZWe+6yfPjj7J21WlNbBHzjKsX
        5sSlFTbFpQdnV7O7QjTMnRh6XaFX8Fnz7xQMxKxXR8sdmXunRcy48e7CJ/0XX5Mb
        F+72QQxRSFXz3SPFoQ0kaS6zP+PzvGZ3AevzHpSnQQLxP+Xhp/lJbrgo9dfjW+fO
        CKSa6A1CJZlJqILZfevtfeaznppx1VvbkTxeVw9zIWpL2ZletjGafoRT6Y2vQUQw
        sKvtWU9W9JFzW7E5QeKMQE042AP3kLj8GsCQzEowP1i1IvsAcILRHxN3PSdEGJ5h
        PPp1qRu6g8wvSEgal8iq5qGbNoDy3iCOq1G5/Jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=aAZlJf
        0Hxtfg2M5mJloVMqcRdHoOe122nXpkdXv+its=; b=kT0m4UXZzQ8m1G4pEYZQta
        /6yblKlFZZB4U6EGzArklWI9fNUZXgP2HDhXESfT6QTaVUFNK/rZ2ISyHQrORULb
        tD2ug8ZVHqSFf1pHisu3f7hBXlMkmAzFbd7eyy4wBcyrVdARQ2AtNsQwu7vAd9S/
        tTDCQdPNEnhhRc9psE3lFaJbzURvM+8K1mua6Hr+u6Xg6wc4MxAM33+pM9lczM6n
        KJZQETSQKbdlo6Xb3y6KAcF/zFwxcdiYwU8Z0TmybxyOA57uYI9iUsCmAWJMaL84
        szgOn6rxIwnGfTUBIDTipi6TZr/qEOH+TiXF8a8zZ+CNd/Z4bVPP6cCG2up5QfyQ
        ==
X-ME-Sender: <xms:AciQX84RwWqEwhdRgSRxevUEHu1C3Ivq2FSBhuaSkBOBRI5UjEGIVg>
    <xme:AciQX97EEUDKth8lAOiHQIVqkAUAJJcmMmADE0EKup7l4bnqbis8uxHJ-psrOPCF-
    FMtwgHmewgeEb5YZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeeigddvfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
    veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:AciQX7eeeDZqD-9r-jvUTLqKCDAt0hzx_UKPQHU3yLRtu38rFe7mCw>
    <xmx:AciQXxJqi9doGP0lLg9S8FEqXJKzB9EUFh32RfoTdJJDxSccapCgRg>
    <xmx:AciQXwIahKi5qJLUHuqEjSil-Svd0s8SYhOTOGjM-XW3CknanH0H5w>
    <xmx:AsiQX4-G7pnH-FRK2-O0B_rOQksBoB0bXMSXqQcFfRoIYacC-I_3bQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id D4469E00B8; Wed, 21 Oct 2020 19:45:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-502-gfef6c88-fm-20201019.001-gfef6c888
Mime-Version: 1.0
Message-Id: <fb508440-62dc-49d2-b252-7c65dd6696fe@www.fastmail.com>
In-Reply-To: <HK0PR06MB3380D499BCF164951167FCE2F2070@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20200930040823.26065-4-ryan_chen@aspeedtech.com>
 <20201009024937.11246-1-ryan_chen@aspeedtech.com>
 <20201009024937.11246-4-ryan_chen@aspeedtech.com>
 <4efff4e7-27e0-35be-c112-5377f222a478@gmail.com>
 <HK0PR06MB3380D499BCF164951167FCE2F2070@HK0PR06MB3380.apcprd06.prod.outlook.com>
Date:   Thu, 22 Oct 2020 10:14:44 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Ryan Chen" <ryan_chen@aspeedtech.com>,
        "Sergei Shtylyov" <sergei.shtylyov@gmail.com>,
        "Joel Stanley" <joel@jms.id.au>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        BMC-SW <BMC-SW@aspeedtech.com>,
        "Alan Stern" <stern@rowland.harvard.edu>
Subject: Re: [PATCH v2 3/3] ARM: dts: add ehci uhci enable in evb dts
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Ryan,

On Mon, 12 Oct 2020, at 11:13, Ryan Chen wrote:
> Hello Segei,
> 
> > -----Original Message-----
> > From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
> > Sent: Friday, October 9, 2020 4:23 PM
> > To: Ryan Chen <ryan_chen@aspeedtech.com>; Joel Stanley <joel@jms.id.au>;
> > Andrew Jeffery <andrew@aj.id.au>; linux-arm-kernel@lists.infradead.org;
> > linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org;
> > linux-usb@vger.kernel.org; BMC-SW <BMC-SW@aspeedtech.com>; Alan Stern
> > <stern@rowland.harvard.edu>
> > Subject: Re: [PATCH v2 3/3] ARM: dts: add ehci uhci enable in evb dts
> > 
> > HEllo!
> > 
> > On 09.10.2020 5:49, Ryan Chen wrote:
> > 
> > > Add EHCI UHCI enable build in aspeed-ast2600-evb.dts
> > 
> >     Enable ECHI/UHCI for the  Aspeed AST2600 EVB, perhaps?
> > 
> 
> Yes, it is enable for AST2600 EVB. 

I think Sergei was suggesting you change the wording of the commit message.

Andrew
