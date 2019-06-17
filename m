Return-Path: <SRS0=mHtA=UQ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BCEC31E44
	for <linux-usb@archiver.kernel.org>; Mon, 17 Jun 2019 08:28:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA3722238C
	for <linux-usb@archiver.kernel.org>; Mon, 17 Jun 2019 08:28:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbfFQI25 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 17 Jun 2019 04:28:57 -0400
Received: from verein.lst.de ([213.95.11.211]:34118 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727502AbfFQI25 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Jun 2019 04:28:57 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 43DB068CF0; Mon, 17 Jun 2019 10:28:28 +0200 (CEST)
Date:   Mon, 17 Jun 2019 10:28:27 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Ming Lei <ming.lei@redhat.com>
Cc:     linux-scsi@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Hannes Reinecke <hare@suse.com>,
        Christoph Hellwig <hch@lst.de>, Jim Gill <jgill@vmware.com>,
        Cathy Avery <cavery@redhat.com>,
        "Ewan D . Milne" <emilne@redhat.com>,
        Brian King <brking@us.ibm.com>,
        James Smart <james.smart@broadcom.com>,
        "Juergen E . Fischer" <fischer@norbit.de>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Finn Thain <fthain@telegraphics.com.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-usb@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Benjamin Block <bblock@linux.ibm.com>
Subject: Re: [PATCH V4 11/16] scsi: aha152x: use sg helper to operate
 scatterlist
Message-ID: <20190617082827.GK7455@lst.de>
References: <20190617030349.26415-1-ming.lei@redhat.com> <20190617030349.26415-12-ming.lei@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617030349.26415-12-ming.lei@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
