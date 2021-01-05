Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB80C433E9
	for <linux-usb@archiver.kernel.org>; Tue,  5 Jan 2021 12:50:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9773E22AAA
	for <linux-usb@archiver.kernel.org>; Tue,  5 Jan 2021 12:50:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728983AbhAEMuV (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 5 Jan 2021 07:50:21 -0500
Received: from mx2.suse.de ([195.135.220.15]:41290 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728006AbhAEMuV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Jan 2021 07:50:21 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 487B0AD0B;
        Tue,  5 Jan 2021 12:49:39 +0000 (UTC)
Message-ID: <f66f965e30ab44bb3a9a2c0f63383e603011932d.camel@suse.de>
Subject: Re: [PATCH] usb: uas: Add PNY USB Portable SSD to unusual_uas
From:   Oliver Neukum <oneukum@suse.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        usb-storage@lists.one-eyed-alien.net
Cc:     stable@vger.kernel.org, linux-usb@vger.kernel.org
Date:   Tue, 05 Jan 2021 13:49:35 +0100
In-Reply-To: <2edc7af892d0913bf06f5b35e49ec463f03d5ed8.1609819418.git.Thinh.Nguyen@synopsys.com>
References: <2edc7af892d0913bf06f5b35e49ec463f03d5ed8.1609819418.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 04.01.2021, 20:07 -0800 schrieb Thinh Nguyen:
> Here's another variant PNY Pro Elite USB 3.1 Gen 2 portable SSD that
> hangs and doesn't respond to ATA_1x pass-through commands. If it doesn't
> support these commands, it should respond properly to the host. Add it
> to the unusual uas list to be able to move forward with other
> operations.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Acked-by: Oliver Neukum <oneukum@suse.com>

