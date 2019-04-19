Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579EBC282DA
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:33:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2451B204EC
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555698799;
	bh=+O9Dr27C4GptV1wC4WAFMA7vT3TLB8qcu7QpFRHYt6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1/rtxZzF7/ThiOv5PL67LqHfmWRjKu8SKRpzlp+T0SvtFv94z/iyBmvFrXht6SqQg
	 V9E2jV6yeKu+wD+YBX6V9ksTw05780iBZ3BFtIaDER7RhZkyQG00OgLlcPAguDThc5
	 3lT5rk6lOEMd0TI/eq7m8TxftgOjCmzcccwz/dpU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbfDSSdN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:33:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:53888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727664AbfDSS3Q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 19 Apr 2019 14:29:16 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F2374218A6;
        Fri, 19 Apr 2019 08:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555662465;
        bh=+O9Dr27C4GptV1wC4WAFMA7vT3TLB8qcu7QpFRHYt6Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KjAFKKBZ+oVUCKWwBwqedKMIbnGr0Zj99wdvGcxnE/whby4Kh0Wg23ykJieaHWShL
         GqdwOovRlQuQ9TiRwYHtcBKUmeolSvZ2solS2wdChPZnQf0qNfmlV65Aw9vpBqteK1
         4ubP2e6uKZswWDiLIaHoHFKVz1YnIxnwO3lM8Z98=
Date:   Fri, 19 Apr 2019 10:27:43 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] USB: serial: digi_acceleport: clean up set_termios
Message-ID: <20190419082743.GB28648@kroah.com>
References: <20190418162020.23566-1-johan@kernel.org>
 <20190418162020.23566-2-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190418162020.23566-2-johan@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190419082743.PbDHE_-65XSjDkNoAar8LhEr_LmvPcq8aeLV9eReBaU@z>

On Thu, Apr 18, 2019 at 06:20:20PM +0200, Johan Hovold wrote:
> Clean up set_termios() by adding missing white space around operators
> and making a couple of continuation lines more readable.
> 
> Also drop a couple of redundant braces.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
